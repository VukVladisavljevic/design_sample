import 'package:flutter/material.dart';

class Sizes {
  Sizes._();

  static final PaddingSize padding = PaddingSize();
  static final IconSize icon = IconSize();
  static final CornerRadius cornerRadius = CornerRadius();
}

class PaddingSize {
  final double extraExtraLarge = 56.0;
  final double extraLarge = 32.0;
  final double large = 24.0;
  final double medium = 16.0;
  final double small = 12.0;
  final double extraSmall = 8.0;
}

class IconSize {
  final double large = 32.0;
  final double medium = 24.0;
  final double small = 12.0;
}

class CornerRadius {
  final BorderRadius extraLarge = BorderRadius.all(Radius.circular(56.0));
  final BorderRadius large = BorderRadius.all(Radius.circular(32.0));
  final BorderRadius medium = BorderRadius.all(Radius.circular(20.0));
  final BorderRadius small = BorderRadius.all(Radius.circular(4.0));
}
