import 'package:flutter/material.dart';

class NavigationService {
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  static BuildContext get context =>
      NavigationService.navigatorKey.currentContext!;
}

//NavigationService.context