import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:foundation_fluttify/foundation_fluttify.dart';

class FluttifyMessageCodec extends StandardMessageCodec {
  const FluttifyMessageCodec();

  static const int _valueNull = 0;
  static const int _valueTrue = 1;
  static const int _valueFalse = 2;
  static const int _valueInt32 = 3;
  static const int _valueInt64 = 4;
  static const int _valueLargeInt = 5;
  static const int _valueFloat64 = 6;
  static const int _valueString = 7;
  static const int _valueUint8List = 8;
  static const int _valueInt32List = 9;
  static const int _valueInt64List = 10;
  static const int _valueFloat64List = 11;
  static const int _valueList = 12;
  static const int _valueMap = 13;
  // Fluttify使用
  static const int _valueEnum = 126;
  // 虽然dart端说明自定义类型要用128以上的值, 但是Java那边是用byte接收, 128已经超出, 所以
  // 这里直接使用127了, 肯定不会与flutter本身的类型冲突
  static const int _valueRef = 127;

  void writeValue(WriteBuffer buffer, dynamic value) {
    if (value == null) {
      buffer.putUint8(_valueNull);
    } else if (value is bool) {
      buffer.putUint8(value ? _valueTrue : _valueFalse);
    } else if (value is double) {
      // Double precedes int because in JS everything is a double.
      // Therefore in JS, both `is int` and `is double` always
      // return `true`. If we check int first, we'll end up treating
      // all numbers as ints and attempt the int32/int64 conversion,
      // which is wrong. This precedence rule is irrelevant when
      // decoding because we use tags to detect the type of value.
      buffer.putUint8(_valueFloat64);
      buffer.putFloat64(value);
    } else if (value is int) {
      if (-0x7fffffff - 1 <= value && value <= 0x7fffffff) {
        buffer.putUint8(_valueInt32);
        buffer.putInt32(value);
      } else {
        buffer.putUint8(_valueInt64);
        buffer.putInt64(value);
      }
    } else if (value is String) {
      buffer.putUint8(_valueString);
      final Uint8List bytes = utf8.encoder.convert(value);
      writeSize(buffer, bytes.length);
      buffer.putUint8List(bytes);
    } else if (value is Uint8List) {
      buffer.putUint8(_valueUint8List);
      writeSize(buffer, value.length);
      buffer.putUint8List(value);
    } else if (value is Int32List) {
      buffer.putUint8(_valueInt32List);
      writeSize(buffer, value.length);
      buffer.putInt32List(value);
    } else if (value is Int64List) {
      buffer.putUint8(_valueInt64List);
      writeSize(buffer, value.length);
      buffer.putInt64List(value);
    } else if (value is Float64List) {
      buffer.putUint8(_valueFloat64List);
      writeSize(buffer, value.length);
      buffer.putFloat64List(value);
    } else if (value is List) {
      buffer.putUint8(_valueList);
      writeSize(buffer, value.length);
      for (final dynamic item in value) {
        writeValue(buffer, item);
      }
    } else if (value is Set) {
      buffer.putUint8(_valueList);
      writeSize(buffer, value.length);
      for (final dynamic item in value) {
        writeValue(buffer, item);
      }
    } else if (value is Map) {
      buffer.putUint8(_valueMap);
      writeSize(buffer, value.length);
      value.forEach((dynamic key, dynamic value) {
        writeValue(buffer, key);
        writeValue(buffer, value);
      });
    }
    // 以下为fluttify增加的类型
    // 枚举 传递索引值
    else if (_isEnum(value)) {
      buffer.putUint8(_valueEnum);
      buffer.putInt32(value.index);
    }
    // fluttify Ref类
    else if (value is Ref) {
      buffer.putUint8(_valueRef);
      final Uint8List bytes = utf8.encoder.convert(value.refId);
      writeSize(buffer, bytes.length);
      buffer.putUint8List(bytes);
    } else {
      throw ArgumentError.value(value);
    }
  }

  dynamic readValueOfType(int type, ReadBuffer buffer) {
    switch (type) {
      case _valueNull:
        return null;
      case _valueTrue:
        return true;
      case _valueFalse:
        return false;
      case _valueInt32:
        return buffer.getInt32();
      case _valueInt64:
        return buffer.getInt64();
      case _valueFloat64:
        return buffer.getFloat64();
      case _valueLargeInt:
      case _valueString:
        final int length = readSize(buffer);
        return utf8.decoder.convert(buffer.getUint8List(length));
      case _valueUint8List:
        final int length = readSize(buffer);
        return buffer.getUint8List(length);
      case _valueInt32List:
        final int length = readSize(buffer);
        return buffer.getInt32List(length);
      case _valueInt64List:
        final int length = readSize(buffer);
        return buffer.getInt64List(length);
      case _valueFloat64List:
        final int length = readSize(buffer);
        return buffer.getFloat64List(length);
      case _valueList:
        final int length = readSize(buffer);
        final dynamic result = List<dynamic>(length);
        for (int i = 0; i < length; i++) result[i] = readValue(buffer);
        return result;
      case _valueMap:
        final int length = readSize(buffer);
        final dynamic result = <dynamic, dynamic>{};
        for (int i = 0; i < length; i++)
          result[readValue(buffer)] = readValue(buffer);
        return result;
      case _valueEnum:
        return buffer.getInt32();
      case _valueRef:
        final int length = readSize(buffer);
        final String refId = utf8.decoder.convert(buffer.getUint8List(length));

        final result = Ref()..refId = refId;
        kNativeObjectPool.add(result);
        // 暂时和原方案保持一致, 直接返回refId给上层处理, 要直接转换为可目标类型比较困难
        // 改动也比较大, 后面再考虑了
        return refId;
      default:
        throw const FormatException('Message corrupted');
    }
  }
}

bool _isEnum(dynamic data) {
  final split = data.toString().split('.');
  return split.length > 1 && split[0] == data.runtimeType.toString();
}
