// ignore_for_file: non_constant_identifier_names, camel_case_types, missing_return, unused_import
import 'package:foundation_fluttify/src/type/platform/android_type/java/lang/object.dart';

import '../../../../../constants.dart';

class android_location_Location extends java_lang_Object {
  Future<double> get latitude {
    return kMethodChannel.invokeMethod(
        'android.location.Location::getLatitude', {'refId': refId});
  }

  Future<double> get longitude {
    return kMethodChannel.invokeMethod(
        'android.location.Location::getLongitude', {'refId': refId});
  }
}
