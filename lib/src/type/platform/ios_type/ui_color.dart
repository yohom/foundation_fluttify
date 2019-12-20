import 'dart:ui';

import '../../../constants.dart';
import 'ns_object.dart';

class UIColor extends NSObject {
  static Future<UIColor> create(Color color) async {
    final refId = await kMethodChannel.invokeMethod(
        'PlatformFactory::createUIColor', {'colorValue': color.value});
    return UIColor()
      ..refId = refId
      ..tag = 'platform';
  }
}
