import 'package:foundation_fluttify/foundation_fluttify.dart';

import 'ns_object.dart';

class UIViewController extends NSObject {
  static Future<UIViewController> get() async {
    final refId = await kMethodChannel.invokeMethod('UIViewController::get');
    return UIViewController()
      ..refId = refId
      ..tag__ = 'platform';
  }
}
