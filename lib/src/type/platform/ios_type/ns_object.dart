// ignore_for_file: non_constant_identifier_names
import 'package:foundation_fluttify/foundation_fluttify.dart';

class NSObject extends Ref {
  /// 初始化方法
  ///
  /// 暂时没有用处, create__方法会有相关处理
  Future<T> init__<T extends NSObject>() async {
    await kMethodChannel.invokeMethod('NSObject::init', {'__this__': this});
    return this;
  }
}

extension NSObjectListX on List<NSObject> {
  Future<List<T>> init_batch<T extends NSObject>() async {
    await kMethodChannel.invokeMethod('NSObject::init_batch', [
      for (final item in this) {'__this__': item}
    ]);
    return this;
  }
}
