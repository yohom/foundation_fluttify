// ignore_for_file: non_constant_identifier_names, camel_case_types, missing_return, unused_import

// @dart=2.9

import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:foundation_fluttify/foundation_fluttify.dart';
import 'package:foundation_fluttify/src/type/platform/ios_type/ui_view.dart';

typedef _OnViewCreated = Future<void> Function(
  android_view_SurfaceView controller,
);
typedef _OnViewDispose = Future<void> Function();

class android_view_SurfaceViewWidget extends StatefulWidget {
  const android_view_SurfaceViewWidget({
    Key key,
    this.onSurfaceViewCreated,
    this.surfaceCreated,
    this.surfaceChanged,
    this.surfaceDestroyed,
    this.onDispose,
    this.gestureRecognizers,
  }) : super(key: key);

  final _OnViewCreated onSurfaceViewCreated;
  final ValueChanged<android_view_SurfaceHolder> surfaceCreated;
  final void Function(android_view_SurfaceHolder, int, int, int) surfaceChanged;
  final ValueChanged<android_view_SurfaceHolder> surfaceDestroyed;
  final _OnViewDispose onDispose;
  final Set<Factory<OneSequenceGestureRecognizer>> gestureRecognizers;

  @override
  _android_view_SurfaceViewWidgetState createState() =>
      _android_view_SurfaceViewWidgetState();
}

class _android_view_SurfaceViewWidgetState
    extends State<android_view_SurfaceViewWidget> {
  android_view_SurfaceView _view;

  @override
  void initState() {
    super.initState();
    MethodChannel(
      'android.view.SurfaceHolder::addCallback::Callback',
      kMethodCodec,
    ).setMethodCallHandler((methodCall) async {
      try {
        final args = methodCall.arguments as Map;
        switch (methodCall.method) {
          case 'Callback::android.view.SurfaceHolder.Callback::surfaceCreated':
            if (widget.surfaceCreated != null) {
              final ref = args['holder'] as Ref;
              widget.surfaceCreated(
                android_view_SurfaceHolder.subInstance()..refId = ref.refId,
              );
            }
            break;
          case 'Callback::android.view.SurfaceHolder.Callback::surfaceChanged':
            if (widget.surfaceChanged != null) {
              final ref = args['holder'] as Ref;
              widget.surfaceChanged(
                android_view_SurfaceHolder.subInstance()..refId = ref.refId,
                args['format'],
                args['width'],
                args['height'],
              );
            }
            break;
          case 'Callback::android.view.SurfaceHolder.Callback::surfaceDestroyed':
            if (widget.surfaceDestroyed != null) {
              final ref = args['holder'] as Ref;
              widget.surfaceDestroyed(
                android_view_SurfaceHolder.subInstance()..refId = ref.refId,
              );
            }
            break;
          default:
            throw MissingPluginException('方法${methodCall.method}未实现');
            break;
        }
      } catch (e) {
        debugPrint(e);
        rethrow;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    if (Platform.isAndroid) {
      final gestureRecognizers = widget.gestureRecognizers ??
          <Factory<OneSequenceGestureRecognizer>>{
            Factory<OneSequenceGestureRecognizer>(
                () => EagerGestureRecognizer()),
          };
      final messageCodec = FluttifyMessageCodec();
      return AndroidView(
        viewType: 'me.yohom/foundation_fluttify/android.view.SurfaceView',
        creationParamsCodec: messageCodec,
        gestureRecognizers: gestureRecognizers,
        onPlatformViewCreated: (viewId) async {
          final refId = await viewId2RefId((2147483647 - viewId).toString());
          _view = android_view_SurfaceView()
            ..refId = 'android.view.SurfaceView:$refId';
          if (widget.onSurfaceViewCreated != null) {
            await widget.onSurfaceViewCreated(_view);
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
      widget.onDispose().then((_) => _view.release__());
    } else {
      _view.release__();
    }
    super.dispose();
  }
}
