// ignore_for_file: non_constant_identifier_names
import 'package:foundation_fluttify/foundation_fluttify.dart';
import 'package:foundation_fluttify/src/object/obejcts.dart';

class CGPoint extends Ref {
  static Future<CGPoint> create(double x, double y) async {
    final refId =
        await kMethodChannel.invokeMethod('CGPoint::create', {'x': x, 'y': y});
    return CGPoint()..refId = refId;
  }

  static Future<List<CGPoint>> create_batch(
    List<double> x,
    List<double> y,
  ) async {
    final refIdBatch = await kMethodChannel
        .invokeMethod('CGPoint::create_batch', {'x': x, 'y': y});
    return [for (final refId in refIdBatch) CGPoint()..refId = refId];
  }

  @override
  final String tag__ = 'platform';

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
