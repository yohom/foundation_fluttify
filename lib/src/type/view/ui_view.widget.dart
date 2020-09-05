import 'dart:io';

import 'package:flutter/material.dart';
import 'package:foundation_fluttify/src/type/platform/ios_type/ui_view.dart';

typedef Future<void> OnUIViewCreated(UIView controller);
typedef Future<void> _OnUiKitViewDispose();

class UIViewWidget extends StatefulWidget {
  const UIViewWidget({
    Key key,
    this.onUIViewCreated,
    this.onDispose,
  }) : super(key: key);

  final OnUIViewCreated onUIViewCreated;
  final _OnUiKitViewDispose onDispose;

  @override
  _UIViewWidgetState createState() => _UIViewWidgetState();
}

class _UIViewWidgetState extends State<UIViewWidget> {
  UIView _view;

  @override
  Widget build(BuildContext context) {
    if (Platform.isIOS) {
      return UiKitView(
        viewType: 'me.yohom/foundation_fluttify/UIView',
        onPlatformViewCreated: (viewId) {
          _view = UIView()
            ..refId = (2147483647 - viewId).toString()
            ..tag__ = 'platform';
          if (widget.onUIViewCreated != null) {
            widget.onUIViewCreated(_view);
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
