import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import '../core/helper/functions/navigation_service.dart';
import '../core/helper/functions/try_catch.dart';
import '../data/remote/remote_data.dart';

export 'package:provider/provider.dart';

class XProvider extends ChangeNotifier {
  final data =
      Provider.of<RemoteData>(NavigationService.context, listen: false);
  int count = 0;

  addCount() {
    count++;
    notifyListeners();
  }

  Future<void> get getData async {
    tryCatch(() async {
      // await data.login();
    });
    notifyListeners();
  }

  //postForm()  parameter

  /*Future<void> postForm() async {
    tryCatch(() async{
      data.dioPostForm("endpoint", true,
      body: {
        "name": "name"
      }
      );

    });
    notifyListeners();
  }*/

  Future<void> signUp(File photo) async {
    tryCatch(() async {
      String fileName = photo.path.split("/").last;
      await data.dioPostForm(
        "endpoint",
        true,
        body: {
          "name": "name",
          "email": "name",
          "phone": "name",
        },
        files: {
          "photo": await MultipartFile.fromFile(photo.path, filename: fileName),
        },
      );
    });
    notifyListeners();
  }
//assets/images/name.png
}
