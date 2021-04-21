// @dart=2.9

import 'package:foundation_fluttify/src/object/obejcts.dart';
import 'package:foundation_fluttify/src/type/platform/android_type/android/os/bundle.dart';
import 'package:foundation_fluttify/src/type/platform/android_type/java/lang/object.dart';

// ignore_for_file: non_constant_identifier_names, camel_case_types, missing_return, unused_import
class android_content_Intent extends java_lang_Object {
  @override
  final String tag__ = 'platform';

  Future<Map<String, dynamic>> get bundle async {
    final result = await kMethodChannel.invokeMapMethod<String, dynamic>(
        'android.content.Intent::getBundle', {'__this__': this});
    return result;
  }

  Future<String> get action async {
    final result = await kMethodChannel
        .invokeMethod('android.content.Intent::getAction', {'__this__': this});
    return result;
  }
}
