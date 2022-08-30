import 'dart:developer';
import 'dart:ui';

import 'package:design_sample/home/widgets/card_description.dart';
import 'package:design_sample/shared/constants/image_urls.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:design_sample/shared/theme/colors.dart';
import 'package:palette_generator/palette_generator.dart';

import '../shared/constants/sizes.dart';

class PlaylistCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String details;
  final int currentViews;
  final int maxViews;
  final double viewProgress;

  PlaylistCard({
    required this.imageUrl,
    required this.title,
    required this.details,
    required this.currentViews,
    required this.maxViews,
    required this.viewProgress,
  });

  var radialGradient = RadialGradient(
    center: Alignment(-0.5, -0.5),
    colors: [ThemeColors.yellow.withOpacity(0.2), ThemeColors.yellow.withOpacity(0.0)],
    radius: 1,
  );

  var linearGradient = LinearGradient(
    colors: [ThemeColors.grey4.withOpacity(0.3), ThemeColors.black],
    begin: Alignment(-3, -5.0),
    end: Alignment(0.9, 0.9),
  );

  var borderDecoration = BoxDecoration(
    borderRadius: Sizes.cornerRadius.medium,
    gradient: LinearGradient(
      begin: Alignment(-0.8, -2.9),
      colors: [
        ThemeColors.white.withOpacity(0.8),
        ThemeColors.grey4.withOpacity(0.3),
      ],
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(1),
      decoration: borderDecoration,
      child: Container(
        decoration: BoxDecoration(
          gradient: linearGradient,
          borderRadius: Sizes.cornerRadius.medium,
        ),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: Sizes.cornerRadius.medium,
            gradient: radialGradient,
            boxShadow: [
              BoxShadow(color: ThemeColors.white.withOpacity(0.05)),
            ],
          ),
          child: _buildCardContent(),
        ),
      ),
    );
  }

  Widget _buildCardContent() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: Sizes.cornerRadius.medium,
        gradient: radialGradient,
      ),
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildImage(),
              SizedBox(height: Sizes.padding.medium),
              CardDescription(
                title: title,
                details: details,
                currentViews: currentViews,
                maxViews: maxViews,
              ),
              SizedBox(height: Sizes.padding.medium),
              _buildProgressIndicator(),
              SizedBox(height: Sizes.padding.large),
            ],
          ),
          _buildPlayButton(),
        ],
      ),
    );
  }

  Widget _buildImage() {
    return Container(
      decoration: BoxDecoration(borderRadius: Sizes.cornerRadius.medium),
      padding: EdgeInsets.fromLTRB(
        Sizes.padding.small,
        Sizes.padding.small,
        Sizes.padding.small,
        0,
      ),
      child: Image.asset(
        imageUrl,
        width: double.infinity,
        fit: BoxFit.fitWidth,
      ),
    );
  }

  // Future<Color> _updatePaletteGenerator() async {
  //   var paletteGenerator = await PaletteGenerator.fromImageProvider(Image.asset(imageUrl).image);
  //   return paletteGenerator.dominantColor!.color;
  // }

  Widget _buildProgressIndicator() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: Sizes.padding.large),
      child: ClipRRect(
        borderRadius: Sizes.cornerRadius.small,
        child: LinearProgressIndicator(
          backgroundColor: ThemeColors.white.withOpacity(0.1),
          color: ThemeColors.yellow,
          value: viewProgress,
        ),
      ),
    );
  }

  Widget _buildPlayButton() {
    final playButtonSize = 64.0;
    final bottomPadding = 71.0;
    final rightPadding = 32.0;

    return Positioned(
      bottom: bottomPadding,
      right: rightPadding,
      child: SizedBox(
        height: playButtonSize,
        width: playButtonSize,
        child: ClipRRect(
          borderRadius: Sizes.cornerRadius.large,
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: Container(
              decoration: BoxDecoration(color: ThemeColors.white.withOpacity(0.15)),
              alignment: Alignment.center,
              child: Icon(
                Icons.play_arrow,
                color: ThemeColors.white,
                size: Sizes.icon.large,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
