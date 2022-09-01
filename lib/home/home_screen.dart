import 'package:design_sample/home/widgets/playlist_card.dart';

import 'package:design_sample/home/widgets/bottom_nav_bar.dart';
import 'package:design_sample/home/widgets/discord_cta_widget.dart';
import 'package:design_sample/shared/constants/image_urls.dart';
import 'package:design_sample/shared/constants/string_keys.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../shared/constants/sizes.dart';
import '../shared/theme/colors.dart';
import '../shared/theme/theme_text_styles.dart';

class HomeScreen extends StatelessWidget {
  final double topBottomPadding = 40.0;
  final double bottomContentPadding = 94.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle.light,
        backgroundColor: ThemeColors.black,
        elevation: 0,
        toolbarHeight: 0,
      ),
      body: SafeArea(
        bottom: false,
        child: Stack(
          children: [
            Container(
              color: ThemeColors.black,
              padding: EdgeInsets.fromLTRB(
                Sizes.padding.medium,
                topBottomPadding,
                Sizes.padding.medium,
                0,
              ),
              child: _buildScreenContent(),
            ),
            Align(
              child: BottomBar(),
              alignment: Alignment.bottomCenter,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildScreenContent() {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Column(
        children: [
          _buildTitle(),
          SizedBox(height: Sizes.padding.extraLarge),
          PlaylistCard(
            imageUrl: ImageUrls.images.image1,
            currentViews: 15,
            details: '+10 New Videos',
            maxViews: 30,
            title: 'Smash Stockpile',
            viewProgress: 0.4,
          ),
          SizedBox(height: Sizes.padding.extraLarge),
          PlaylistCard(
            imageUrl: ImageUrls.images.image2,
            currentViews: 0,
            details: '+18 New Videos',
            maxViews: 18,
            title: 'FGC Rumble',
            viewProgress: 0,
          ),
          SizedBox(height: Sizes.padding.extraLarge),
          PlaylistCard(
            imageUrl: ImageUrls.images.image3,
            currentViews: 21,
            details: '+21 New Videos',
            maxViews: 21,
            title: 'Valorant Volume',
            viewProgress: 1,
            hasUnwatchedVideos: false,
          ),
          DiscordCTAWidget(),
          SizedBox(height: bottomContentPadding),
        ],
      ),
    );
  }

  Widget _buildTitle() {
    var gradient = LinearGradient(colors: [ThemeColors.yellow, ThemeColors.red]);

    var gradientTitle = ShaderMask(
      blendMode: BlendMode.srcIn,
      shaderCallback: (bounds) => gradient.createShader(
        Rect.fromLTWH(0, 0, bounds.width, bounds.height),
      ),
      child: Text(
        StringKeys.homepageKeys.hotTabTitle.tr(),
        style: ThemeTextStyles.headers.extraLarge,
      ),
    );

    return Row(
      children: [
        gradientTitle,
        Text(
          StringKeys.homepageKeys.emojiPart.tr(),
          style: ThemeTextStyles.headers.extraLarge,
        ),
      ],
    );
  }
}
