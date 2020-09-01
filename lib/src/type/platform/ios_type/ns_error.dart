import 'package:foundation_fluttify/foundation_fluttify.dart';

import 'ns_object.dart';

class NSError extends NSObject {
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
