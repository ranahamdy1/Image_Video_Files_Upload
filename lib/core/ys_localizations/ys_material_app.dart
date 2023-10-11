import 'package:arch_image/core/ys_localizations/ys_localizations.dart';
import 'package:arch_image/core/ys_localizations/ys_localizations_provider.dart';
import 'package:flutter/material.dart';

import '../helper/functions/navigation_service.dart';

class YsMaterialApp extends StatelessWidget {
  const YsMaterialApp({
    super.key,
    this.title = '',
    this.theme,
    this.darkTheme,
    this.home,
  });
  final String title;
  final ThemeData? theme;
  final ThemeData? darkTheme;
  final Widget? home;

  @override
  Widget build(BuildContext context) {
    final locale = YsLocalizationsProvider.get(context);
    return MaterialApp(
      navigatorKey: NavigationService.navigatorKey,
      debugShowCheckedModeBanner: false,
      locale: Locale(locale.languageCode),
      supportedLocales: YsLocalizations.supportedLocale,
      localizationsDelegates: YsLocalizations.localizationsDelegates,
      localeResolutionCallback: YsLocalizations.localeResolutionCallback,
      title: title,
      theme: theme,
      darkTheme: darkTheme,
      home: home,
    );
  }
}
