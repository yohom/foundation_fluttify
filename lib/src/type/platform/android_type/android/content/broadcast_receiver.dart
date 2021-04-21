import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:foundation_fluttify/foundation_fluttify.dart';
import 'package:foundation_fluttify/src/object/obejcts.dart';
import 'package:foundation_fluttify/src/type/platform/android_type/java/lang/object.dart';

import 'intent.dart';

// ignore_for_file: non_constant_identifier_names, camel_case_types, missing_return, unused_import
class android_content_BroadcastReceiver extends java_lang_Object {
  @override
  final String tag__ = 'platform';

  Future<android_content_BroadcastReceiver> create(
    ValueChanged<android_content_Intent> onReceive,
  ) async {
    final result = await kMethodChannel.invokeMethod<Ref>(
      'android.content.Context::registerReceiver',
      {
        '__this__': this,
        'broadcastReceiver': '',
        'intentFilter': '',
      },
    );

    MethodChannel('android.content.BroadcastReceiver::create::Callback')
        .setMethodCallHandler((call) async {
      if (call.method ==
          'Callback::android.content.BroadcastReceiver::onReceive') {
        final intentRefId = call.arguments['intent'] as String;
        final intent = android_content_Intent()..refId = intentRefId;
        onReceive(intent);
      }
    });
    return android_content_BroadcastReceiver()..refId = result?.refId;
  }
}
