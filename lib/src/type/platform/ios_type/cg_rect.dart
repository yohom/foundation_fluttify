import 'package:foundation_fluttify/foundation_fluttify.dart';

class CGRect extends Ref {
  static Future<CGRect> create(
    double x,
    double y,
    double width,
    double height,
  ) async {
    final refId = await kMethodChannel.invokeMethod('CGRect::create', {
      'x': x,
      'y': y,
      'width': width,
      'height': height,
    });
    return CGRect()
      ..refId = refId
      ..tag__ = 'platform';
  }

  Future<double> get x {
    return kMethodChannel.invokeMethod('CGRect::getX', {'refId': refId});
  }

  Future<double> get y {
    return kMethodChannel.invokeMethod('CGRect::getY', {'refId': refId});
  }

  Future<double> get width {
    return kMethodChannel.invokeMethod('CGRect::getWidth', {'refId': refId});
  }

  Future<double> get height {
    return kMethodChannel.invokeMethod('CGRect::getHeight', {'refId': refId});
  }
}
