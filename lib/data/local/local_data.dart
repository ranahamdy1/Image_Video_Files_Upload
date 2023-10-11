import 'dart:convert';

import 'package:arch_image/models/login_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalData {
  static final LocalData _instance = LocalData._internal();

  factory LocalData() => _instance;

  LocalData._internal() {
    init();
  }

  init() async {
    sharedPref = await SharedPreferences.getInstance();
  }

  static late SharedPreferences sharedPref;

  //! Setter Functions
  static Future<bool> setString(String key, String value) async {
    return await sharedPref.setString(key, value);
  }

  static Future<bool> setInt(String key, int value) async {
    return await sharedPref.setInt(key, value);
  }

  static Future<bool> setBool(String key, bool value) async {
    return await sharedPref.setBool(key, value);
  }

  static Future<bool> remove(String key) async {
    return await sharedPref.remove(key);
  }


  //! Getter Functions
  static bool get isRememberedMe {
    return sharedPref.getBool(LocalKeys.isRememberMe) ?? false;
  }

  static String get token {
    return loginData.data?.token?? '';

  }

  static LoginModel get loginData {
    String loginString = sharedPref.getString(LocalKeys.loginData) ?? '';
    return LoginModel.fromJson(jsonDecode(loginString));  //jsonDecode string to json
    //fromjson json to model

  }

}

class LocalKeys {
  static const String isRememberMe = 'IS_REMEMBER_ME';
  static const String token = 'TOKEN';
  static const String loginData = 'LOGIN_DATA';
}
