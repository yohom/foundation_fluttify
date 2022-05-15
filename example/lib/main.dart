import 'package:flutter/material.dart';
import 'package:foundation_fluttify/foundation_fluttify.dart';

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
