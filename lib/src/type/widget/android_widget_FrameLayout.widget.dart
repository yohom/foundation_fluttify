// ignore_for_file: non_constant_identifier_names, camel_case_types, missing_return, unused_import



import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:foundation_fluttify/foundation_fluttify.dart';
import 'package:foundation_fluttify/src/type/platform/ios_type/ui_view.dart';

typedef _OnViewCreated = Future<void> Function(
    android_widget_FrameLayout? controller);
typedef _OnViewDispose = Future<void> Function();

class android_view_FrameLayoutWidget extends StatefulWidget {
  const android_view_FrameLayoutWidget({
    Key? key,
    this.onFrameLayoutCreated,
    this.onDispose,
    this.gestureRecognizers,
  }) : super(key: key);

  final _OnViewCreated? onFrameLayoutCreated;
  final _OnViewDispose? onDispose;
  final Set<Factory<OneSequenceGestureRecognizer>>? gestureRecognizers;

  @override
  _android_view_FrameLayoutWidgetState createState() =>
      _android_view_FrameLayoutWidgetState();
}

class _android_view_FrameLayoutWidgetState
    extends State<android_view_FrameLayoutWidget> {
  android_widget_FrameLayout? _view;

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
        viewType: 'me.yohom/foundation_fluttify/android.widget.FrameLayout',
        creationParamsCodec: messageCodec,
        gestureRecognizers: gestureRecognizers,
        onPlatformViewCreated: (viewId) async {
          final refId = await viewId2RefId((2147483647 - viewId).toString());
          _view = android_widget_FrameLayout()
            ..refId = 'android.widget.FrameLayout:$refId';
          if (widget.onFrameLayoutCreated != null) {
            await widget.onFrameLayoutCreated!(_view);
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
