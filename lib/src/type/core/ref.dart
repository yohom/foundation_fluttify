// ignore_for_file: non_constant_identifier_names
import 'package:foundation_fluttify/src/object/obejcts.dart';

class Ref {
  /// unique id of native side counterpart object
  int refId;

  /// custom tag
  String tag__;

  /// 释放当前引用对象
  Future<void> release__() async {
    await kMethodChannel
        .invokeMethod('PlatformService::release', {'__this__': this});
  }

  /// 通过反射调用方法
  Future<void> performSelectorWithObject__(String selector, Object object) {
    return kMethodChannel
        .invokeMethod('PlatformService::performSelectorWithObject', {
      '__this__': this,
      'selector': selector,
      'object': object,
    });
  }

  /// 为类型添加属性
  Future<void> addProperty__(int propertyKey, Ref property) async {
    assert(property is Ref);
    assert(propertyKey > 0);
    return kMethodChannel.invokeMethod('PlatformService::addProperty', {
      '__this__': this,
      'propertyKey': propertyKey,
      'property': property.refId,
    });
  }

  /// 为类型添加属性
  Future<void> addListProperty__(int propertyKey, List<Ref> property) async {
    assert(propertyKey > 0);
    return kMethodChannel.invokeMethod('PlatformService::addListProperty', {
      '__this__': this,
      'propertyKey': propertyKey,
      'property': <int>[for (final item in property) item.refId],
    });
  }

  /// 获取添加字段的值
  Future<Ref> getProperty__(int propertyKey) async {
    assert(propertyKey > 0);
    final result =
        await kMethodChannel.invokeMethod('PlatformService::getProperty', {
      '__this__': this,
      'propertyKey': propertyKey,
    });
    return Ref()..refId = result;
  }

  /// 为类型添加jsonable属性
  Future<void> addJsonableProperty__(int propertyKey, Object property) async {
    assert(propertyKey > 0);
    assert(property is String ||
        property is int ||
        property is double ||
        property is Map ||
        property is List ||
        property is bool);
    return kMethodChannel.invokeMethod('PlatformService::addJsonableProperty', {
      '__this__': this,
      'propertyKey': propertyKey,
      'property': property,
    });
  }

  /// 获取添加字段的jsonable值
  Future<dynamic> getJsonableProperty__(int propertyKey) async {
    assert(propertyKey > 0);
    return kMethodChannel.invokeMethod('PlatformService::getJsonableProperty', {
      '__this__': this,
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

extension Ref_Batch on Iterable<Ref> {
  Future<void> release_batch() async {
    return kMethodChannel.invokeMethod(
      'PlatformService::release_batch',
      {'refId_batch': map((e) => e.refId).toList()},
    );
  }
}

extension RefList_Batch on List<Ref> {
  /// 为类型添加属性
  Future<void> addProperty_batch(int propertyKey, List<Ref> property) async {
    assert(property is List<Ref>);
    return kMethodChannel.invokeMethod(
      'PlatformService::addProperty_batch',
      [
        for (int i = 0; i < this.length; i++)
          <String, dynamic>{
            'refId': this[i].refId,
            'propertyKey': propertyKey,
            'property': property[i].refId,
          }
      ],
    );
  }

  /// 获取添加字段的值
  Future<List<Ref>> getProperty_batch(int propertyKey) async {
    final List resultBatch = await kMethodChannel.invokeMethod(
      'PlatformService::getProperty_batch',
      [
        for (int i = 0; i < this.length; i++)
          <String, dynamic>{
            'refId': this[i].refId,
            'propertyKey': propertyKey,
          }
      ],
    );
    return resultBatch
        .map((refId) => Ref()
          ..refId = refId
          ..tag__ = 'platform')
        .toList();
  }

  /// 为类型添加jsonable属性
  Future<void> addJsonableProperty_batch(
    int propertyKey,
    List<Object> property,
  ) async {
    assert(property is List<String> ||
        property is List<int> ||
        property is List<double> ||
        property is List<Map> ||
        property is List<List> ||
        property is List<bool>);
    return kMethodChannel.invokeMethod(
      'PlatformService::addJsonableProperty_batch',
      [
        for (int i = 0; i < this.length; i++)
          <String, dynamic>{
            'refId': this[i].refId,
            'propertyKey': propertyKey,
            'property': property[i],
          }
      ],
    );
  }

  /// 获取添加字段的jsonable值
  Future<List<dynamic>> getJsonableProperty_batch(int propertyKey) async {
    final List resultBatch = await kMethodChannel.invokeMethod(
      'PlatformService::getJsonableProperty_batch',
      [
        for (int i = 0; i < this.length; i++)
          <String, dynamic>{
            'refId': this[i].refId,
            'propertyKey': propertyKey,
          }
      ],
    );
    return resultBatch;
  }
}
