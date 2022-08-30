import 'package:design_sample/shared/constants/image_urls.dart';
import 'package:design_sample/shared/constants/sizes.dart';
import 'package:design_sample/shared/theme/colors.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../shared/constants/string_keys.dart';

enum TabType { Hot, Discover, Watch, Inbox, Profile }

class BottomBar extends StatelessWidget {
  final double barHeight = 68.0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: barHeight,
      child: BottomNavigationBar(
        currentIndex: 0,
        items: [
          _buildBottomBarItem(TabType.Hot),
          _buildBottomBarItem(TabType.Discover),
          _buildBottomBarItem(TabType.Watch),
          _buildBottomBarItem(TabType.Inbox),
          _buildBottomBarItem(TabType.Profile),
        ],
      ),
    );
  }

  BottomNavigationBarItem _buildBottomBarItem(TabType barType) {
    var icon;
    var label;

    switch (barType) {
      case TabType.Hot:
        label = StringKeys.homepageKeys.hotTabLabel.tr();
        icon = ImageUrls.icons.hotIcon;

        break;
      case TabType.Discover:
        label = StringKeys.homepageKeys.discoverTabLabel.tr();
        icon = ImageUrls.icons.discoverIcon;

        break;
      case TabType.Watch:
        label = StringKeys.homepageKeys.watchTabLabel.tr();
        icon = ImageUrls.icons.watchIcon;

        break;
      case TabType.Inbox:
        label = StringKeys.homepageKeys.inboxTabLabel.tr();
        icon = ImageUrls.icons.inboxIcon;

        break;
      case TabType.Profile:
        label = StringKeys.homepageKeys.profileTabLabel.tr();
        icon = ImageUrls.icons.profileIcon;

        break;
    }
    return BottomNavigationBarItem(
      icon: Image.asset(icon),
      label: label,
      backgroundColor: ThemeColors.black.withOpacity(0.9),
    );
  }
}
