import 'package:foundation_fluttify/foundation_fluttify.dart';
import 'package:foundation_fluttify/src/object/obejcts.dart';
import 'package:foundation_fluttify/src/type/platform/android_type/java/lang/object.dart';

// ignore_for_file: non_constant_identifier_names, camel_case_types, missing_return, unused_import
class android_os_Bundle extends java_lang_Object {
  static Future<android_os_Bundle> create() async {
    final result =
        await kMethodChannel.invokeMethod<Ref>('android.os.Bundle::create');
    return android_os_Bundle()..refId = result.refId;
  }

  @override
  final String tag__ = 'platform';

  Future<void> putString(String key, String value) {
    return kMethodChannel.invokeMethod('android.os.Bundle::putString', {
      '__this__': this,
      'key': key,
      'value': value,
    });
  }

  Future<void> putInt(String key, int value) {
    return kMethodChannel.invokeMethod('android.os.Bundle::putInt', {
      '__this__': this,
      'key': key,
      'value': value,
    });
  }

  Future<String> getString(String key) {
    return kMethodChannel.invokeMethod<String>(
      'android.os.Bundle::getString',
      {'__this__': this, 'key': key},
    );
  }

  Future<int> getInt(String key) {
    return kMethodChannel.invokeMethod<int>(
      'android.os.Bundle::getInt',
      {'__this__': this, 'key': key},
    );
  }
}
