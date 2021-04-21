// ignore_for_file: non_constant_identifier_names, camel_case_types, missing_return, unused_import

import 'package:foundation_fluttify/foundation_fluttify.dart';
import 'package:foundation_fluttify/src/object/obejcts.dart';
import 'package:foundation_fluttify/src/type/platform/android_type/java/lang/object.dart';

class android_location_Location extends java_lang_Object {
  static Future<android_location_Location> create(String provider) async {
    final result = await kMethodChannel.invokeMethod<Ref>(
        'android.location.Location::create', {'provider': provider});
    return android_location_Location()..refId = result?.refId;
  }

  @override
  final String tag__ = 'platform';

  Future<double?> get latitude {
    return kMethodChannel.invokeMethod(
        'android.location.Location::getLatitude', {'__this__': this});
  }

  Future<double?> get longitude {
    return kMethodChannel.invokeMethod(
        'android.location.Location::getLongitude', {'__this__': this});
  }

  Future<double?> get bearing {
    return kMethodChannel.invokeMethod(
        'android.location.Location::getBearing', {'__this__': this});
  }

  Future<double?> get altitude {
    return kMethodChannel.invokeMethod(
        'android.location.Location::getAltitude', {'__this__': this});
  }

  Future<double?> get accuracy {
    return kMethodChannel.invokeMethod(
        'android.location.Location::getAccuracy', {'__this__': this});
  }

  Future<double?> get speed {
    return kMethodChannel.invokeMethod(
        'android.location.Location::getSpeed', {'__this__': this});
  }

  Future<void> setLatitude(double latitude) async {
    return kMethodChannel.invokeMethod(
      'android.location.Location::setLatitude',
      {'__this__': this, 'latitude': latitude},
    );
  }

  Future<void> setLongitude(double longitude) async {
    return kMethodChannel.invokeMethod(
      'android.location.Location::setLongitude',
      {'__this__': this, 'longitude': longitude},
    );
  }

  Future<void> setBearing(double bearing) async {
    return kMethodChannel.invokeMethod(
      'android.location.Location::setBearing',
      {'__this__': this, 'bearing': bearing},
    );
  }

  Future<void> setAltitude(double altitude) async {
    return kMethodChannel.invokeMethod(
      'android.location.Location::setAltitude',
      {'__this__': this, 'altitude': altitude},
    );
  }

  Future<void> setAccuracy(double accuracy) async {
    return kMethodChannel.invokeMethod(
      'android.location.Location::setAccuracy',
      {'__this__': this, 'accuracy': accuracy},
    );
  }

  Future<void> setSpeed(double speed) async {
    return kMethodChannel.invokeMethod(
      'android.location.Location::setSpeed',
      {'__this__': this, 'speed': speed},
    );
  }
}
