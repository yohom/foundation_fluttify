// ignore_for_file: non_constant_identifier_names, camel_case_types, missing_return, unused_import
import 'package:foundation_fluttify/src/object/obejcts.dart';
import 'package:foundation_fluttify/src/type/platform/android_type/android/view/view.dart';

class android_view_ViewGroup extends android_view_View {
  @override
  final String tag__ = 'platform';

  Future<void> addView(android_view_View child) {
    return kMethodChannel.invokeMethod(
      'android.view.ViewGroup::addView',
      {'__this__': this, 'child': child},
    );
  }

  Future<void> removeAllViews() {
    return kMethodChannel.invokeMethod(
      'android.view.ViewGroup::removeAllViews',
      {'__this__': this},
    );
  }
}
