// ignore_for_file: non_constant_identifier_names



import 'package:foundation_fluttify/foundation_fluttify.dart';
import 'package:foundation_fluttify/src/object/obejcts.dart';

class NSDate extends NSObject {
  @override
  final String tag__ = 'platform';

  /// 时间戳 单位秒
  Future<double?> get timeIntervalSince1970 {
    return kMethodChannel.invokeMethod<double>(
      'NSDate::get_timeIntervalSince1970',
      {'__this__': this},
    );
  }
}
