import 'package:design_sample/shared/theme/colors.dart';
import 'package:design_sample/shared/theme/theme_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../shared/constants/sizes.dart';

class CardDescription extends StatelessWidget {
  final String title;
  final String details;
  final int currentViews;
  final int maxViews;
  final bool hasUnwatchedVideos;

  final double titleBottomPadding = 2.0;
  final double viewProgressPadding = 2.5;

  CardDescription({
    required this.title,
    required this.details,
    required this.currentViews,
    required this.maxViews,
    required this.hasUnwatchedVideos,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: Sizes.padding.large),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: ThemeTextStyles.headers.medium,
          ),
          SizedBox(height: titleBottomPadding),
          Row(
            children: [
              Text(
                details,
                style: ThemeTextStyles.body.medium
                    .copyWith(color: hasUnwatchedVideos ? ThemeColors.yellow : ThemeColors.grey1),
              ),
              Spacer(),
              _buildViewProgress(),
            ],
          )
        ],
      ),
    );
  }

  Widget _buildViewProgress() => Container(
        child: Row(
          children: [
            Icon(
              Icons.remove_red_eye_outlined,
              color: currentViews == 0 ? ThemeColors.yellow : ThemeColors.grey1,
              size: Sizes.icon.small,
            ),
            SizedBox(width: viewProgressPadding),
            Text(
              currentViews.toString() + "/" + maxViews.toString(),
              style: ThemeTextStyles.body.medium
                  .copyWith(color: currentViews == 0 ? ThemeColors.yellow : ThemeColors.grey1),
            ),
          ],
        ),
      );
}
