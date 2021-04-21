// ignore_for_file: non_constant_identifier_names

// @dart=2.9

import 'package:foundation_fluttify/foundation_fluttify.dart';

import 'ns_object.dart';

class NSError extends NSObject {
  @override
  final String tag__ = 'platform';

  Future<int> get code async {
    final int errorCode = await kMethodChannel
        .invokeMethod('NSError::getCode', {'__this__': this});
    return errorCode;
  }

  Future<String> get description async {
    final String description = await kMethodChannel
        .invokeMethod('NSError::getDescription', {'__this__': this});
    return description;
  }
}
