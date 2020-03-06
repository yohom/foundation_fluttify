import 'dart:io';

import '../../foundation_fluttify.dart';

typedef Future<T> _FutureCallback<T>(Set<Ref> releasePool);

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
  if (android != null && Platform.isAndroid) {
    final releasePool = <Ref>{};
    T result;
    try {
      result = await android(releasePool);
    } catch (e) {
      return Future.error(e);
    } finally {
      await releasePool.release_batch();
      releasePool.clear();
      // remove all local object from global object pool
      kNativeObjectPool.removeAll(releasePool);
    }
    return result;
  } else if (ios != null && Platform.isIOS) {
    final releasePool = <Ref>{};
    T result;
    try {
      result = await ios(releasePool);
    } catch (e) {
      return Future.error(e);
    } finally {
      await releasePool.release_batch();
      releasePool.clear();
      // remove all local object from global object pool
      kNativeObjectPool.removeAll(releasePool);
    }
    return result;
  } else {
    return Future.value();
  }
}

Future<void> clearHeap() async {
  await kMethodChannel.invokeMethod('PlatformService::clearHeap');
}

Future<void> pushStack(String name, Ref ref) async {
  await kMethodChannel.invokeMethod('PlatformService::pushStack', {
    'name': name,
    'refId': ref.refId,
  });
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
