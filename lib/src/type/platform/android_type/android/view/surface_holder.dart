import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:foundation_fluttify/foundation_fluttify.dart';

class _android_view_SurfaceHolder_SUB extends java_lang_Object
    with android_view_SurfaceHolder {}

mixin android_view_SurfaceHolder on java_lang_Object {
  static android_view_SurfaceHolder subInstance() =>
      _android_view_SurfaceHolder_SUB();

  @override
  final String tag__ = 'platform';

  Future<void> addCallback(
    android_view_SurfaceHolder_Callback callback,
  ) async {
    // invoke native method
    await kMethodChannel.invokeMethod(
      'android.view.SurfaceHolder::addCallback',
      {'__this__': this, 'callback': callback},
    );

    // handle native call
    MethodChannel(
      'android.view.SurfaceHolder::addCallback::Callback',
      kMethodCodec,
    ).setMethodCallHandler((methodCall) async {
      try {
        final args = methodCall.arguments as Map?;
        switch (methodCall.method) {
          case 'Callback::android.view.SurfaceHolder.Callback::surfaceCreated':
            callback.surfaceCreated(args!['var1']);
            break;
          case 'Callback::android.view.SurfaceHolder.Callback::surfaceChanged':
            callback.surfaceChanged(
              args!['var1'],
              args['var2'],
              args['var3'],
              args['var4'],
            );
            break;
          case 'Callback::android.view.SurfaceHolder.Callback::surfaceDestroyed':
            callback.surfaceDestroyed(args!['var1']);
            break;
          default:
            throw MissingPluginException('方法${methodCall.method}未实现');
        }
      } catch (e) {
        debugPrint(e.toString());
        rethrow;
      }
    });
  }
}

mixin android_view_SurfaceHolder_Callback on java_lang_Object {
  @override
  final String tag__ = 'platform';

  void surfaceCreated(android_view_SurfaceHolder? var1) {}

  void surfaceChanged(
    android_view_SurfaceHolder? var1,
    int? var2,
    int? var3,
    int? var4,
  ) {}

  void surfaceDestroyed(android_view_SurfaceHolder? var1) {}
}
