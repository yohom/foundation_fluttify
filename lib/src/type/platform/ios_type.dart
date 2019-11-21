import 'dart:typed_data';
import 'dart:ui';

import 'package:flutter/services.dart';
import 'package:foundation_fluttify/src/type/base/ref.dart';

import '../../constants.dart';

// ignore_for_file: non_constant_identifier_names, camel_case_types, missing_return, unused_import
class PlatformFactoryIOS {
  static Future<CLLocationCoordinate2D> createCLLocationCoordinate2D(
      double latitude, double longitude) async {
    final int refId = await kMethodChannel.invokeMethod(
        'PlatformFactory::createCLLocationCoordinate2D',
        {'latitude': latitude, 'longitude': longitude});
    return CLLocationCoordinate2D()
      ..refId = refId
      ..tag = 'platform';
  }

  static Future<UIImage> createUIImage(Uint8List bitmapBytes) async {
    final refId = await kMethodChannel.invokeMethod(
        'PlatformFactory::createUIImage', {'bitmapBytes': bitmapBytes});
    return UIImage()
      ..refId = refId
      ..tag = 'platform';
  }

  static Future<UIColor> createUIColor(Color color) async {
    final refId = await kMethodChannel.invokeMethod(
        'PlatformFactory::createUIColor', {'colorValue': color.value});
    return UIColor()
      ..refId = refId
      ..tag = 'platform';
  }

  static Future<void> release(Ref ref) async {
    await kMethodChannel
        .invokeMethod('PlatformFactory::release', {'refId': ref.refId});
  }

  static Future<void> clearHeap() async {
    await kMethodChannel.invokeMethod('PlatformFactory::clearHeap');
  }

  static Future<void> pushStack(String name, Ref ref) async {
    await kMethodChannel.invokeMethod(
        'PlatformFactory::pushStack', {'name': name, 'refId': ref.refId});
  }

  static Future<void> pushStackJsonable(String name, dynamic jsonable) async {
    await kMethodChannel.invokeMethod(
        'PlatformFactory::pushStackJsonable', {'name': name, 'data': jsonable});
  }

  static Future<void> clearStack() async {
    await kMethodChannel.invokeMethod('PlatformFactory::clearStack');
  }
}

class NSObject extends Ref {}

// STRUCT
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

class CLHeading extends Ref {}

class CGRect extends Ref {}

class CGPoint extends Ref {}

class CGSize extends Ref {}

class UIEdgeInsets extends Ref {}

// CLASS
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

class CLFloor extends NSObject {
  Future<String> get level {
    return kMethodChannel.invokeMethod('CLFloor::get_level', {'refId': refId});
  }
}

class NSError extends NSObject {}

mixin NSCoding on NSObject {}

mixin NSCopying on NSObject {}

class UIView extends NSObject {}

class UIControl extends NSObject {}

class UIImage extends NSObject {
  Future<Uint8List> get data {
    return kMethodChannel.invokeMethod('UIImage::getData', {'refId': refId});
  }
}

class UIColor extends NSObject {}

// ENUM
enum CLAuthorizationStatus {
  kCLAuthorizationStatusNotDetermined,
  kCLAuthorizationStatusRestricted,
  kCLAuthorizationStatusDenied,
  kCLAuthorizationStatusAuthorizedAlways,
  kCLAuthorizationStatusAuthorizedWhenInUse,
  kCLAuthorizationStatusAuthorized,
}

@Deprecated('PlatformFactoryIOS代替')
class PlatformFactory_iOS {
  static Future<CLLocationCoordinate2D> createCLLocationCoordinate2D(
      double latitude, double longitude) async {
    final int refId = await kMethodChannel.invokeMethod(
        'PlatformFactory::createCLLocationCoordinate2D',
        {'latitude': latitude, 'longitude': longitude});
    return CLLocationCoordinate2D()
      ..refId = refId
      ..tag = 'platform';
  }

  static Future<UIImage> createUIImage(Uint8List bitmapBytes) async {
    final refId = await kMethodChannel.invokeMethod(
        'PlatformFactory::createUIImage', {'bitmapBytes': bitmapBytes});
    return UIImage()
      ..refId = refId
      ..tag = 'platform';
  }

  static Future<UIColor> createUIColor(int colorValue) async {
    final refId = await kMethodChannel.invokeMethod(
        'PlatformFactory::createUIColor', {'colorValue': colorValue});
    return UIColor()
      ..refId = refId
      ..tag = 'platform';
  }

  static Future<void> release(Ref ref) async {
    await kMethodChannel
        .invokeMethod('PlatformFactory::release', {'refId': ref.refId});
  }

  static Future<void> clearHeap() async {
    await kMethodChannel.invokeMethod('PlatformFactory::clearHeap');
  }

  static Future<void> pushStack(String name, Ref ref) async {
    await kMethodChannel.invokeMethod(
        'PlatformFactory::pushStack', {'name': name, 'refId': ref.refId});
  }

  static Future<void> pushStackJsonable(String name, dynamic jsonable) async {
    await kMethodChannel.invokeMethod(
        'PlatformFactory::pushStackJsonable', {'name': name, 'data': jsonable});
  }

  static Future<void> clearStack() async {
    await kMethodChannel.invokeMethod('PlatformFactory::clearStack');
  }
}
