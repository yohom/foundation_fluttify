// ignore_for_file: non_constant_identifier_names, camel_case_types, missing_return, unused_import
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:foundation_fluttify/foundation_fluttify.dart';
import 'package:foundation_fluttify/src/type/platform/ios_type/ui_view.dart';

typedef OnViewCreated = Future<void> Function(
    android_view_SurfaceView controller);
typedef _OnViewDispose = Future<void> Function();

class android_view_SurfaceViewWidget extends StatefulWidget {
  const android_view_SurfaceViewWidget({
    Key key,
    this.onSurfaceViewCreated,
    this.onDispose,
    this.gestureRecognizers,
  }) : super(key: key);

  final OnViewCreated onSurfaceViewCreated;
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
