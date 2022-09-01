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
      child: Column(
        children: [
          //! Gif asset has too big padding on sides,
          //! hence defining specific size from the Figma design makes it too small
          Image.asset(ImageUrls.images.verificationGif),
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
        ],
      ),
    );
  }

  Widget _buildActionButton() {
    // I tried using exact values from Figma but it didn't look as pictured
    // So I experimented with values in order to get as close as possible
    final borderDecoration = BoxDecoration(
      borderRadius: Sizes.cornerRadius.extraLarge,
      gradient: LinearGradient(
        begin: Alignment(0.5, 0),
        end: Alignment(0.5, 1),
        colors: [ThemeColors.yellow, ThemeColors.darkYellow],
      ),
    );

    final primaryDecoration = BoxDecoration(
      gradient: LinearGradient(
        colors: [ThemeColors.yellow, ThemeColors.darkYellow],
        begin: Alignment(0.5, 0),
        end: Alignment(0.5, 1),
      ),
      borderRadius: Sizes.cornerRadius.extraLarge,
    );

    final secondaryDecoration = BoxDecoration(
      borderRadius: Sizes.cornerRadius.extraLarge,
      gradient: LinearGradient(
        colors: [
          ThemeColors.yellow.withOpacity(0.9),
          ThemeColors.black.withOpacity(0.5),
        ],
        begin: Alignment(0.5, -1.2),
        end: Alignment(0.5, -0.5),
      ),
      boxShadow: [
        BoxShadow(
          color: ThemeColors.black.withOpacity(0.05),
          blurRadius: 80,
        ),
        BoxShadow(
          color: ThemeColors.black.withOpacity(0.15),
          blurRadius: 4,
        ),
      ],
    );

    return Container(
      padding: EdgeInsets.all(Sizes.borders.small),
      decoration: borderDecoration,
      child: Container(
        decoration: primaryDecoration,
        child: Container(
          decoration: secondaryDecoration,
          child: MaterialButton(
              padding: EdgeInsets.all(Sizes.padding.extraSmall),
              onPressed: null,
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: Sizes.padding.medium),
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
                      style: ThemeTextStyles.body.button,
                    ),
                  ],
                ),
              )),
        ),
      ),
    );
  }
}
