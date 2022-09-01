import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SvgIconWidget extends StatelessWidget {
  final String asset;
  final double? size;
  final Color? color;

  SvgIconWidget(this.asset, {required this.size, this.color});

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      asset,
      color: color,
      fit: BoxFit.cover,
      width: size,
      height: size,
    );
  }
}
