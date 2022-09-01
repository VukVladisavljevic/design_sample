import 'dart:developer';

import 'package:design_sample/shared/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

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
              blurRadius: 5,
              spreadRadius: 5,
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

    // return Container(
    //   margin: EdgeInsets.symmetric(horizontal: Sizes.padding.large, vertical: 10),
    //   child: ClipRRect(
    //     borderRadius: Sizes.cornerRadius.small,
    //     child: Stack(
    //       children: [
    //         LinearProgressIndicator(
    //           backgroundColor: ThemeColors.white.withOpacity(0.1),
    //           color: ThemeColors.yellow,
    //           value: viewProgress,
    //         ),
    //         Container(
    //           width: 1,
    //           height: 20,
    //           // alignment: Alignment.center,
    //           decoration: BoxDecoration(
    //             boxShadow: [
    //               BoxShadow(
    //                 color: ThemeColors.white,
    //                 blurRadius: 5,
    //                 spreadRadius: 5,
    //                 offset: Offset(50, -10),
    //               ),
    //             ],
    //           ),
    //         ),
    // LayoutBuilder(builder: ((context, constraints) {
    //   var filledWidth = constraints.maxWidth * viewProgress;
    //   if (filledWidth == 0) {
    //     return Container();
    //   }
    //   return Row(
    //     children: [
    //       SizedBox(width: filledWidth - indicatorWidth),
    //       Container(
    //         width: 1,
    //         height: 10,
    // decoration: BoxDecoration(
    //   boxShadow: [
    //     BoxShadow(
    //       color: ThemeColors.white,
    //       blurRadius: 5,
    //       spreadRadius: 5,
    //       offset: Offset(0, -5),
    //     ),
    //   ],
    // ),
    //       ),
    //     ],
    //   );
    //         // })),
    //       ],
    //     ),
    //   ),
    // );
  }
}
