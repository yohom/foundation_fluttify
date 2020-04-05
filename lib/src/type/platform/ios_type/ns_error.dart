import 'package:foundation_fluttify/foundation_fluttify.dart';

import 'ns_object.dart';

class NSError extends NSObject {
  Future<int> get code async {
    final int errorCode =
        await kMethodChannel.invokeMethod('NSError::getCode', {'refId': refId});
    return errorCode;
  }

  Future<String> get description async {
    final String description = await kMethodChannel
        .invokeMethod('NSError::getDescription', {'refId': refId});
    return description;
  }
}
