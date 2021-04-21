// ignore_for_file: non_constant_identifier_names, camel_case_types, missing_return, unused_import



import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:foundation_fluttify/foundation_fluttify.dart';
import 'package:foundation_fluttify/src/type/platform/ios_type/ui_view.dart';

typedef _OnViewCreated = Future<void> Function(
  android_opengl_GLSurfaceView? controller,
);
typedef _OnViewDispose = Future<void> Function();

class android_opengl_GLSurfaceViewWidget extends StatefulWidget {
  const android_opengl_GLSurfaceViewWidget({
    Key? key,
    this.onGLSurfaceViewCreated,
    this.onDispose,
    this.gestureRecognizers,
  }) : super(key: key);

  final _OnViewCreated? onGLSurfaceViewCreated;
  final _OnViewDispose? onDispose;
  final Set<Factory<OneSequenceGestureRecognizer>>? gestureRecognizers;

  @override
  _android_opengl_GLSurfaceViewWidgetState createState() =>
      _android_opengl_GLSurfaceViewWidgetState();
}

class _android_opengl_GLSurfaceViewWidgetState
    extends State<android_opengl_GLSurfaceViewWidget> {
  android_opengl_GLSurfaceView? _view;

  @override
  Widget build(BuildContext context) {
    if (Platform.isAndroid) {
      final gestureRecognizers = widget.gestureRecognizers ??
          <Factory<OneSequenceGestureRecognizer>>{
            Factory<OneSequenceGestureRecognizer>(
                () => EagerGestureRecognizer()),
          };
      final messageCodec = FluttifyMessageCodec(tag: 'platform');
      return AndroidView(
        viewType: 'me.yohom/foundation_fluttify/android.opengl.GLSurfaceView',
        creationParamsCodec: messageCodec,
        gestureRecognizers: gestureRecognizers,
        onPlatformViewCreated: (viewId) async {
          final refId = await viewId2RefId((2147483647 - viewId).toString());
          _view = android_opengl_GLSurfaceView()
            ..refId = 'android.opengl.GLSurfaceView:$refId';
          if (widget.onGLSurfaceViewCreated != null) {
            await widget.onGLSurfaceViewCreated!(_view);
          }
        },
      );
    } else {
      return Center(child: Text('不支持的平台'));
    }
  }

  @override
  void dispose() {
    if (widget.onDispose != null) {
      widget.onDispose!().then((_) => _view!.release__());
    } else {
      _view!.release__();
    }
    super.dispose();
  }
}
