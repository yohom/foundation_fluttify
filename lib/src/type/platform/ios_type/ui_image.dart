import 'dart:typed_data';

import 'package:foundation_fluttify/src/constants.dart';

import 'ns_object.dart';

class UIImage extends NSObject {
  Future<Uint8List> get data {
    return kMethodChannel.invokeMethod('UIImage::getData', {'refId': refId});
  }
}
