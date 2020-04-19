import 'dart:io';

import 'package:flutter/material.dart';
import 'package:foundation_fluttify/src/type/platform/ios_type/ui_view.dart';

typedef Future<void> OnUIViewCreated(UIView controller);

class UIViewWidget extends StatelessWidget {
  const UIViewWidget({
    Key key,
    this.onUIViewCreated,
  }) : super(key: key);

  final OnUIViewCreated onUIViewCreated;

  @override
  Widget build(BuildContext context) {
    if (Platform.isIOS) {
      return UiKitView(
        viewType: 'me.yohom/foundation_fluttify/UIView',
        onPlatformViewCreated: (viewId) {
          if (onUIViewCreated != null) {
            onUIViewCreated(
              UIView()
                ..refId = viewId
                ..tag__ = 'platform',
            );
          }
        },
      );
    } else {
      return Center(child: Text('不支持的平台'));
    }
  }
}
