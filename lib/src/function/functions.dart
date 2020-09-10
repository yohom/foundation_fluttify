import 'dart:async';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

import '../../foundation_fluttify.dart';

typedef Future<T> _FutureCallback<T>(Set<Ref> releasePool);
typedef T _StreamCallback<T>(Set<Ref> releasePool);

bool _enableFluttifyLog = true;
Future<void> enableFluttifyLog(bool enable) {
  _enableFluttifyLog = enable;
  return kMethodChannel.invokeMethod('PlatformService::enableLog', {
    'enable': enable,
  });
}

bool get fluttifyLogEnabled => _enableFluttifyLog;

Future<T> platform<T>({
  _FutureCallback<T> android,
  _FutureCallback<T> ios,
}) async {
  // 方法单位的释放池, 如果需要的时候可以在这里直接释放, 不使用这个释放池的话可以使用[ScopedReleasePool]
  final releasePool = <Ref>{};
  try {
    if (android != null && Platform.isAndroid) {
      return await android(releasePool);
    } else if (ios != null && Platform.isIOS) {
      return await ios(releasePool);
    } else {
      return Future.value();
    }
  } catch (e) {
    return Future.error(e);
  } finally {
    if (releasePool.isNotEmpty) {
      await releasePool.release_batch();
      releasePool.clear();
      // remove all local object from global object pool
      gGlobalReleasePool.removeAll(releasePool);
    }
  }
}

Stream<T> platformStream<T>({
  _StreamCallback<T> android,
  _StreamCallback<T> ios,
}) async* {
  final releasePool = <Ref>{};
  try {
    if (android != null && Platform.isAndroid) {
      yield android(releasePool);
    } else if (ios != null && Platform.isIOS) {
      yield ios(releasePool);
    } else {
      yield null;
    }
  } catch (e) {
    yield e;
  } finally {
    if (releasePool.isNotEmpty) {
      await releasePool.release_batch();
      releasePool.clear();
      // remove all local object from global object pool
      gGlobalReleasePool.removeAll(releasePool);
    }
  }
}

Future<void> clearHeap() async {
  await kMethodChannel.invokeMethod('PlatformService::clearHeap');
}

Future<void> pushStack(String name, Ref ref) async {
  await kMethodChannel.invokeMethod(
    'PlatformService::pushStack',
    {'name': name, '__this__': ref},
  );
}

Future<void> pushStackJsonable(String name, dynamic jsonable) async {
  await kMethodChannel.invokeMethod('PlatformService::pushStackJsonable', {
    'name': name,
    'data': jsonable,
  });
}

Future<void> clearStack() async {
  await kMethodChannel.invokeMethod('PlatformService::clearStack');
}

Future<void> setupOrientationSensor() async {
  await kMethodChannel.invokeMethod('PlatformService::setupOrientationSensor');
}

Future<void> startActivity(
  String activityClass, {
  Map<String, dynamic> extras = const {},
}) async {
  assert(activityClass != null && activityClass.isNotEmpty);
  await kMethodChannel.invokeMethod(
    'PlatformService::startActivity',
    {'activityClass': activityClass, 'extras': extras},
  );
}

Future<android_content_Intent> startActivityForResult(
  String activityClass, {
  @required int requestCode,
  Map<String, dynamic> extras = const {},
}) async {
  assert(
    activityClass != null && activityClass.isNotEmpty && requestCode != null,
  );
  final result = await kMethodChannel.invokeMethod(
    'PlatformService::startActivityForResult',
    {
      'activityClass': activityClass,
      'extras': extras,
      'requestCode': requestCode,
    },
  );
  return android_content_Intent()
    ..refId = result
    ..tag__ = 'platform';
}

Future<void> presentViewController(
  String viewControllerClass, {
  bool withNavigationController = false,
}) async {
  assert(viewControllerClass != null && viewControllerClass.isNotEmpty);
  await kMethodChannel.invokeMethod(
    'PlatformService::presentViewController',
    {
      'viewControllerClass': viewControllerClass,
      'withNavigationController': withNavigationController,
    },
  );
}

/// viewId转换为refId
///
/// 使用这个方法前, 保存PlatformView是把viewId作为key保存在Map中, 带来了不一致性.
/// 使用这个方法把viewId转换为对应PlatformView对象的refId, 使其与普通对象的行为保持一致.
Future<String> viewId2RefId(String viewId) async {
  return kMethodChannel.invokeMethod(
    'PlatformService::viewId2RefId',
    {'viewId': viewId},
  );
}

/// 不怎么好用
@deprecated
Future<String> getAssetPath(String flutterAssetPath) async {
  return kMethodChannel.invokeMethod(
    'PlatformService::getAssetPath',
    {'flutterAssetPath': flutterAssetPath},
  );
}

void log(String content) {
  if (fluttifyLogEnabled) debugPrint(content);
}
