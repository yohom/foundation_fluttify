// @dart=2.9

import 'package:foundation_fluttify/foundation_fluttify.dart';
import 'package:foundation_fluttify/src/object/obejcts.dart';
import 'package:foundation_fluttify/src/type/platform/android_type/java/lang/object.dart';

import 'broadcast_receiver.dart';
import 'intent.dart';
import 'intent_filter.dart';

// ignore_for_file: non_constant_identifier_names, camel_case_types, missing_return, unused_import
class android_content_Context extends java_lang_Object {
  @override
  final String tag__ = 'platform';

  Future<android_content_Intent> registerReceiver(
    android_content_BroadcastReceiver receiver,
    android_content_IntentFilter intentFilter,
  ) async {
    final result = await kMethodChannel.invokeMethod<Ref>(
      'android.content.Context::registerReceiver',
      {
        '__this__': this,
        'broadcastReceiver': receiver,
        'intentFilter': intentFilter,
      },
    );
    return android_content_Intent()..refId = result.refId;
  }
}
