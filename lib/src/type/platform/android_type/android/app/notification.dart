import 'package:flutter/cupertino.dart';
import 'package:foundation_fluttify/foundation_fluttify.dart';
import 'package:foundation_fluttify/src/object/obejcts.dart';
import 'package:foundation_fluttify/src/type/platform/android_type/android/content/context.dart';
import 'package:foundation_fluttify/src/type/platform/android_type/android/content/intent.dart';

// ignore_for_file: non_constant_identifier_names, camel_case_types, missing_return, unused_import
class android_app_Notification extends java_lang_Object {
  static Future<android_app_Notification> create({
    @required String contentTitle,
    @required String contentText,
    int when,
    @required String channelId,
    @required String channelName,
    bool enableLights = true,
    bool showBadge = true,
  }) async {
    final refId =
        await kMethodChannel.invokeMethod('android.app.Notification::create', {
      'contentTitle': contentTitle,
      'contentText': contentText,
      'when': when ?? DateTime.now().millisecondsSinceEpoch,
      'channelId': channelId,
      'channelName': channelName,
      'enableLights': enableLights,
      'showBadge': showBadge,
    });
    return android_app_Notification()
      ..refId = refId
      ..tag__ = 'platform';
  }

  final String tag__ = 'platform';
}
