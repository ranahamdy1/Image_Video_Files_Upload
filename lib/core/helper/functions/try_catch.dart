import 'dart:developer';

import 'package:arch_image/core/helper/functions/show_snackbar.dart';


Future tryCatch(Future<void> Function() function) async {
  try {
    await function();
  } catch (e) {
    if (e is Map<String, dynamic>) {
      if (e['message'] != null) {
        showSnackbar(e['message'], error: true);
      } else {
        showSnackbar('An error occurred', error: true);
        log(e.toString());
      }
    } else {
      showSnackbar('An error occurred', error: true);
      log(e.toString());
    }
  }
}
