import 'package:flutter/services.dart';
import 'package:foundation_fluttify/src/type/platform/android_type/android/content/intent.dart';

class FluttifyBroadcastEventChannel extends EventChannel {
  const FluttifyBroadcastEventChannel(String name) : super(name);

  @override
  Stream<android_content_Intent> receiveBroadcastStream([dynamic arguments]) {
    return super
        .receiveBroadcastStream(arguments)
        .map((event) => android_content_Intent()..refId = event);
  }
}
