import 'package:arch_image/data/local/local_data.dart';
import 'package:arch_image/providers/x_provider.dart';
import 'package:arch_image/views/pages/Home/home_screen.dart';
import 'package:arch_image/views/pages/auth/login/login_page.dart';
import 'package:flutter/material.dart';
import 'core/constants/app_themes.dart';
import 'core/ys_localizations/ys_localizations.dart';
import 'core/ys_localizations/ys_localizations_provider.dart';
import 'core/ys_localizations/ys_material_app.dart';
import 'data/remote/remote_data.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  LocalData();
  await YsLocalizations.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => YsLocalizationsProvider()),
        ChangeNotifierProvider(create: (context) => RemoteData()),
        ChangeNotifierProvider(create: (context) => XProvider()),
      ],
      child: YsMaterialApp(
        title: 'app_name'.tr,
        theme: AppThemes.theme,
        home: const LoginScreen(),
      ),
    );
  }
}
