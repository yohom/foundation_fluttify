import 'package:flutter/material.dart';
import 'package:foundation_fluttify/foundation_fluttify.dart';
import 'package:foundation_fluttify/src/type/core/ref.dart';

class ScopedReleasePool extends StatefulWidget {
  const ScopedReleasePool({
    Key key,
    @required this.child,
  }) : super(key: key);

  final Widget child;

  @override
  ScopedReleasePoolState createState() => ScopedReleasePoolState();
}

class ScopedReleasePoolState extends State<ScopedReleasePool> {
  final Set<Ref> _releasePool = <Ref>{};

  @override
  void initState() {
    super.initState();
    gReleasePoolStack.push(this);
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }

  @override
  void dispose() {
    if (fluttifyLogEnabled) debugPrint('ScopedReleasePool释放对象: $_releasePool');
    gReleasePoolStack.pop();
    _releasePool.release_batch();
    super.dispose();
  }

  void add(Ref ref) {
    _releasePool.add(ref);
  }
}
