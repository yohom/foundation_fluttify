// ignore_for_file: non_constant_identifier_names

import 'dart:ui';

import 'package:foundation_fluttify/foundation_fluttify.dart';
import 'package:foundation_fluttify/src/object/obejcts.dart';

import 'ns_object.dart';

class UIColor extends NSObject {
  @override
  final String tag__ = 'platform';

  static Future<UIColor> create(Color color) async {
    final result = await kMethodChannel
        .invokeMethod<Ref>('UIColor::create', {'colorValue': color.value});
    return UIColor()..refId = result?.refId;
  }
}
