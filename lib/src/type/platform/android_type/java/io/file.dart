import 'package:foundation_fluttify/foundation_fluttify.dart';

// ignore_for_file: non_constant_identifier_names, camel_case_types, missing_return, unused_import
class java_io_File extends java_lang_Object {
  static Future<java_io_File> create(String path) async {
    final result = await kMethodChannel
        .invokeMethod('java.io.File::create', {'path': path});
    return java_io_File()
      ..refId = result
      ..tag__ = 'platform';
  }

  final String tag__ = 'platform';
}
