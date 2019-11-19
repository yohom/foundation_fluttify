//typedef Future<T> AndroidFutureCallback<T>(List<Ref_Android> releasePool);
//typedef Future<T> IOSFutureCallback<T>(List<Ref_iOS> releasePool);
//
//Future<T> platform<T>({
//  AndroidFutureCallback<T> android,
//  IOSFutureCallback<T> ios,
//}) async {
//  if (android != null && Platform.isAndroid) {
//    final releasePool = <Ref>[];
//    final result = await android(releasePool);
//    releasePool..forEach((it) => ObjectFactory_Android.release(it))..clear();
//    return result;
//  } else if (ios != null && Platform.isIOS) {
//    final releasePool = <Ref_iOS>[];
//    final result = await ios(releasePool);
//    releasePool..forEach((it) => ObjectFactory_iOS.release(it))..clear();
//    return result;
//  } else {
//    return Future.value();
//  }
//}
//
//Future release(Ref ref) {
//  return platform(
//    android: (pool) => ObjectFactory_Android.release(ref),
//    ios: (pool) => ObjectFactory_iOS.release(ref),
//  );
//}

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

Future<void> performSelectorWithObject(
    Ref ref, String selector, Object object) {
  return kMethodChannel.invokeMethod('Ref::performSelectorWithObject', {
    'refId': ref.refId,
    'selector': selector,
    'object': object,
  });
}

Future<T> platform<T>(
    {_FutureCallback<T> android, _FutureCallback<T> ios}) async {
  if (android != null && Platform.isAndroid) {
    final releasePool = <Ref>{};
    final result = await android(releasePool);
    releasePool
      ..forEach((it) => PlatformFactoryAndroid.release(it))
      ..clear();
    // remove all local object from global object pool
    kNativeObjectPool.removeAll(releasePool);
    return result;
  } else if (ios != null && Platform.isIOS) {
    final releasePool = <Ref>{};
    final result = await ios(releasePool);
    releasePool
      ..forEach((it) => PlatformFactoryIOS.release(it))
      ..clear();
    // remove all local object from global object pool
    kNativeObjectPool.removeAll(releasePool);
    return result;
  } else {
    return Future.value();
  }
}

Future release(Ref ref) {
  return platform(
    android: (pool) => PlatformFactoryAndroid.release(ref),
    ios: (pool) => PlatformFactoryIOS.release(ref),
  );
}
