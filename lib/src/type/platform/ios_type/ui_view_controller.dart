// ignore_for_file: non_constant_identifier_names
import 'package:foundation_fluttify/foundation_fluttify.dart';

import 'ns_object.dart';

class UIViewController extends NSObject {
  @override
  final String tag__ = 'platform';

  static Future<UIViewController> get() async {
    final result =
        await kMethodChannel.invokeMethod<Ref>('UIViewController::get');
    return UIViewController()..refId = result.refId;
  }
}
