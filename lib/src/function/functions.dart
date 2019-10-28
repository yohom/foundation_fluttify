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

import 'package:flutter/services.dart';

import '../../foundation_fluttify.dart';

typedef Future<T> _FutureCallback<T>(List<Ref> releasePool);

Future<void> performSelectorWithObject(
    Ref ref, String selector, Object object) {
  return MethodChannel('com.fluttify/foundation')
      .invokeMethod('Ref::performSelectorWithObject', {
    'refId': ref.refId,
    'selector': selector,
    'object': object,
  });
}

Future<T> platform<T>(
    {_FutureCallback<T> android, _FutureCallback<T> ios}) async {
  if (android != null && Platform.isAndroid) {
    final releasePool = <Ref>[];
    final result = await android(releasePool);
    releasePool
      ..forEach((it) => PlatformFactory_Android.release(it))
      ..clear();
    return result;
  } else if (ios != null && Platform.isIOS) {
    final releasePool = <Ref>[];
    final result = await ios(releasePool);
    releasePool
      ..forEach((it) => PlatformFactory_iOS.release(it))
      ..clear();
    return result;
  } else {
    return Future.value();
  }
}

Future release(Ref ref) {
  return platform(
    android: (pool) => PlatformFactory_Android.release(ref),
    ios: (pool) => PlatformFactory_iOS.release(ref),
  );
}
