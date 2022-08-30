import 'package:design_sample/shared/widgets/svg_icon_widget.dart';
import 'package:design_sample/shared/constants/image_urls.dart';
import 'package:design_sample/shared/constants/string_keys.dart';
import 'package:design_sample/shared/theme/colors.dart';
import 'package:design_sample/shared/theme/theme_text_styles.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../shared/constants/sizes.dart';

class DiscordCTAWidget extends StatelessWidget {
  final double _topButtonPadding = 40.0;
  final double _labelsSpacing = 8.0;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(children: [
        Image.asset(ImageUrls.images.verificationGif, fit: BoxFit.cover),
        Text(
          StringKeys.homepageKeys.checkBackSoonLabel.tr(),
          style: ThemeTextStyles.headers.large,
          textAlign: TextAlign.center,
        ),
        SizedBox(height: _labelsSpacing),
        Text(
          StringKeys.homepageKeys.joinDiscordLabel.tr(),
          style: ThemeTextStyles.body.large,
        ),
        SizedBox(height: _topButtonPadding),
        _buildActionButton(),
      ]),
    );
  }

  Widget _buildActionButton() {
    var kGradientBoxDecoration = BoxDecoration(
      //RENAME
      gradient: LinearGradient(
        begin: Alignment(1, 0),
        end: Alignment(1, 1),
        colors: [
          ThemeColors.yellow,
          ThemeColors.darkYellow,
        ],
      ),
      borderRadius: Sizes.cornerRadius.extraLarge,
    );

    return Container(
      decoration: kGradientBoxDecoration,
      child: MaterialButton(
          padding: EdgeInsets.all(1),
          onPressed: () {},
          child: Ink(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment(1, -0.99),
                end: Alignment(1, 0.9),
                colors: [ThemeColors.yellow, ThemeColors.darkYellow],
              ),
              borderRadius: Sizes.cornerRadius.extraLarge,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgIconWidget(
                  ImageUrls.icons.discordIcon,
                  size: Sizes.icon.medium,
                ),
                SizedBox(width: Sizes.padding.small),
                Text(
                  StringKeys.homepageKeys.discordButtonLabel.tr(),
                  style: ThemeTextStyles.headers.medium,
                ),
              ],
            ),
          )),
    );
  }
}
