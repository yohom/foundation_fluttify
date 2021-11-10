// ignore_for_file: non_constant_identifier_names, camel_case_types, missing_return, unused_import
import 'package:foundation_fluttify/foundation_fluttify.dart';
import 'package:foundation_fluttify/src/type/platform/android_type/android/view/view.dart';

class android_widget_ImageView extends android_view_View {
  @override
  final String tag__ = 'platform';

  Future<android_widget_ImageView> createWithBitmap(
    android_graphics_Bitmap bitmap,
  ) async {
    final result = await kMethodChannel.invokeMethod<Ref>(
      'android.widget.ImageView::createWithBitmap',
      {'bitmap': bitmap},
    );
    return android_widget_ImageView()..refId = result?.refId;
  }
}
