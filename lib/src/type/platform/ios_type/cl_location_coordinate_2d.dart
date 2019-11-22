import 'package:foundation_fluttify/foundation_fluttify.dart';

import '../../../constants.dart';

class CLLocationCoordinate2D extends Ref {
  Future<double> get latitude {
    return kMethodChannel
        .invokeMethod('CLLocationCoordinate2D::get_latitude', {'refId': refId});
  }

  Future<double> get longitude {
    return kMethodChannel.invokeMethod(
        'CLLocationCoordinate2D::get_longitude', {'refId': refId});
  }
}
