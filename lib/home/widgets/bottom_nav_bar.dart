import 'dart:ui';

import 'package:design_sample/shared/constants/image_urls.dart';
import 'package:design_sample/shared/constants/sizes.dart';
import 'package:design_sample/shared/theme/colors.dart';
import 'package:design_sample/shared/theme/theme_text_styles.dart';
import 'package:design_sample/shared/widgets/svg_icon_widget.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../shared/constants/string_keys.dart';

enum TabType { Hot, Discover, Watch, Inbox, Profile }

class BottomBar extends StatefulWidget {
  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  final double barHeight = 56.0;
  final double barRadius = 24.0;

  var _selectedTab = 0;

  @override
  Widget build(BuildContext context) {
    // Devices with notch need additional padding
    var bottomPadding = 0.0;
    if (MediaQuery.of(context).viewPadding.bottom != 0) {
      bottomPadding = MediaQuery.of(context).viewPadding.bottom;
    } else {
      bottomPadding = Sizes.padding.extraSmall;
    }

    return ClipRRect(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(barRadius),
        topRight: Radius.circular(barRadius),
      ),
      child: Container(
        color: ThemeColors.black.withOpacity(0.9),
        padding: EdgeInsets.only(bottom: bottomPadding, top: Sizes.padding.extraSmall),
        height: barHeight + bottomPadding + Sizes.padding.extraSmall,
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 6, sigmaY: 6),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildBottomBarItem(TabType.Hot),
              _buildBottomBarItem(TabType.Discover),
              _buildBottomBarItem(TabType.Watch),
              _buildBottomBarItem(TabType.Inbox),
              _buildBottomBarItem(TabType.Profile),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBottomBarItem(TabType barType) {
    var iconWidget;
    var label;
    var index;

    final iconSize = Sizes.icon.large;

    switch (barType) {
      case TabType.Hot:
        label = StringKeys.homepageKeys.hotTabLabel.tr();
        index = 0;
        iconWidget = SvgIconWidget(
          ImageUrls.icons.hotIcon,
          color: _selectedTab == 0 ? ThemeColors.yellow : ThemeColors.inactiveGrey,
          size: Sizes.icon.extraLarge,
        );
        break;
      case TabType.Discover:
        label = StringKeys.homepageKeys.discoverTabLabel.tr();
        index = 1;
        iconWidget = SvgIconWidget(
          ImageUrls.icons.discoverIcon,
          color: _selectedTab == 1 ? ThemeColors.yellow : ThemeColors.inactiveGrey,
          size: iconSize,
        );
        break;
      case TabType.Watch:
        label = StringKeys.homepageKeys.watchTabLabel.tr();
        index = 2;
        iconWidget = SvgIconWidget(
          ImageUrls.icons.watchIcon,
          color: _selectedTab == 2 ? ThemeColors.yellow : ThemeColors.inactiveGrey,
          size: iconSize,
        );
        break;
      case TabType.Inbox:
        label = StringKeys.homepageKeys.inboxTabLabel.tr();

        iconWidget = SvgIconWidget(
          ImageUrls.icons.inboxIcon,
          color: _selectedTab == 3 ? ThemeColors.yellow : ThemeColors.inactiveGrey,
          size: iconSize,
        );
        break;
      case TabType.Profile:
        label = StringKeys.homepageKeys.profileTabLabel.tr();

        iconWidget = Image.asset(
          ImageUrls.icons.profileIcon,
          width: iconSize,
          height: iconSize,
          fit: BoxFit.fill,
        );
        break;
    }

    return _buildBarButton(index, label, iconWidget, iconWidget);
  }

  Widget _buildBarButton(int index, String label, Widget activeIcon, Widget inactiveIcon) {
    var isSelected = index == _selectedTab;

    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        isSelected
            ? Container(
                child: activeIcon,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: ThemeColors.yellow.withOpacity(0.6),
                      blurRadius: 30,
                      spreadRadius: 1,
                      offset: Offset(0, 61),
                    ),
                  ],
                ),
              )
            : inactiveIcon, // icon
        Text(
          label,
          style: ThemeTextStyles.body.small.copyWith(color: isSelected ? ThemeColors.yellow : Colors.transparent),
        ), // text
      ],
    );
  }
}
