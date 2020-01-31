import 'package:foundation_fluttify/src/object/obejcts.dart';
import 'package:foundation_fluttify/src/type/platform/android_type/java/lang/object.dart';

// ignore_for_file: non_constant_identifier_names, camel_case_types, missing_return, unused_import
class android_os_Bundle extends java_lang_Object {
  static Future<android_os_Bundle> create() async {
    final refId = await kMethodChannel
        .invokeMethod('PlatformService::createandroid_os_Bundle');
    return android_os_Bundle()
      ..refId = refId
      ..tag = 'platform';
  }
}
