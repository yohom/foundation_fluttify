import 'package:foundation_fluttify/foundation_fluttify.dart';

class CGRect extends Ref {
  static Future<CGRect> create(
    double x,
    double y,
    double width,
    double height,
  ) async {
    final refId = await kMethodChannel.invokeMethod('CGRect::create', {
      'x': x,
      'y': y,
      'width': width,
      'height': height,
    });
    return CGRect()
      ..refId = refId
      ..tag__ = 'platform';
  }
}
