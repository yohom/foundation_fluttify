import 'package:decorated_flutter/decorated_flutter.dart';
import 'package:flutter/material.dart';
import 'package:foundation_fluttify/foundation_fluttify.dart';
import 'package:foundation_fluttify_example/src/demo/type/core/core.screen.dart';
import 'package:foundation_fluttify_example/src/demo/type/platform/platform.screen.dart';
import 'package:foundation_fluttify_example/src/widget/function_group.widget.dart';
import 'package:foundation_fluttify_example/src/widget/function_item.widget.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Plugin example app')),
        body: DecoratedColumn(
          itemSpacing: kSpace16,
          children: <Widget>[
            FunctionGroup(
              headLabel: 'Type Demo',
              children: <Widget>[
                FunctionItem(
                  label: 'Core Type Demo',
                  sublabel: 'CoreScreen',
                  target: CoreScreen(),
                ),
                FunctionItem(
                  label: 'Platform Type Demo',
                  sublabel: 'PlatformScreen',
                  target: PlatformScreen(),
                ),
              ],
            ),
            FunctionGroup(
              headLabel: 'Object Demo',
              children: <Widget>[],
            ),
            FunctionGroup(
              headLabel: 'Function Demo',
              children: <Widget>[],
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _testAddProperty() async {
    final target = await CGPoint.create(225, 556);
    final target1 = await CGPoint.create(112, 556);
    await target.addProperty__(1, target1);

    final result = await target.getProperty__(1);
    final target1Result = CGPoint()..refId = result.refId;
    debugPrint('结果: ${await target1Result.x}');
  }
}
