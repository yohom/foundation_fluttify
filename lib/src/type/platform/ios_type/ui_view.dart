import 'package:foundation_fluttify/src/object/obejcts.dart';

import 'cg_rect.dart';
import 'ns_object.dart';

class UIView extends NSObject {
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
