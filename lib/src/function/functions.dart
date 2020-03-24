import 'dart:io';

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
      kNativeObjectPool.removeAll(releasePool);
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
      kNativeObjectPool.removeAll(releasePool);
    }
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
