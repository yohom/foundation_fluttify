// @dart=2.9

import 'package:foundation_fluttify/foundation_fluttify.dart';
import 'package:foundation_fluttify/src/object/obejcts.dart';
import 'package:foundation_fluttify/src/type/platform/android_type/android/content/context.dart';

// ignore_for_file: non_constant_identifier_names, camel_case_types, missing_return, unused_import
class android_app_Application extends android_content_Context {
  @override
  final String tag__ = 'platform';

  static Future<android_app_Application> get() async {
    final result =
        await kMethodChannel.invokeMethod<Ref>('android.app.Application::get');
    return android_app_Application()..refId = result.refId;
  }
}
