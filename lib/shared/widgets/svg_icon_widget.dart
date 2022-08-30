import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../constants/sizes.dart';

class SvgIconWidget extends StatelessWidget {
  final String asset;
  final double? size;
  final Color? color;

  SvgIconWidget(this.asset, {this.size, this.color});

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        maxHeight: size ?? Sizes.icon.medium,
        maxWidth: size ?? Sizes.icon.medium,
      ),
      child: SvgPicture.asset(
        asset,
        color: color,
        fit: BoxFit.fitWidth,
      ),
    );
  }
}
