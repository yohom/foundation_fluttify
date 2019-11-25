import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:foundation_fluttify/src/type/base/ref.dart';

import '../../../constants.dart';
import 'cl_location_coordinate_2d.dart';
import 'ns_data.dart';
import 'ui_color.dart';
import 'ui_image.dart';

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

  static Future<NSData> createNSDataWithUint8List(Uint8List data) async {
    final refId = await kMethodChannel.invokeMethod(
        'PlatformFactory::createNSDataWithUint8List', {'data': data});
    return NSData()
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
