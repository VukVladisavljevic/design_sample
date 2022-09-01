import 'colors.dart';
import 'package:flutter/material.dart';

class ThemeTextStyles {
  ThemeTextStyles._();

  static final Headers headers = Headers();
  static final Body body = Body();
}

class Headers {
  final extraLarge = TextStyle(color: ThemeColors.white, fontWeight: FontWeight.w700, fontSize: 34.0, height: 1.2);
  final large = TextStyle(color: ThemeColors.white, fontWeight: FontWeight.w700, fontSize: 22.0, height: 1.2);
  final medium = TextStyle(color: ThemeColors.white, fontWeight: FontWeight.w700, fontSize: 20.0, height: 1.2);
}

class Body {
  final button = TextStyle(color: ThemeColors.white, fontWeight: FontWeight.w500, fontSize: 17.0, height: 1.25);
  final large = TextStyle(color: ThemeColors.grey2, fontWeight: FontWeight.w400, fontSize: 13.0, height: 1.5);
  final medium = TextStyle(color: ThemeColors.white, fontWeight: FontWeight.w400, fontSize: 12.0, height: 1.6);
  final small = TextStyle(color: ThemeColors.white, fontWeight: FontWeight.w400, fontSize: 10.0, height: 1.3);
}
