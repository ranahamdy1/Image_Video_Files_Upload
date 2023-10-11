import 'package:flutter/material.dart';

import '../../constants/app_colors.dart';
import '../../ys_localizations/ys_localizations_provider.dart';
import 'navigation_service.dart';

showSnackbar(String message, {bool error = false}) {
  closeSnackbar();
  final locale = YsLocalizationsProvider.listenFalse(NavigationService.context);
  ScaffoldMessenger.of(NavigationService.context).showSnackBar(
    SnackBar(
      content: Text(
        message,
        textDirection:
            locale.languageCode == 'ar' ? TextDirection.rtl : TextDirection.ltr,
      ),
       backgroundColor: error ? AppColors.yRedColor : AppColors.yGreenColor,
    ),
  );
}

closeSnackbar() {
  ScaffoldMessenger.of(NavigationService.context).clearSnackBars();
}
