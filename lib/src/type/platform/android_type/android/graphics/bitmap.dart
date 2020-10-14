// ignore_for_file: non_constant_identifier_names, camel_case_types, missing_return, unused_import
import 'dart:typed_data';

import 'package:foundation_fluttify/foundation_fluttify.dart';
import 'package:foundation_fluttify/src/object/obejcts.dart';
import 'package:foundation_fluttify/src/type/platform/android_type/java/lang/object.dart';

class android_graphics_Bitmap extends java_lang_Object {
  @override
  final String tag__ = 'platform';

  static Future<android_graphics_Bitmap> create(Uint8List bitmapBytes) async {
    final result = await kMethodChannel.invokeMethod<Ref>(
        'android.graphics.Bitmap::create', {'bitmapBytes': bitmapBytes});
    return android_graphics_Bitmap()..refId = result.refId;
  }

  static Future<android_graphics_Bitmap> createWithDrawable(
    String drawableId,
  ) async {
    final result = await kMethodChannel.invokeMethod<Ref>(
      'android.graphics.Bitmap::createWithDrawable',
      {'drawableId': drawableId},
    );
    return android_graphics_Bitmap()..refId = result.refId;
  }

  static Future<List<android_graphics_Bitmap>> create_batch(
    List<Uint8List> bitmapBytesBatch,
  ) async {
    final resultBatch = await kMethodChannel.invokeListMethod<Ref>(
      'android.graphics.Bitmap::create_batch',
      [
        for (final bitmapBytes in bitmapBytesBatch) {'bitmapBytes': bitmapBytes}
      ],
    );
    return resultBatch
        .map((it) => android_graphics_Bitmap()..refId = it.refId)
        .toList();
  }

  Future<Uint8List> get data {
    return kMethodChannel
        .invokeMethod('android.graphics.Bitmap::getData', {'__this__': this});
  }

  Future<void> recycle() {
    return kMethodChannel
        .invokeMethod('android.graphics.Bitmap::recycle', {'__this__': this});
  }

  Future<bool> get isRecycled {
    return kMethodChannel.invokeMethod(
        'android.graphics.Bitmap::isRecycled', {'__this__': this});
  }
}
