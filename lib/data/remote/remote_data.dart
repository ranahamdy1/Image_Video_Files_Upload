import 'dart:async';
import 'dart:developer';

import 'package:arch_image/core/constants/app_strings.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart' show kDebugMode;
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:flutter/material.dart';

import '../../core/helper/functions/navigation_service.dart';
import '../../core/ys_localizations/ys_localizations_provider.dart';
import '../local/local_data.dart';
export 'package:provider/provider.dart';

class RemoteData extends ChangeNotifier {
  final dio = Dio();
  final locale = YsLocalizationsProvider.listenFalse(NavigationService.context);
  RemoteData() {
    init();
  }

  void init() {
    dio.options.baseUrl = AppStrings.baseUrl;
    if (kDebugMode) {
      dio.interceptors.add(PrettyDioLogger(
        requestBody: true,
        responseBody: true,
        requestHeader: true,
        error: true,
      ));
    }
  }

  Map<String, dynamic>? getHeaders({bool isAuth = true}) {
    Map<String, dynamic>? headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
      'lang': locale.languageCode,
      if (isAuth)
        'Authorization': 'Bearer ${LocalData.token}'
    };

    return headers;
  }

  // !--------------------------------------------------------------------------
  // !--------------------------------------------------------------------------
  // !--------------------------------------------------------------------------
  // !--------------------------------------------------------------------------


  Map<String, dynamic>? getFormHeaders({bool isAuth = true}) {
    Map<String, dynamic>? headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/x-www-form-urlencoded',  //form
      'lang': locale.languageCode,
      if (isAuth)
        'Authorization': 'Bearer ${LocalData.token}'
    };

    return headers;
  }

  Future<Response<dynamic>> dioPostForm(
      String path,
      bool? isAuth,

      {
        Map<String, dynamic>? body,
        Map<String, dynamic>? files,

      }) async {
    try {
      FormData formData =FormData.fromMap(
        {
          //"file": await MultipartFile.fromFile("file_path", filename: "file_name"),
          ...?files,
          ...?body
        }
      );
      return dio.post(
        path,
        data: formData,
        options: Options(
          headers: getFormHeaders(isAuth: isAuth ?? true),
          responseType: ResponseType.json,
        ),
      );
    } catch (error) {
      log(error.toString());
      throw Exception(error);
    }
  }

  // !--------------------------------------------------------------------------
  // !--------------------------------------------------------------------------
  // !--------------------------------------------------------------------------
  // !--------------------------------------------------------------------------

  Future<Response<dynamic>> dioGet(String path, bool? isAuth) {
    try {
      return dio.get(
        path,
        options: Options(
          headers: getHeaders(isAuth: isAuth ?? true),
          responseType: ResponseType.json,
        ),
      );
    } catch (error) {
      log(error.toString());
      throw Exception(error);
    }
  }

  Future<Response<dynamic>> dioPost(String path, bool? isAuth,
      {Map<String, dynamic>? body}) {
    try {
      return dio.post(
        path,
        data: body,
        options: Options(
          headers: getHeaders(isAuth: isAuth ?? true),
          responseType: ResponseType.json,
        ),
      );
    } catch (error) {
      log(error.toString());
      throw Exception(error);
    }
  }



}
