// ignore_for_file: non_constant_identifier_names, camel_case_types, missing_return, unused_import
import 'dart:typed_data';

import 'package:flutter/services.dart';
import 'package:foundation_fluttify/foundation_fluttify.dart';
import 'package:foundation_fluttify/src/type/base/ref.dart';

import '../../../constants.dart';
import 'android/app/activity.dart';
import 'android/app/application.dart';
import 'android/graphics/bitmap.dart';
import 'android/os/bundle.dart';

class PlatformFactoryAndroid {
  static Future<android_app_Application> getandroid_app_Application() async {
    final refId = await kMethodChannel
        .invokeMethod('PlatformFactory::getandroid_app_Application');
    return android_app_Application()
      ..refId = refId
      ..tag = 'platform';
  }

  static Future<android_app_Activity> getandroid_app_Activity() async {
    final refId = await kMethodChannel
        .invokeMethod('PlatformFactory::getandroid_app_Activity');
    return android_app_Activity()
      ..refId = refId
      ..tag = 'platform';
  }

  static Future<android_os_Bundle> createandroid_os_Bundle() async {
    final refId = await kMethodChannel
        .invokeMethod('PlatformFactory::createandroid_os_Bundle');
    return android_os_Bundle()
      ..refId = refId
      ..tag = 'platform';
  }

  static Future<android_graphics_Bitmap> createandroid_graphics_Bitmap(
      Uint8List bitmapBytes) async {
    final refId = await kMethodChannel.invokeMethod(
        'PlatformFactory::createandroid_graphics_Bitmap',
        {'bitmapBytes': bitmapBytes});
    return android_graphics_Bitmap()
      ..refId = refId
      ..tag = 'platform';
  }

  static Future<android_graphics_Point> createandroid_graphics_Point(
      int x, int y) async {
    final refId = await kMethodChannel.invokeMethod(
        'PlatformFactory::createandroid_graphics_Point', {'x': x, 'y': y});
    return android_graphics_Point()
      ..refId = refId
      ..tag = 'platform';
  }

  static Future<void> release(Ref ref) async {
    await kMethodChannel
        .invokeMethod('PlatformFactory::release', {'refId': ref.refId});
  }

  static Future<void> clearHeap() async {
    await kMethodChannel.invokeMethod('PlatformFactory::clearHeap');
  }

  static Future<void> pushStack(String name, Ref ref) async {
    await kMethodChannel.invokeMethod(
        'PlatformFactory::pushStack', {'name': name, 'refId': ref.refId});
  }

  static Future<void> pushStackJsonable(String name, dynamic jsonable) async {
    await kMethodChannel.invokeMethod(
        'PlatformFactory::pushStackJsonable', {'name': name, 'data': jsonable});
  }

  static Future<void> clearStack() async {
    await kMethodChannel.invokeMethod('PlatformFactory::clearStack');
  }
}

@Deprecated('使用PlatformFactoryAndroid代替')
class PlatformFactory_Android {
  static Future<android_app_Application> getandroid_app_Application() async {
    final refId = await kMethodChannel
        .invokeMethod('PlatformFactory::getandroid_app_Application');
    return android_app_Application()
      ..refId = refId
      ..tag = 'platform';
  }

  static Future<android_app_Activity> getandroid_app_Activity() async {
    final refId = await kMethodChannel
        .invokeMethod('PlatformFactory::getandroid_app_Activity');
    return android_app_Activity()
      ..refId = refId
      ..tag = 'platform';
  }

  static Future<android_os_Bundle> createandroid_os_Bundle() async {
    final refId = await kMethodChannel
        .invokeMethod('PlatformFactory::createandroid_os_Bundle');
    return android_os_Bundle()
      ..refId = refId
      ..tag = 'platform';
  }

  static Future<android_graphics_Bitmap> createandroid_graphics_Bitmap(
      Uint8List bitmapBytes) async {
    final refId = await kMethodChannel.invokeMethod(
        'PlatformFactory::createandroid_graphics_Bitmap',
        {'bitmapBytes': bitmapBytes});
    return android_graphics_Bitmap()
      ..refId = refId
      ..tag = 'platform';
  }

  static Future<void> release(Ref ref) async {
    await kMethodChannel
        .invokeMethod('PlatformFactory::release', {'refId': ref.refId});
  }

  static Future<void> clearHeap() async {
    await kMethodChannel.invokeMethod('PlatformFactory::clearHeap');
  }

  static Future<void> pushStack(String name, Ref ref) async {
    await kMethodChannel.invokeMethod(
        'PlatformFactory::pushStack', {'name': name, 'refId': ref.refId});
  }

  static Future<void> pushStackJsonable(String name, dynamic jsonable) async {
    await kMethodChannel.invokeMethod(
        'PlatformFactory::pushStackJsonable', {'name': name, 'data': jsonable});
  }

  static Future<void> clearStack() async {
    await kMethodChannel.invokeMethod('PlatformFactory::clearStack');
  }
}
