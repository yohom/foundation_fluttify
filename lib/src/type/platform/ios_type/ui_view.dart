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
}
