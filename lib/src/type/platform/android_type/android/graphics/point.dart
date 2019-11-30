// ignore_for_file: non_constant_identifier_names, camel_case_types, missing_return, unused_import
import 'dart:typed_data';

import 'package:foundation_fluttify/src/constants.dart';
import 'package:foundation_fluttify/src/type/platform/android_type/java/lang/object.dart';

class android_graphics_Point extends java_lang_Object {
  Future<int> get x {
    return kMethodChannel
        .invokeMethod('android.graphics.Point::getX', {'refId': refId});
  }

  Future<int> get y {
    return kMethodChannel
        .invokeMethod('android.graphics.Point::getY', {'refId': refId});
  }
}
