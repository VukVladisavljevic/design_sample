import 'package:design_sample/shared/theme/colors.dart';
import 'package:flutter/material.dart';

import 'theme_text_styles.dart';

class AppThemes {
  static ThemeData get darkTheme {
    return ThemeData(
      fontFamily: 'AktivGrotesk',
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        selectedLabelStyle: ThemeTextStyles.body.medium,
        selectedItemColor: ThemeColors.yellow,
        unselectedLabelStyle: ThemeTextStyles.body.medium,
        unselectedItemColor: ThemeColors.grey1,
      ),
      // canvasColor: ThemeColors.white,
      // iconTheme: IconThemeData(color: ThemeColors.white),
    );
  }
}
