import 'package:foundation_fluttify/foundation_fluttify.dart';
import 'package:foundation_fluttify/src/constants.dart';

class CGPoint extends Ref {
  Future<int> get x {
    return kMethodChannel.invokeMethod('CGPoint::getX', {'refId': refId});
  }

  Future<int> get y {
    return kMethodChannel.invokeMethod('CGPoint::getY', {'refId': refId});
  }
}
