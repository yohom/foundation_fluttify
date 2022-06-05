import 'dart:async';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

import '../../foundation_fluttify.dart';

typedef _FutureCallback<T> = Future<T> Function(Set<Ref?> releasePool);

bool _enableFluttifyLog = true;
Future<void> enableFluttifyLog(bool enable) {
  _enableFluttifyLog = enable;
  return kMethodChannel.invokeMethod('PlatformService::enableLog', {
    'enable': enable,
  });
}

bool get fluttifyLogEnabled => _enableFluttifyLog;

Future<T> platform<T>({
  _FutureCallback<T>? android,
  _FutureCallback<T>? ios,
}) async {
  // 方法单位的释放池, 如果需要的时候可以在这里直接释放, 不使用这个释放池的话可以使用[ScopedReleasePool]
  final releasePool = <Ref?>{};
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
      await releasePool.whereType<Ref>().release_batch();
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
  assert(activityClass.isNotEmpty);
  await kMethodChannel.invokeMethod(
    'PlatformService::startActivity',
    {'activityClass': activityClass, 'extras': extras},
  );
}

Future<android_content_Intent> startActivityForResult(
  String activityClass, {
  required int requestCode,
  Map<String, dynamic> extras = const {},
}) async {
  assert(activityClass.isNotEmpty);
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
  assert(viewControllerClass.isNotEmpty);
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
Future<String?> viewId2RefId(String viewId) async {
  return kMethodChannel.invokeMethod(
    'PlatformService::viewId2RefId',
    {'viewId': viewId},
  );
}

/// 不怎么好用
@deprecated
Future<String?> getAssetPath(String flutterAssetPath) async {
  return kMethodChannel.invokeMethod(
    'PlatformService::getAssetPath',
    {'flutterAssetPath': flutterAssetPath},
  );
}

void log(String content) {
  if (fluttifyLogEnabled) debugPrint(content);
}

T? foundationFluttifyAs<T>(dynamic __this__) {
  if (T == android_content_Context) {
    return (android_content_Context()..refId = (__this__ as Ref).refId) as T;
  } else if (T == android_content_Intent) {
    return (android_content_Intent()..refId = (__this__ as Ref).refId) as T;
  } else if (T == android_content_ContentProvider) {
    return (android_content_ContentProvider()..refId = (__this__ as Ref).refId)
        as T;
  } else if (T == android_app_Application) {
    return (android_app_Application()..refId = (__this__ as Ref).refId) as T;
  } else if (T == android_app_Notification) {
    return (android_app_Notification()..refId = (__this__ as Ref).refId) as T;
  } else if (T == android_app_Activity) {
    return (android_app_Activity()..refId = (__this__ as Ref).refId) as T;
  } else if (T == android_app_PendingIntent) {
    return (android_app_PendingIntent()..refId = (__this__ as Ref).refId) as T;
  } else if (T == android_os_Bundle) {
    return (android_os_Bundle()..refId = (__this__ as Ref).refId) as T;
  } else if (T == android_os_Binder) {
    return (android_os_Binder()..refId = (__this__ as Ref).refId) as T;
  } else if (T == android_view_View) {
    return (android_view_View()..refId = (__this__ as Ref).refId) as T;
  } else if (T == android_view_SurfaceView) {
    return (android_view_SurfaceView()..refId = (__this__ as Ref).refId) as T;
  } else if (T == android_view_SurfaceHolder) {
    return (android_view_SurfaceHolder.subInstance()
      ..refId = (__this__ as Ref).refId) as T;
  } else if (T == android_opengl_GLSurfaceView) {
    return (android_opengl_GLSurfaceView()..refId = (__this__ as Ref).refId)
        as T;
  } else if (T == android_view_View_OnApplyWindowInsetsListener) {
    return (android_view_View_OnApplyWindowInsetsListener.subInstance()
      ..refId = (__this__ as Ref).refId) as T;
  } else if (T == android_view_ViewGroup) {
    return (android_view_ViewGroup()..refId = (__this__ as Ref).refId) as T;
  } else if (T == android_graphics_Point) {
    return (android_graphics_Point()..refId = (__this__ as Ref).refId) as T;
  } else if (T == android_graphics_PointF) {
    return (android_graphics_PointF()..refId = (__this__ as Ref).refId) as T;
  } else if (T == android_graphics_Bitmap) {
    return (android_graphics_Bitmap()..refId = (__this__ as Ref).refId) as T;
  } else if (T == android_widget_ImageView) {
    return (android_widget_ImageView()..refId = (__this__ as Ref).refId) as T;
  } else if (T == java_io_Serializable) {
    return (java_io_Serializable.subInstance()..refId = (__this__ as Ref).refId)
        as T;
  } else if (T == java_io_File) {
    return (java_io_File()..refId = (__this__ as Ref).refId) as T;
  } else if (T == android_location_Location) {
    return (android_location_Location()..refId = (__this__ as Ref).refId) as T;
  } else if (T == android_view_MotionEvent) {
    return (android_view_MotionEvent()..refId = (__this__ as Ref).refId) as T;
  } else if (T == android_graphics_drawable_Drawable) {
    return (android_graphics_drawable_Drawable()
      ..refId = (__this__ as Ref).refId) as T;
  } else if (T == android_widget_FrameLayout) {
    return (android_widget_FrameLayout()..refId = (__this__ as Ref).refId) as T;
  } else if (T == android_widget_TextView) {
    return (android_widget_TextView()..refId = (__this__ as Ref).refId) as T;
  } else if (T == android_widget_LinearLayout) {
    return (android_widget_LinearLayout()..refId = (__this__ as Ref).refId)
        as T;
  } else if (T == android_widget_RelativeLayout) {
    return (android_widget_RelativeLayout()..refId = (__this__ as Ref).refId)
        as T;
  } else if (T == android_os_Parcelable) {
    return (android_os_Parcelable.subInstance()
      ..refId = (__this__ as Ref).refId) as T;
  } else if (T == android_util_Pair) {
    return (android_util_Pair()..refId = (__this__ as Ref).refId) as T;
  } else {
    return null;
  }
}
