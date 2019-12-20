import '../../constants.dart';

class Ref {
  /// unique id of native side counterpart object
  int refId;

  /// custom tag
  String tag;

  /// 释放当前引用对象
  Future<void> release() async {
    await kMethodChannel
        .invokeMethod('PlatformFactory::release', {'refId': refId});
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Ref && runtimeType == other.runtimeType && refId == other.refId;

  @override
  int get hashCode => refId.hashCode;

  @override
  String toString() {
    return '$runtimeType{refId: $refId}';
  }
}
