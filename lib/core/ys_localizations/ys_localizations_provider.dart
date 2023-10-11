import 'package:arch_image/core/ys_localizations/saved_language_code.dart';
import 'package:arch_image/core/ys_localizations/ys_localizations.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../views/pages/Home/home_screen.dart';
import '../helper/functions/navigation_service.dart';
export 'package:provider/provider.dart';

class YsLocalizationsProvider extends ChangeNotifier {
  static YsLocalizationsProvider get(context) =>
      Provider.of<YsLocalizationsProvider>(context);

  static YsLocalizationsProvider listenFalse(context) =>
      Provider.of<YsLocalizationsProvider>(context, listen: false);

  String _languageCode = YsLocalizations.defaultLangCode;

  String get languageCode => _languageCode;
  Future getSavedLanguageCode() async {
    final String savedLanguageCode =
        await SavedLanguageCode().getSavedLanguageCode();
    _languageCode = savedLanguageCode;
    notifyListeners();
  }

  Future<void> setSavedLanguageCode(String langCode) async {
    await SavedLanguageCode().setSavedLanguageCode(langCode);
    _languageCode = langCode;
    notifyListeners();
    await reloadApp();
  }

  Future<void> reloadApp() async {
    final state = NavigationService.navigatorKey.currentState;
    state?.popUntil((route) => route.isFirst);
    await Future.delayed(const Duration(milliseconds: 50), () async {
      state!.pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => const Home()),//first screen chhhhhhhhange it==testpage
          (route) => false);
    });
  }
}
