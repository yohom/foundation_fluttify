// ignore_for_file: non_constant_identifier_names, camel_case_types, missing_return, unused_import
import 'dart:typed_data';

import 'package:foundation_fluttify/src/type/platform/android_type/java/lang/object.dart';

import '../../../../../constants.dart';

class android_graphics_Bitmap extends java_lang_Object {
  static Future<android_graphics_Bitmap> create(Uint8List bitmapBytes) async {
    final refId = await kMethodChannel.invokeMethod(
        'PlatformFactory::createandroid_graphics_Bitmap',
        {'bitmapBytes': bitmapBytes});
    return android_graphics_Bitmap()
      ..refId = refId
      ..tag = 'platform';
  }

  Future<Uint8List> get data {
    return kMethodChannel
        .invokeMethod('android.graphics.Bitmap::getData', {'refId': refId});
  }

  Future<void> recycle() {
    return kMethodChannel
        .invokeMethod('android.graphics.Bitmap::recycle', {'refId': refId});
  }

  Future<bool> get isRecycled {
    return kMethodChannel
        .invokeMethod('android.graphics.Bitmap::isRecycled', {'refId': refId});
  }
}
