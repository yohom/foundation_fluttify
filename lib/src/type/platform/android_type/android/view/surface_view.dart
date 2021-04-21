// @dart=2.9

import 'package:foundation_fluttify/foundation_fluttify.dart';

class android_view_SurfaceView extends android_view_View {
  @override
  final String tag__ = 'platform';

  Future<android_view_SurfaceHolder> getHolder() async {
    final result = await kMethodChannel.invokeMethod<Ref>(
      'android.view.SurfaceView::getHolder',
      {'__this__': this},
    );
    return android_view_SurfaceHolder.subInstance()..refId = result.refId;
  }

  Future<void> setZOrderOnTop(bool onTop) async {
    await kMethodChannel.invokeMethod(
      'android.view.SurfaceView::setZOrderOnTop',
      {'__this__': this, 'onTop': onTop},
    );
  }

  Future<void> setZOrderMediaOverlay(bool isMediaOverlay) async {
    await kMethodChannel.invokeMethod(
      'android.view.SurfaceView::setZOrderMediaOverlay',
      {'__this__': this, 'isMediaOverlay': isMediaOverlay},
    );
  }
}
