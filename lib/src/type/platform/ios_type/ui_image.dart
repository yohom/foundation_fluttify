import 'dart:typed_data';

import 'package:foundation_fluttify/src/constants.dart';

import 'ns_object.dart';

class UIImage extends NSObject {
  UIImage._();

  static Future<UIImage> create(Uint8List bitmapBytes) async {
    final refId = await kMethodChannel.invokeMethod(
        'PlatformFactory::createUIImage', {'bitmapBytes': bitmapBytes});
    return UIImage._()
      ..refId = refId
      ..tag = 'platform';
  }

  Future<Uint8List> get data {
    return kMethodChannel.invokeMethod('UIImage::getData', {'refId': refId});
  }
}
