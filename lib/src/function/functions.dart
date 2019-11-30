import 'dart:io';

import 'package:foundation_fluttify/src/constants.dart';

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
    final result = await android(releasePool);
    releasePool
      ..forEach(release)
      ..clear();
    // remove all local object from global object pool
    kNativeObjectPool.removeAll(releasePool);
    return result;
  } else if (ios != null && Platform.isIOS) {
    final releasePool = <Ref>{};
    final result = await ios(releasePool);
    releasePool
      ..forEach(release)
      ..clear();
    // remove all local object from global object pool
    kNativeObjectPool.removeAll(releasePool);
    return result;
  } else {
    return Future.value();
  }
}

Future<void> performSelectorWithObject(
  Ref ref,
  String selector,
  Object object,
) {
  return kMethodChannel
      .invokeMethod('PlatformService::performSelectorWithObject', {
    'refId': ref.refId,
    'selector': selector,
    'object': object,
  });
}

Future<void> release(Ref ref) async {
  await kMethodChannel
      .invokeMethod('PlatformFactory::release', {'refId': ref.refId});
}

Future<void> clearHeap() async {
  await kMethodChannel.invokeMethod('PlatformFactory::clearHeap');
}

Future<void> pushStack(String name, Ref ref) async {
  await kMethodChannel.invokeMethod(
      'PlatformFactory::pushStack', {'name': name, 'refId': ref.refId});
}

Future<void> pushStackJsonable(String name, dynamic jsonable) async {
  await kMethodChannel.invokeMethod(
      'PlatformFactory::pushStackJsonable', {'name': name, 'data': jsonable});
}

Future<void> clearStack() async {
  await kMethodChannel.invokeMethod('PlatformFactory::clearStack');
}
