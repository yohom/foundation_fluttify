import 'package:foundation_fluttify/foundation_fluttify.dart';
import 'package:foundation_fluttify/src/constants.dart';

class CGPoint extends Ref {
  Future<double> get x {
    return kMethodChannel.invokeMethod('CGPoint::getX', {'refId': refId});
  }

  Future<double> get y {
    return kMethodChannel.invokeMethod('CGPoint::getY', {'refId': refId});
  }
}
