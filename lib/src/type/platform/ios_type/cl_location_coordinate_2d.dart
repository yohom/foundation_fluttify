import 'package:foundation_fluttify/foundation_fluttify.dart';
import 'package:foundation_fluttify/src/object/obejcts.dart';

class CLLocationCoordinate2D extends Ref {
  static Future<CLLocationCoordinate2D> create(
    double latitude,
    double longitude,
  ) async {
    final int refId = await kMethodChannel.invokeMethod(
        'CLLocationCoordinate2D::createCLLocationCoordinate2D',
        {'latitude': latitude, 'longitude': longitude});
    return CLLocationCoordinate2D()
      ..refId = refId
      ..tag__ = 'platform';
  }

  // ignore: non_constant_identifier_names
  static Future<List<CLLocationCoordinate2D>> create_batch(
    List<double> latitudeBatch,
    List<double> longitudeBatch,
  ) async {
    final List resultBatch = await kMethodChannel.invokeMethod(
        'CLLocationCoordinate2D::create_batchCLLocationCoordinate2D', {
      'latitude_batch': latitudeBatch,
      'longitude_batch': longitudeBatch,
    });
    return resultBatch
        .cast<int>()
        .map((refId) => CLLocationCoordinate2D()
          ..refId = refId
          ..tag__ = 'platform')
        .toList();
  }

  Future<double> get latitude {
    return kMethodChannel
        .invokeMethod('CLLocationCoordinate2D::get_latitude', {'refId': refId});
  }

  Future<double> get longitude {
    return kMethodChannel.invokeMethod(
        'CLLocationCoordinate2D::get_longitude', {'refId': refId});
  }
}
