import 'package:foundation_fluttify/src/object/obejcts.dart';
import 'package:foundation_fluttify/src/type/base/ref.dart';

// ignore_for_file: non_constant_identifier_names, camel_case_types, missing_return, unused_import
class java_lang_Object extends Ref {
  static Future<java_lang_Object> create(Object content) async {
    assert(content is! Ref, '目前支持支jsonable的参数');
    final refId = await kMethodChannel
        .invokeMethod('PlatformFactory::createjava_lang_Object', {
      'content': content,
    });
    return java_lang_Object()
      ..refId = refId
      ..tag = 'platform';
  }
}
