import 'package:foundation_fluttify/foundation_fluttify.dart';
import 'package:foundation_fluttify/src/object/obejcts.dart';

class CGPoint extends Ref {
  static Future<CGPoint> create(double x, double y) async {
    final refId =
        await kMethodChannel.invokeMethod('CGPoint::create', {'x': x, 'y': y});
    return CGPoint()
      ..refId = refId
      ..tag = 'platform';
  }

  Future<double> get x {
    return kMethodChannel.invokeMethod('CGPoint::getX', {'refId': refId});
  }

  Future<double> get y {
    return kMethodChannel.invokeMethod('CGPoint::getY', {'refId': refId});
  }
}
