// ignore_for_file: non_constant_identifier_names
import 'package:foundation_fluttify/foundation_fluttify.dart';
import 'package:foundation_fluttify/src/object/obejcts.dart';

import 'ui_view.dart';

class UIImageView extends UIView {
  @override
  final String tag__ = 'platform';

  static Future<UIImageView> create(UIImage image) async {
    final result = await kMethodChannel.invokeMethod<Ref>(
      'UIImageView::create',
      {'image': image},
    );
    return UIImageView()..refId = result.refId;
  }
}
