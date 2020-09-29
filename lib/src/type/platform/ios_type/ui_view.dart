// ignore_for_file: non_constant_identifier_names
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:foundation_fluttify/src/object/obejcts.dart';
import 'package:foundation_fluttify/src/type/platform/ios_type/cg_point.dart';

import 'cg_rect.dart';
import 'ns_object.dart';

class UIView extends NSObject {
  static Future<UIView> create() async {
    final result = await kMethodChannel.invokeMethod('UIView::create');
    return UIView()..refId = result;
  }

  @override
  final String tag__ = 'platform';

  /// 旋转
  ///
  /// 单位为度
  Future<void> rotate(double angle) async {
    assert(angle != null);
    await kMethodChannel.invokeMethod('UIView::rotate', {
      '__this__': this,
      'angle': angle,
    });
  }

  /// 执行缩放动画
  Future<void> scaleWithDuration({
    Duration duration = const Duration(seconds: 1),
    double fromValue = 0,
    @required double toValue,
    int repeatCount = 0,
    int repeatMode = 1,
  }) async {
    assert(fromValue >= 0);
    assert(toValue >= 0);
    await kMethodChannel.invokeMethod('UIView::scaleWithDuration', {
      '__this__': this,
      'duration': duration.inMilliseconds / 1000,
      'fromValue': fromValue,
      'toValue': toValue,
      'repeatCount': repeatCount,
      'repeatMode': repeatMode,
    });
  }

  /// 执行移动动画
  Future<void> translateWithDuration({
    Duration duration = const Duration(seconds: 1),
    @required CGPoint toValue,
    int repeatCount = 0,
    int repeatMode = 1,
  }) async {
    await kMethodChannel.invokeMethod('UIView::translateWithDuration', {
      '__this__': this,
      'duration': duration.inMilliseconds / 1000,
      'toX': await toValue.x,
      'toY': await toValue.y,
      'repeatCount': repeatCount,
      'repeatMode': repeatMode,
    });
  }

  /// 执行透明度动画
  ///
  /// 范围为0-1
  Future<void> alphaWithDuration({
    Duration duration = const Duration(seconds: 1),
    double fromValue = 0,
    @required double toValue,
    int repeatCount = 0,
    int repeatMode = 0,
  }) async {
    assert(fromValue >= 0 && fromValue <= 1);
    assert(toValue >= 0 && toValue <= 1);
    await kMethodChannel.invokeMethod('UIView::alphaWithDuration', {
      '__this__': this,
      'duration': duration.inMilliseconds / 1000,
      'fromValue': fromValue,
      'toValue': toValue,
      'repeatCount': repeatCount,
      'repeatMode': repeatMode,
    });
  }

  /// 执行旋转动画
  ///
  /// 单位为度, 逆时针旋转
  Future<void> rotateWithDuration({
    Duration duration = const Duration(seconds: 1),
    double fromValue = 0,
    @required double toValue,
    int repeatCount = 0,
    int repeatMode = 0,
  }) async {
    assert(duration != null);
    await kMethodChannel.invokeMethod('UIView::rotateWithDuration', {
      '__this__': this,
      'duration': duration.inMilliseconds / 1000,
      'fromValue': fromValue / 180 * pi,
      'toValue': -toValue / 180 * pi,
      'repeatCount': repeatCount,
      'repeatMode': repeatMode,
    });
  }

  /// 执行组合动画
  ///
  /// [keyPath]为构造CABasicAnimation时的[CABasicAnimation animationWithKeyPath:keyPath];
  /// 缩放为`transform.scale`, 透明度为`opacity`, 旋转为`transform.rotation`
  ///
  /// [fromValue], [toValue]和[keyPath]的长度必须相等
  Future<void> groupWithDuration({
    Duration duration = const Duration(seconds: 1),
    @required List<double> fromValue,
    @required List<double> toValue,
    @required List<String> keyPath,
    int repeatCount = 0,
    int repeatMode = 0,
  }) async {
    assert(duration != null);
    assert(fromValue.length == toValue.length);
    assert(toValue.length == keyPath.length);
    await kMethodChannel.invokeMethod('UIView::groupWithDuration', {
      '__this__': this,
      'duration': duration.inMilliseconds / 1000,
      'fromValue': [for (final item in fromValue) item / 180 * pi],
      'toValue': [for (final item in fromValue) -item / 180 * pi],
      'keyPath': keyPath,
      'repeatCount': repeatCount,
      'repeatMode': repeatMode,
    });
  }

  Future<CGRect> get frame async {
    final result = await kMethodChannel
        .invokeMethod('UIView::getFrame', {'__this__': this});
    return CGRect()..refId = result;
  }

  Future<bool> get hidden async {
    final result = await kMethodChannel
        .invokeMethod('UIView::getHidden', {'__this__': this});
    return result;
  }

  Future<void> setHidden(bool hidden) async {
    assert(hidden != null);
    await kMethodChannel.invokeMethod('UIView::setHidden', {
      '__this__': this,
      'hidden': hidden,
    });
  }

  Future<void> setAnchorPoint(double anchorU, double anchorV) async {
    assert(hidden != null);
    await kMethodChannel.invokeMethod('UIView::setAnchorPoint', {
      '__this__': this,
      'anchorU': anchorU,
      'anchorV': anchorV,
    });
  }
}
