// ignore_for_file: non_constant_identifier_names
import 'dart:ui';

import 'package:foundation_fluttify/src/object/obejcts.dart';

import 'ns_object.dart';

class UIColor extends NSObject {
  static Future<UIColor> create(Color color) async {
    final refId = await kMethodChannel
        .invokeMethod('UIColor::create', {'colorValue': color.value});
    return UIColor()
      ..refId = refId
      ..tag__ = 'platform';
  }

  final String tag__ = 'platform';
}
