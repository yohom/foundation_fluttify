import 'package:flutter/material.dart';

class CoreScreen extends StatefulWidget {
  @override
  _CoreScreenState createState() => _CoreScreenState();
}

class _CoreScreenState extends State<CoreScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Core')),
      body: Center(child: Text('Core')),
    );
  }
}
