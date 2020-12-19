// ignore_for_file: non_constant_identifier_names
import 'dart:typed_data';

import 'package:foundation_fluttify/foundation_fluttify.dart';
import 'package:foundation_fluttify/src/object/obejcts.dart';

class NSData extends NSObject {
  @override
  final String tag__ = 'platform';

  static Future<NSData> createWithUint8List(Uint8List data) async {
    final result = await kMethodChannel
        .invokeMethod<Ref>('NSData::createWithUint8List', {'data': data});
    return NSData()..refId = result.refId;
  }

  Future<Uint8List> getData() {
    return kMethodChannel.invokeMethod<Uint8List>(
      'NSData::getData',
      {'__this__': this},
    );
  }
}
