import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:foundation_fluttify/foundation_fluttify.dart';
import 'package:foundation_fluttify/src/type/base/ref.dart';

import '../constants.dart';
import '../type/platform/ios_type/cl_location_coordinate_2d.dart';
import '../type/platform/ios_type/ns_data.dart';
import '../type/platform/ios_type/ui_color.dart';
import '../type/platform/ios_type/ui_image.dart';

// ignore_for_file: non_constant_identifier_names, camel_case_types, missing_return, unused_import
Future<CLLocationCoordinate2D> createCLLocationCoordinate2D(
    double latitude, double longitude) async {
  final int refId = await kMethodChannel.invokeMethod(
      'PlatformFactory::createCLLocationCoordinate2D',
      {'latitude': latitude, 'longitude': longitude});
  return CLLocationCoordinate2D()
    ..refId = refId
    ..tag = 'platform';
}

Future<UIImage> createUIImage(Uint8List bitmapBytes) async {
  final refId = await kMethodChannel.invokeMethod(
      'PlatformFactory::createUIImage', {'bitmapBytes': bitmapBytes});
  return UIImage()
    ..refId = refId
    ..tag = 'platform';
}

Future<UIColor> createUIColor(Color color) async {
  final refId = await kMethodChannel.invokeMethod(
      'PlatformFactory::createUIColor', {'colorValue': color.value});
  return UIColor()
    ..refId = refId
    ..tag = 'platform';
}

Future<NSData> createNSDataWithUint8List(Uint8List data) async {
  final refId = await kMethodChannel.invokeMethod(
      'PlatformFactory::createNSDataWithUint8List', {'data': data});
  return NSData()
    ..refId = refId
    ..tag = 'platform';
}

Future<CGPoint> createCGPoint(double x, double y) async {
  final refId = await kMethodChannel
      .invokeMethod('PlatformFactory::createCGPoint', {'x': x, 'y': y});
  return CGPoint()
    ..refId = refId
    ..tag = 'platform';
}

Future<UIEdgeInsets> createUIEdgeInsets(
  double top,
  double left,
  double bottom,
  double right,
) async {
  final refId =
      await kMethodChannel.invokeMethod('PlatformFactory::createUIEdgeInsets', {
    'top': top,
    'left': left,
    'bottom': bottom,
    'right': right,
  });
  return UIEdgeInsets()
    ..refId = refId
    ..tag = 'platform';
}
