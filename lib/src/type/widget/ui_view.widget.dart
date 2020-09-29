import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:foundation_fluttify/foundation_fluttify.dart';
import 'package:foundation_fluttify/src/type/platform/ios_type/ui_view.dart';

typedef OnUIViewCreated = Future<void> Function(UIView controller);
typedef _OnUiKitViewDispose = Future<void> Function();

class UIViewWidget extends StatefulWidget {
  const UIViewWidget({
    Key key,
    this.onUIViewCreated,
    this.onDispose,
    this.gestureRecognizers,
  }) : super(key: key);

  final OnUIViewCreated onUIViewCreated;
  final _OnUiKitViewDispose onDispose;
  final Set<Factory<OneSequenceGestureRecognizer>> gestureRecognizers;

  @override
  _UIViewWidgetState createState() => _UIViewWidgetState();
}

class _UIViewWidgetState extends State<UIViewWidget> {
  UIView _view;

  @override
  Widget build(BuildContext context) {
    if (Platform.isIOS) {
      final gestureRecognizers = widget.gestureRecognizers ??
          <Factory<OneSequenceGestureRecognizer>>{
            Factory<OneSequenceGestureRecognizer>(
                () => EagerGestureRecognizer()),
          };
      final messageCodec = FluttifyMessageCodec('platform');
      return UiKitView(
        viewType: 'me.yohom/foundation_fluttify/UIView',
        creationParamsCodec: messageCodec,
        gestureRecognizers: gestureRecognizers,
        onPlatformViewCreated: (viewId) async {
          final refId = await viewId2RefId((2147483647 - viewId).toString());
          _view = UIView()
            ..refId = refId
            ..tag__ = 'platform';
          if (widget.onUIViewCreated != null) {
            await widget.onUIViewCreated(_view);
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
