import 'package:foundation_fluttify/src/object/obejcts.dart';

import 'cl_floor.dart';
import 'cl_location_coordinate_2d.dart';
import 'ns_object.dart';

class CLLocation extends NSObject {
  Future<CLLocationCoordinate2D> get coordinate async {
    final result = await kMethodChannel
        .invokeMethod('CLLocation::get_coordinate', {'refId': refId});
    return CLLocationCoordinate2D()..refId = result;
  }

  Future<double> get altitude {
    return kMethodChannel
        .invokeMethod('CLLocation::get_altitude', {'refId': refId});
  }

  Future<double> get horizontalAccuracy {
    return kMethodChannel
        .invokeMethod('CLLocation::get_horizontalAccuracy', {'refId': refId});
  }

  Future<double> get verticalAccuracy {
    return kMethodChannel
        .invokeMethod('CLLocation::get_verticalAccuracy', {'refId': refId});
  }

  Future<double> get course {
    return kMethodChannel
        .invokeMethod('CLLocation::get_course', {'refId': refId});
  }

  Future<double> get speed {
    return kMethodChannel
        .invokeMethod('CLLocation::get_speed', {'refId': refId});
  }

  Future<CLFloor> get floor async {
    final result = await kMethodChannel
        .invokeMethod('CLLocation::get_floor', {'refId': refId});
    return CLFloor()..refId = result;
  }
}
