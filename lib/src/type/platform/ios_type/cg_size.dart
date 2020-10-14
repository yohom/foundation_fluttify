// ignore_for_file: non_constant_identifier_names
import 'package:foundation_fluttify/foundation_fluttify.dart';

class CGSize extends Ref {
  @override
  final String tag__ = 'platform';

  static Future<CGSize> create(
    double width,
    double height,
  ) async {
    final result = await kMethodChannel.invokeMethod<Ref>('CGSize::create', {
      'width': width,
      'height': height,
    });
    return CGSize()..refId = result.refId;
  }

  Future<double> get width {
    return kMethodChannel.invokeMethod('CGSize::getWidth', {'__this__': this});
  }

  Future<double> get height {
    return kMethodChannel.invokeMethod('CGSize::getHeight', {'__this__': this});
  }
}
