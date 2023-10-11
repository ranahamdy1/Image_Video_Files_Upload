import 'package:arch_image/core/ys_localizations/ys_localizations.dart';

String readError(e) {
  if (e is Map<String, dynamic>) {
    if (e['error'] == 1 && e['message'] != null) {
      return '${e['message']}';
    }
    if (e.values.first is List) {
      return '${e.values.first.first}';
    }
    return '${e.values.first}';
  }
  return 'something_wrong'.tr;
}
