import 'dart:typed_data';

import 'package:foundation_fluttify/src/object/obejcts.dart';

import 'ns_object.dart';

class UIImage extends NSObject {
  static Future<UIImage> create(Uint8List bitmapBytes) async {
    final refId = await kMethodChannel
        .invokeMethod('UIImage::createUIImage', {'bitmapBytes': bitmapBytes});
    return UIImage()
      ..refId = refId
      ..tag = 'platform';
  }

  Future<Uint8List> get data {
    return kMethodChannel.invokeMethod('UIImage::getData', {'refId': refId});
  }
}
