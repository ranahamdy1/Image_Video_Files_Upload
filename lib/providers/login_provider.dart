
import 'dart:convert';

import 'package:arch_image/core/constants/app_strings.dart';
import 'package:arch_image/core/helper/functions/show_snackbar.dart';
import 'package:arch_image/core/helper/functions/try_catch.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

import '../core/helper/functions/navigation_service.dart';
import '../data/local/local_data.dart';
import '../data/remote/remote_data.dart';
import '../models/login_model.dart';

class LoginProvider extends ChangeNotifier{
  TextEditingController email= TextEditingController();
  TextEditingController password= TextEditingController();
  final data=Provider.of<RemoteData>(NavigationService.context,listen: false);  //instance from provider

  LoginModel? loginModel;
  bool isRememberMe=false;

  Future<bool> get login async{
    bool success= false;
    await tryCatch(() async{
      Response response = await data.dioPost(AppStrings.loginEndPoint, false ,
          body: {
        "email":email.text,
        "password":password.text,
      });
      if(response.statusCode==200 && response.data['status']==true)
        {
          success =true;
          loginModel=LoginModel.fromJson(response.data);
          LocalData.setString(LocalKeys.loginData,
              jsonEncode(loginModel?.toJson()));
          // jsonEncode json to string
          //notifyListeners();
          LocalData.setBool(LocalKeys.isRememberMe, isRememberMe);

        }
      else{
      showSnackbar(response.data['message'],error: true);
      }
    }
    );
    return success;
  }

  void changeRememberMe(){
    isRememberMe=!isRememberMe;
    notifyListeners();
  }

}