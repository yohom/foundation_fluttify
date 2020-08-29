import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:foundation_fluttify/src/object/obejcts.dart';

import 'cg_rect.dart';
import 'ns_object.dart';

class UIView extends NSObject {
  static Future<UIView> create() async {
    final result = await kMethodChannel.invokeMethod('UIView::create');
    return UIView()..refId = result;
  }

  /// 旋转
  ///
  /// 单位为度
  Future<void> rotate(double angle) async {
    assert(angle != null);
    await kMethodChannel.invokeMethod('UIView::rotate', {
      'refId': refId,
      'angle': angle,
    });
  }

  /// 执行缩放动画
  Future<void> scaleWithDuration({
    Duration duration = const Duration(seconds: 1),
    double fromValue = 0,
    @required double toValue,
    int repeatCount = 0,
  }) async {
    assert(fromValue >= 0 && fromValue <= 1);
    assert(toValue >= 0 && toValue <= 1);
    await kMethodChannel.invokeMethod('UIView::scaleWithDuration', {
      'refId': refId,
      'duration': duration.inMilliseconds / 1000,
      'fromValue': fromValue,
      'toValue': toValue,
      'repeatCount': repeatCount,
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
  }) async {
    assert(fromValue >= 0 && fromValue <= 1);
    assert(toValue >= 0 && toValue <= 1);
    await kMethodChannel.invokeMethod('UIView::alphaWithDuration', {
      'refId': refId,
      'duration': duration.inMilliseconds / 1000,
      'fromValue': fromValue,
      'toValue': toValue,
      'repeatCount': repeatCount,
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
  }) async {
    assert(duration != null);
    await kMethodChannel.invokeMethod('UIView::rotateWithDuration', {
      'refId': refId,
      'duration': duration.inMilliseconds / 1000,
      'fromValue': fromValue / 180 * pi,
      'toValue': -toValue / 180 * pi,
      'repeatCount': repeatCount,
    });
  }

  Future<CGRect> get frame async {
    final result =
        await kMethodChannel.invokeMethod('UIView::getFrame', {'refId': refId});
    return CGRect()..refId = result;
  }

  Future<bool> get hidden async {
    final result = await kMethodChannel
        .invokeMethod('UIView::getHidden', {'refId': refId});
    return result;
  }

  Future<void> setHidden(bool hidden) async {
    assert(hidden != null);
    await kMethodChannel.invokeMethod('UIView::setHidden', {
      'refId': refId,
      'hidden': hidden,
    });
  }

  Future<void> setAnchorPoint(double anchorU, double anchorV) async {
    assert(hidden != null);
    await kMethodChannel.invokeMethod('UIView::setAnchorPoint', {
      'refId': refId,
      'anchorU': anchorU,
      'anchorV': anchorV,
    });
  }
}
