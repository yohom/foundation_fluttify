import 'dart:typed_data';

import 'package:flutter/services.dart';
import 'package:foundation_fluttify/src/type/base/ref.dart';

import '../../constants.dart';

// ignore_for_file: non_constant_identifier_names, camel_case_types, missing_return, unused_import
class PlatformFactory_Android {
  static Future<android_app_Application> getandroid_app_Application() async {
    final refId = await kMethodChannel
        .invokeMethod('PlatformFactory::getandroid_app_Application');
    return android_app_Application()..refId = refId;
  }

  static Future<android_app_Activity> getandroid_app_Activity() async {
    final refId = await kMethodChannel
        .invokeMethod('PlatformFactory::getandroid_app_Activity');
    return android_app_Activity()..refId = refId;
  }

  static Future<android_os_Bundle> createandroid_os_Bundle() async {
    final refId = await kMethodChannel
        .invokeMethod('PlatformFactory::createandroid_os_Bundle');
    return android_os_Bundle()..refId = refId;
  }

  static Future<android_graphics_Bitmap> createandroid_graphics_Bitmap(
      Uint8List bitmapBytes) async {
    final refId = await kMethodChannel.invokeMethod(
        'PlatformFactory::createandroid_graphics_Bitmap',
        {'bitmapBytes': bitmapBytes});
    return android_graphics_Bitmap()..refId = refId;
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

class java_lang_Object extends Ref {}

class android_content_Context extends java_lang_Object {}

class android_app_Application extends android_content_Context {}

class android_app_Activity extends android_content_Context {}

class android_os_Bundle extends java_lang_Object {}

class android_view_View extends java_lang_Object {}

class android_widget_FrameLayout extends android_view_ViewGroup {}

class android_view_ViewGroup extends android_view_View {}

class android_graphics_Point extends java_lang_Object {}

class android_graphics_PointF extends java_lang_Object {}

class android_graphics_Bitmap extends java_lang_Object {}

class android_location_Location extends java_lang_Object {}

class android_view_MotionEvent extends java_lang_Object {}

class android_graphics_drawable_Drawable extends java_lang_Object {}

class android_widget_ImageView extends android_view_View {}

class android_widget_TextView extends android_view_View {}

class android_widget_LinearLayout extends android_view_ViewGroup {}

class android_widget_RelativeLayout extends android_view_ViewGroup {}

mixin android_os_Parcelable on java_lang_Object {}
