import 'dart:async';
import 'dart:io';
import 'dart:typed_data';
import 'dart:ui';

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

Map<String, Uint8List> _cache = {};

Future<Uint8List> uri2ImageData(
  ImageConfiguration config,
  Uri iconUri, {
  String package,
}) async {
  final imageData = Completer<Uint8List>();
  if (_cache.containsKey(iconUri.toString())) {
    debugPrint('命中缓存');
    imageData.complete(_cache[iconUri.toString()]);
  } else {
    switch (iconUri.scheme) {
      // 网络图片
      case 'https':
      case 'http':
        HttpClient httpClient = HttpClient();
        var request = await httpClient.getUrl(iconUri);
        var response = await request.close();
        final result = await consolidateHttpClientResponseBytes(response);

        _cache[iconUri.toString()] = result;
        imageData.complete(result);
        break;
      // 文件图片
      case 'file':
        final imageFile = File.fromUri(iconUri);
        final result = imageFile.readAsBytesSync();

        _cache[iconUri.toString()] = result;
        imageData.complete(result);
        break;
      // asset图片
      default:
        (package == null
                ? AssetImage(iconUri.path)
                : AssetImage(iconUri.path, package: package))
            .resolve(config)
            .addListener(ImageStreamListener((imageInfo, sync) async {
          final byteData =
              await imageInfo.image.toByteData(format: ImageByteFormat.png);
          final result = byteData.buffer.asUint8List();

          _cache[iconUri.toString()] = result;
          imageData.complete(result);
        }));
        break;
    }
  }
  return imageData.future;
}
