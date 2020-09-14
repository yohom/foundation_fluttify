// ignore_for_file: non_constant_identifier_names
import 'package:foundation_fluttify/foundation_fluttify.dart';

class NSObject extends Ref {
  Future<T> init<T extends NSObject>() async {
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
