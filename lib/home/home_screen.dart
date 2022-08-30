import 'package:design_sample/home/playlist_card.dart';

import 'package:design_sample/home/widgets/bottom_nav_bar.dart';
import 'package:design_sample/home/widgets/discord_cta_widget.dart';
import 'package:design_sample/shared/constants/image_urls.dart';
import 'package:design_sample/shared/constants/string_keys.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../shared/constants/sizes.dart';
import '../shared/theme/colors.dart';
import '../shared/theme/theme_text_styles.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: Colors.black,
      bottomNavigationBar: BottomBar(),
      appBar: null,
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: Sizes.padding.medium,
            vertical: Sizes.padding.extraLarge,
          ),
          child: _buildScreenContent(),
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
          SizedBox(
            height: Sizes.padding.extraLarge,
          ),
          PlaylistCard(
            imageUrl: ImageUrls.images.image1,
            currentViews: 15,
            details: '+10 New Videos',
            maxViews: 30,
            title: 'Smash Stockpile',
            viewProgress: 0.5,
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
          ),
          DiscordCTAWidget(),
        ],
      ),
    );
  }

  Widget _buildTitle() {
    var gradient = LinearGradient(colors: [ThemeColors.yellow, ThemeColors.red]);
    var add = '  🔥';

    var gradientTitle = ShaderMask(
      blendMode: BlendMode.srcIn,
      shaderCallback: (bounds) => gradient.createShader(
        Rect.fromLTWH(0, 0, bounds.width - 50, bounds.height),
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
          add,
          style: ThemeTextStyles.headers.extraLarge.copyWith(fontSize: 30),
        )
      ],
    );
  }
}
