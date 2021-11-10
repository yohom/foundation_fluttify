import 'package:flutter/material.dart';
import 'package:foundation_fluttify/foundation_fluttify.dart';
import 'package:foundation_fluttify/src/type/core/ref.dart';

class ScopedReleasePool extends StatefulWidget {
  const ScopedReleasePool({
    Key? key,
    required this.child,
    required this.tag,
  }) : super(key: key);

  final Widget child;

  /// 标记一类对象
  ///
  /// 如果设置了, 则释放时根据这个tag进行释放, 防止误伤
  final String tag;

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
    log('ScopedReleasePool释放对象: $_releasePool');
    gReleasePoolStack.pop();
    _releasePool
        // 过滤出tag为目标tag的对象进行释放 或 tag为null表示不过滤
        .where((e) => e.tag__ == widget.tag)
        .release_batch()
        .then((value) => _releasePool.clear());
    super.dispose();
  }

  void add(Ref ref) {
    _releasePool.add(ref);
  }
}
