import 'package:foundation_fluttify/src/object/obejcts.dart';

class Ref {
  /// unique id of native side counterpart object
  int refId;

  /// custom tag
  String tag;

  /// 释放当前引用对象
  Future<void> release() async {
    await kMethodChannel
        .invokeMethod('PlatformService::release', {'refId': refId});
  }

  /// 通过反射调用方法
  Future<void> performSelectorWithObject(String selector, Object object) {
    return kMethodChannel
        .invokeMethod('PlatformService::performSelectorWithObject', {
      'refId': refId,
      'selector': selector,
      'object': object,
    });
  }

  /// 为类型添加属性
  Future<void> addProperty(int propertyKey, Ref property) async {
    assert(property is Ref);
    return kMethodChannel.invokeMethod('PlatformService::addProperty', {
      'refId': refId,
      'propertyKey': propertyKey,
      'property': property.refId,
    });
  }

  /// 获取添加字段的值
  Future<Ref> getProperty(int propertyKey) async {
    final result =
        await kMethodChannel.invokeMethod('PlatformService::getProperty', {
      'refId': refId,
      'propertyKey': propertyKey,
    });
    return Ref()..refId = result;
  }

  /// 为类型添加jsonable属性
  Future<void> addJsonableProperty(int propertyKey, Object property) async {
    assert(property is String ||
        property is int ||
        property is double ||
        property is Map ||
        property is List ||
        property is bool);
    return kMethodChannel.invokeMethod('PlatformService::addJsonableProperty', {
      'refId': refId,
      'propertyKey': propertyKey,
      'property': property,
    });
  }

  /// 获取添加字段的jsonable值
  Future<Object> getJsonableProperty(int propertyKey) async {
    return kMethodChannel.invokeMethod('PlatformService::getJsonableProperty', {
      'refId': refId,
      'propertyKey': propertyKey,
    });
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

extension Ref_batch on Iterable<Ref> {
  // ignore: non_constant_identifier_names
  Future<void> release_batch() async {
    return kMethodChannel.invokeMethod(
      'PlatformService::release_batch',
      {'refId_batch': map((e) => e.refId).toList()},
    );
  }
}
