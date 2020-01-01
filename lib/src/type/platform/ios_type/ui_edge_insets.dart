import 'package:foundation_fluttify/foundation_fluttify.dart';
import 'package:foundation_fluttify/src/object/obejcts.dart';

class UIEdgeInsets extends Ref {
  static Future<UIEdgeInsets> create(
    double top,
    double left,
    double bottom,
    double right,
  ) async {
    final refId = await kMethodChannel
        .invokeMethod('PlatformFactory::createUIEdgeInsets', {
      'top': top,
      'left': left,
      'bottom': bottom,
      'right': right,
    });
    return UIEdgeInsets()
      ..refId = refId
      ..tag = 'platform';
  }

  Future<double> get top {
    return kMethodChannel
        .invokeMethod('UIEdgeInsets::getTop', {'refId': refId});
  }

  Future<double> get left {
    return kMethodChannel
        .invokeMethod('UIEdgeInsets::getLeft', {'refId': refId});
  }

  Future<double> get bottom {
    return kMethodChannel
        .invokeMethod('UIEdgeInsets::getBottom', {'refId': refId});
  }

  Future<double> get right {
    return kMethodChannel
        .invokeMethod('UIEdgeInsets::getRight', {'refId': refId});
  }
}
