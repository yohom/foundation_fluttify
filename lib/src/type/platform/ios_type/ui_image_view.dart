import 'package:foundation_fluttify/foundation_fluttify.dart';
import 'package:foundation_fluttify/src/object/obejcts.dart';

import 'ui_view.dart';

class UIImageView extends UIView {
  static Future<UIImageView> create(UIImage image) async {
    final result = await kMethodChannel.invokeMethod(
      'UIImageView::create',
      {'image': image.refId},
    );
    return UIImageView()..refId = result;
  }
}
