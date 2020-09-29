// ignore_for_file: non_constant_identifier_names
import 'package:foundation_fluttify/foundation_fluttify.dart';

import 'ns_object.dart';

class UIViewController extends NSObject {
  static Future<UIViewController> get() async {
    final refId = await kMethodChannel.invokeMethod('UIViewController::get');
    return UIViewController()
      ..refId = refId
      ..tag__ = 'platform';
  }

  @override
  final String tag__ = 'platform';
}
