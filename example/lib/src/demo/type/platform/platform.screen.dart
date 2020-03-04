import 'package:decorated_flutter/decorated_flutter.dart';
import 'package:flutter/material.dart';
import 'package:foundation_fluttify_example/src/demo/type/platform/ios_type/ui_view/rotate.screen.dart';
import 'package:foundation_fluttify_example/src/widget/function_group.widget.dart';
import 'package:foundation_fluttify_example/src/widget/function_item.widget.dart';

class PlatformScreen extends StatefulWidget {
  @override
  _PlatformScreenState createState() => _PlatformScreenState();
}

class _PlatformScreenState extends State<PlatformScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Platform Type Demo')),
      body: DecoratedColumn(
        itemSpacing: kSpaceBig,
        children: <Widget>[
          FunctionGroup(
            headLabel: 'Android Type Demo',
            children: <Widget>[],
          ),
          FunctionGroup(
            headLabel: 'iOS Type Demo',
            children: <Widget>[
              FunctionItem(
                label: 'UIView Rotate Demo',
                sublabel: 'UIViewRotateScreen',
                target: UIViewRotateScreen(),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
