// ignore_for_file: non_constant_identifier_names

import 'package:foundation_fluttify/foundation_fluttify.dart';

class CGRect extends Ref {
  @override
  final String tag__ = 'platform';

  static Future<CGRect> create(
    double x,
    double y,
    double width,
    double height,
  ) async {
    final result = await kMethodChannel.invokeMethod<Ref>('CGRect::create', {
      'x': x,
      'y': y,
      'width': width,
      'height': height,
    });
    return CGRect()..refId = result?.refId;
  }

  Future<double?> get x {
    return kMethodChannel.invokeMethod('CGRect::getX', {'__this__': this});
  }

  Future<double?> get y {
    return kMethodChannel.invokeMethod('CGRect::getY', {'__this__': this});
  }

  Future<double?> get width {
    return kMethodChannel.invokeMethod('CGRect::getWidth', {'__this__': this});
  }

  Future<double?> get height {
    return kMethodChannel.invokeMethod('CGRect::getHeight', {'__this__': this});
  }
}
