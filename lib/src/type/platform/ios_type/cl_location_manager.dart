import 'package:foundation_fluttify/src/object/obejcts.dart';

import 'ns_object.dart';

class CLLocationManager extends NSObject {
  Future<void> requestAlwaysAuthorization() async {
    await kMethodChannel.invokeMethod(
        'CLLocationManager::requestAlwaysAuthorization', {'refId': refId});
  }

  Future<void> requestWhenInUseAuthorization() async {
    await kMethodChannel.invokeMethod(
        'CLLocationManager::requestWhenInUseAuthorization', {'refId': refId});
  }
}
