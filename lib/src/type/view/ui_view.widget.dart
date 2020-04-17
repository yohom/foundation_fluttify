import 'dart:io';

import 'package:flutter/material.dart';

class UIViewWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    if (Platform.isIOS) {
      return UiKitView(viewType: 'me.yohom/foundation_fluttify/UIView');
    } else {
      return Center(child: Text('不支持的平台'));
    }
  }
}
