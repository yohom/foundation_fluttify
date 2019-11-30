// ignore_for_file: non_constant_identifier_names, camel_case_types, missing_return, unused_import
import 'dart:typed_data';

import 'package:flutter/services.dart';
import 'package:foundation_fluttify/foundation_fluttify.dart';
import 'package:foundation_fluttify/src/type/base/ref.dart';

import '../constants.dart';
import '../type/platform/android_type/android/app/activity.dart';
import '../type/platform/android_type/android/app/application.dart';
import '../type/platform/android_type/android/graphics/bitmap.dart';
import '../type/platform/android_type/android/os/bundle.dart';

Future<android_app_Application> getandroid_app_Application() async {
  final refId = await kMethodChannel
      .invokeMethod('PlatformFactory::getandroid_app_Application');
  return android_app_Application()
    ..refId = refId
    ..tag = 'platform';
}

Future<android_app_Activity> getandroid_app_Activity() async {
  final refId = await kMethodChannel
      .invokeMethod('PlatformFactory::getandroid_app_Activity');
  return android_app_Activity()
    ..refId = refId
    ..tag = 'platform';
}

Future<android_os_Bundle> createandroid_os_Bundle() async {
  final refId = await kMethodChannel
      .invokeMethod('PlatformFactory::createandroid_os_Bundle');
  return android_os_Bundle()
    ..refId = refId
    ..tag = 'platform';
}

Future<android_graphics_Bitmap> createandroid_graphics_Bitmap(
    Uint8List bitmapBytes) async {
  final refId = await kMethodChannel.invokeMethod(
      'PlatformFactory::createandroid_graphics_Bitmap',
      {'bitmapBytes': bitmapBytes});
  return android_graphics_Bitmap()
    ..refId = refId
    ..tag = 'platform';
}

Future<android_graphics_Point> createandroid_graphics_Point(
    int x, int y) async {
  final refId = await kMethodChannel.invokeMethod(
      'PlatformFactory::createandroid_graphics_Point', {'x': x, 'y': y});
  return android_graphics_Point()
    ..refId = refId
    ..tag = 'platform';
}
