// ignore_for_file: non_constant_identifier_names, camel_case_types, missing_return, unused_import
import 'package:foundation_fluttify/src/object/obejcts.dart';
import 'package:foundation_fluttify/src/type/platform/android_type/java/lang/object.dart';

class android_location_Location extends java_lang_Object {
  static Future<android_location_Location> create(String provider) async {
    assert(provider != null);
    final refId = await kMethodChannel.invokeMethod(
        'android.location.Location::create', {'provider': provider});
    return android_location_Location()
      ..refId = refId
      ..tag__ = 'platform';
  }

  Future<double> get latitude {
    return kMethodChannel.invokeMethod(
        'android.location.Location::getLatitude', {'refId': refId});
  }

  Future<double> get longitude {
    return kMethodChannel.invokeMethod(
        'android.location.Location::getLongitude', {'refId': refId});
  }

  Future<double> get bearing {
    return kMethodChannel.invokeMethod(
        'android.location.Location::getBearing', {'refId': refId});
  }

  Future<double> get altitude {
    return kMethodChannel.invokeMethod(
        'android.location.Location::getAltitude', {'refId': refId});
  }

  Future<double> get accuracy {
    return kMethodChannel.invokeMethod(
        'android.location.Location::getAccuracy', {'refId': refId});
  }

  Future<double> get speed {
    return kMethodChannel
        .invokeMethod('android.location.Location::getSpeed', {'refId': refId});
  }
}
