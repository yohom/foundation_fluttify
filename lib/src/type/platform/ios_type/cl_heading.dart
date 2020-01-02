import 'package:foundation_fluttify/foundation_fluttify.dart';
import 'package:foundation_fluttify/src/object/obejcts.dart';

class CLHeading extends Ref {
  Future<double> get magneticHeading {
    return kMethodChannel
        .invokeMethod('CLHeading::getMagneticHeading', {'refId': refId});
  }

  Future<double> get trueHeading {
    return kMethodChannel
        .invokeMethod('CLHeading::getTrueHeading', {'refId': refId});
  }

  Future<double> get headingAccuracy {
    return kMethodChannel
        .invokeMethod('CLHeading::getHeadingAccuracy', {'refId': refId});
  }
}
