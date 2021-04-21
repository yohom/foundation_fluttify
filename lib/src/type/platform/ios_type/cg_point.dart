// ignore_for_file: non_constant_identifier_names

// @dart=2.9

import 'dart:math';

import 'package:foundation_fluttify/foundation_fluttify.dart';
import 'package:foundation_fluttify/src/object/obejcts.dart';

class CGPoint extends Ref {
  @override
  final String tag__ = 'platform';

  static Future<CGPoint> create(double x, double y) async {
    final result = await kMethodChannel
        .invokeMethod<Ref>('CGPoint::create', {'x': x, 'y': y});
    return CGPoint()..refId = result.refId;
  }

  static Future<CGPoint> createWithPoint(Point point) async {
    final result = await kMethodChannel
        .invokeMethod<Ref>('CGPoint::create', {'x': point.x, 'y': point.y});
    return CGPoint()..refId = result.refId;
  }

  static Future<List<CGPoint>> create_batch(
    List<double> x,
    List<double> y,
  ) async {
    final resultBatch = await kMethodChannel
        .invokeListMethod<Ref>('CGPoint::create_batch', {'x': x, 'y': y});
    return [for (final item in resultBatch) CGPoint()..refId = item.refId];
  }

  Future<double> get x {
    return kMethodChannel.invokeMethod('CGPoint::getX', {'__this__': this});
  }

  Future<double> get y {
    return kMethodChannel.invokeMethod('CGPoint::getY', {'__this__': this});
  }
}

extension CGPointListX on List<CGPoint> {
  Future<List<double>> get x_batch {
    return kMethodChannel
        .invokeMethod('CGPoint::getX_batch', {'__this__': this});
  }

  Future<List<double>> get y_batch {
    return kMethodChannel
        .invokeMethod('CGPoint::getY_batch', {'__this__': this});
  }
}
