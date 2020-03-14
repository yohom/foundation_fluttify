import 'package:flutter/material.dart';

class UIViewRotateScreen extends StatefulWidget {
  @override
  _UIViewRotateScreenState createState() => _UIViewRotateScreenState();
}

class _UIViewRotateScreenState extends State<UIViewRotateScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('UIViewRotate')),
      body: Center(child: Text('UIViewRotate')),
    );
  }
}
