import 'colors.dart';
import 'package:flutter/material.dart';

const lineHeight = 1.4;

class ThemeTextStyles {
  ThemeTextStyles._();

  static final Headers headers = Headers();
  static final Body body = Body();
}

class Headers {
  final extraLarge =
      TextStyle(color: ThemeColors.white, fontWeight: FontWeight.w700, fontSize: 34.0, height: lineHeight);
  final large = TextStyle(color: ThemeColors.white, fontWeight: FontWeight.w700, fontSize: 22.0, height: lineHeight);
  final medium = TextStyle(color: ThemeColors.white, fontWeight: FontWeight.w700, fontSize: 20.0, height: lineHeight);
}

class Body {
  final large = TextStyle(color: ThemeColors.grey2, fontWeight: FontWeight.w400, fontSize: 14.0, height: lineHeight);
  final medium = TextStyle(color: ThemeColors.white, fontWeight: FontWeight.w400, fontSize: 12.0, height: lineHeight);
}
