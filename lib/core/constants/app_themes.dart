import 'package:flutter/material.dart';

import 'app_colors.dart';

class AppThemes {//AppThemes.theme
  static ThemeData get theme {
    return ThemeData(
      colorScheme: ColorScheme.fromSeed(seedColor: AppColors.yPrimaryColor),
      useMaterial3: true,
      fontFamily: 'Poppins',
    );
  }

  static ThemeData get darkTheme {
    return ThemeData(
      colorScheme: ColorScheme.fromSeed(seedColor: AppColors.yPrimaryColor),
      useMaterial3: true,
      fontFamily: 'Poppins',
    );
  }


}
