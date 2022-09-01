// ignore_for_file: unused_import

import 'dart:developer';
import 'dart:ui';

import 'package:design_sample/home/widgets/card_description.dart';
import 'package:design_sample/home/widgets/custom_progress_indicator.dart';
import 'package:design_sample/shared/constants/image_urls.dart';
import 'package:flutter/material.dart';
import 'package:design_sample/shared/theme/colors.dart';
import 'package:palette_generator/palette_generator.dart';

import '../../shared/constants/sizes.dart';

class PlaylistCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String details;
  final int currentViews;
  final int maxViews;
  final double viewProgress;
  final bool hasUnwatchedVideos;

  PlaylistCard({
    required this.imageUrl,
    required this.title,
    required this.details,
    required this.currentViews,
    required this.maxViews,
    required this.viewProgress,
    this.hasUnwatchedVideos = true,
  });

  @override
  Widget build(BuildContext context) {
    final defaultColor = ThemeColors.darkYellow;

    return FutureBuilder<Color>(
        future: _getDominantColor(),
        builder: (context, snapshot) {
          if (snapshot.connectionState != ConnectionState.done) {
            return _buildCardDecorations(defaultColor);
          }
          return _buildCardDecorations(snapshot.data!);
        });
  }

  Future<Color> _getDominantColor() async {
    var paletteGenerator = await PaletteGenerator.fromImageProvider(Image.asset(imageUrl).image);

    if (paletteGenerator.dominantColor == null) {
      return ThemeColors.darkYellow;
    } else {
      return paletteGenerator.dominantColor!.color;
    }
  }

  Widget _buildCardDecorations(Color dominantColor) {
    final primaryDecoration = BoxDecoration(
      borderRadius: Sizes.cornerRadius.large,
      gradient: RadialGradient(
        center: Alignment(-0.8, -0.8),
        radius: 1,
        colors: [dominantColor.withOpacity(0.3), dominantColor.withOpacity(0.0)],
      ),
      boxShadow: [
        BoxShadow(color: ThemeColors.white.withOpacity(0.05), blurRadius: 24),
        BoxShadow(color: ThemeColors.white.withOpacity(0.03), blurRadius: 4),
      ],
    );

    final secondaryDecoration = BoxDecoration(
      gradient: LinearGradient(
        colors: [ThemeColors.grey4.withOpacity(0.3), ThemeColors.black],
        begin: Alignment(-2, -3.0),
        end: Alignment(1, 1),
      ),
      borderRadius: Sizes.cornerRadius.large,
    );

    final borderDecoration = BoxDecoration(
      borderRadius: Sizes.cornerRadius.large,
      gradient: LinearGradient(
        begin: Alignment(-0.8, -2.9),
        colors: [
          ThemeColors.white.withOpacity(0.8),
          ThemeColors.grey4.withOpacity(0.3),
        ],
      ),
    );

    return Container(
      padding: EdgeInsets.all(Sizes.borders.medium),
      decoration: borderDecoration,
      child: ClipRRect(
        borderRadius: Sizes.cornerRadius.large,
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: Container(
            decoration: secondaryDecoration,
            child: Container(
              decoration: primaryDecoration,
              // width: 350,
              // height: 400,
              child: _buildCardContent(),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCardContent() {
    return Stack(
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
              hasUnwatchedVideos: hasUnwatchedVideos,
            ),
            // SizedBox(height: Sizes.padding.medium),
            SizedBox(height: Sizes.padding.large),
            SizedBox(height: Sizes.padding.large),
          ],
        ),
        _buildPlayButton(),
        Positioned(
          bottom: Sizes.padding.medium,
          right: Sizes.padding.large,
          left: Sizes.padding.large,
          child: CustomProgressIndicator(viewProgress),
        ),
      ],
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
