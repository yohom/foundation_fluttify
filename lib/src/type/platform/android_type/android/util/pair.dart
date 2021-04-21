// ignore_for_file: non_constant_identifier_names, camel_case_types, missing_return, unused_import



import 'package:foundation_fluttify/src/object/obejcts.dart';
import 'package:foundation_fluttify/src/type/platform/android_type/java/lang/object.dart';

class android_util_Pair extends java_lang_Object {
  @override
  final String tag__ = 'platform';

  Future<Object?> get first {
    return kMethodChannel
        .invokeMethod('android.util.Pair::getFirst', {'__this__': this});
  }

  Future<Object?> get second {
    return kMethodChannel
        .invokeMethod('android.util.Pair::getSecond', {'__this__': this});
  }
}
