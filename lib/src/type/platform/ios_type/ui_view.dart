import 'package:foundation_fluttify/src/object/obejcts.dart';

import 'cg_rect.dart';
import 'ns_object.dart';

class UIView extends NSObject {
  static Future<UIView> create() async {
    final result = await kMethodChannel.invokeMethod('UIView::create');
    return UIView()..refId = result;
  }

  Future<void> rotate(double angle) async {
    assert(angle != null);
    await kMethodChannel.invokeMethod('UIView::rotate', {
      'refId': refId,
      'angle': angle,
    });
  }

  Future<void> scaleWithDuration({
    double duration = 1,
    double x = 0,
    double toX = 1,
    double y = 0,
    double toY = 1,
  }) async {
    assert(duration != null);
    await kMethodChannel.invokeMethod('UIView::scaleWithDuration', {
      'refId': refId,
      'duration': duration,
      'x': x,
      'toX': toX,
      'y': y,
      'toY': toY,
    });
  }

  Future<CGRect> get frame async {
    final result =
        await kMethodChannel.invokeMethod('UIView::getFrame', {'refId': refId});
    return CGRect()..refId = result;
  }

  Future<bool> get hidden async {
    final result = await kMethodChannel
        .invokeMethod('UIView::getHidden', {'refId': refId});
    return result;
  }

  Future<void> setHidden(bool hidden) async {
    assert(hidden != null);
    await kMethodChannel.invokeMethod('UIView::setHidden', {
      'refId': refId,
      'hidden': hidden,
    });
  }

  Future<void> setAnchorPoint(double anchorU, double anchorV) async {
    assert(hidden != null);
    await kMethodChannel.invokeMethod('UIView::setAnchorPoint', {
      'refId': refId,
      'anchorU': anchorU,
      'anchorV': anchorV,
    });
  }
}
