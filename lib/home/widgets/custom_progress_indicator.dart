import 'package:design_sample/shared/constants/sizes.dart';
import 'package:flutter/material.dart';

import '../../shared/theme/colors.dart';

class CustomProgressIndicator extends StatelessWidget {
  final viewProgress;
  final indicatorWidth = 2.0;
  final indicatorHeight = 4.0;

  CustomProgressIndicator(this.viewProgress);

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.orange,
      child: Stack(
        children: [
          Align(
            alignment: Alignment.center,
            child: ClipRRect(
              borderRadius: Sizes.cornerRadius.small,
              child: LinearProgressIndicator(
                backgroundColor: ThemeColors.white.withOpacity(0.1),
                color: ThemeColors.yellow,
                value: viewProgress,
              ),
            ),
          ),
          LayoutBuilder(builder: ((context, constraints) {
            var filledWidth = constraints.maxWidth * viewProgress;
            BoxShadow? indicatorShadow = BoxShadow(
              color: ThemeColors.white.withOpacity(0.48),
              blurRadius: 8,
              spreadRadius: 3,
              offset: Offset(-2, -6),
            );

            if (filledWidth == 0 || viewProgress == 1 || viewProgress == 0) {
              indicatorShadow = null;
              filledWidth = indicatorWidth;
            }
            return Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(width: filledWidth - indicatorWidth),
                Container(
                  width: 1,
                  height: 15,
                  alignment: Alignment.center,
                  decoration: indicatorShadow != null
                      ? BoxDecoration(
                          boxShadow: [indicatorShadow],
                        )
                      : null,
                ),
              ],
            );
          })),
        ],
      ),
    );
  }
}
