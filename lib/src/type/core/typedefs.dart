// @dart=2.9

import 'dart:async';

import 'package:foundation_fluttify/foundation_fluttify.dart';
import 'package:foundation_fluttify/src/type/platform/ios_type/ui_application.dart';

typedef FutureVoidCallback = Future<void> Function();
typedef FutureValueChanged<T> = Future<void> Function(T value);
typedef Action0 = FutureOr<void> Function();
typedef Action1<T> = FutureOr<void> Function(T arg0);
typedef Action2<T1, T2> = FutureOr<void> Function(T1 arg0, T2 arg1);
typedef Action3<T1, T2, T3> = FutureOr<void> Function(
    T1 arg1, T2 arg2, T3 arg3);
typedef Action4<T1, T2, T3, T4> = FutureOr<void> Function(
  T1 arg1,
  T2 arg2,
  T3 arg3,
  T4 arg4,
);
typedef Action5<T1, T2, T3, T4, T5> = FutureOr<void> Function(
  T1 arg1,
  T2 arg2,
  T3 arg3,
  T4 arg4,
  T5 arg5,
);
typedef Action6<T1, T2, T3, T4, T5, T6> = FutureOr<void> Function(
  T1 arg1,
  T2 arg2,
  T3 arg3,
  T4 arg4,
  T5 arg5,
  T6 arg6,
);
typedef Action7<T1, T2, T3, T4, T5, T6, T7> = FutureOr<void> Function(
  T1 arg1,
  T2 arg2,
  T3 arg3,
  T4 arg4,
  T5 arg5,
  T6 arg6,
  T7 arg7,
);
typedef Action8<T1, T2, T3, T4, T5, T6, T7, T8> = FutureOr<void> Function(
  T1 arg1,
  T2 arg2,
  T3 arg3,
  T4 arg4,
  T5 arg5,
  T6 arg6,
  T7 arg7,
  T8 arg8,
);
typedef Action9<T1, T2, T3, T4, T5, T6, T7, T8, T9> = FutureOr<void> Function(
  T1 arg1,
  T2 arg2,
  T3 arg3,
  T4 arg4,
  T5 arg5,
  T6 arg6,
  T7 arg7,
  T8 arg8,
  T9 arg9,
);
typedef Function0<R> = FutureOr<R> Function();
typedef Function1<T, R> = FutureOr<R> Function(T arg0);
typedef Function2<T1, T2, R> = FutureOr<R> Function(T1 arg0, T2 arg1);
typedef Function3<T1, T2, T3, R> = FutureOr<R> Function(
    T1 arg1, T2 arg2, T3 arg3);
typedef Function4<T1, T2, T3, T4, R> = FutureOr<R> Function(
  T1 arg1,
  T2 arg2,
  T3 arg3,
  T4 arg4,
);
typedef Function5<T1, T2, T3, T4, T5, R> = FutureOr<R> Function(
  T1 arg1,
  T2 arg2,
  T3 arg3,
  T4 arg4,
  T5 arg5,
);
typedef Function6<T1, T2, T3, T4, T5, T6, R> = FutureOr<R> Function(
  T1 arg1,
  T2 arg2,
  T3 arg3,
  T4 arg4,
  T5 arg5,
  T6 arg6,
);
typedef Function7<T1, T2, T3, T4, T5, T6, T7, R> = FutureOr<R> Function(
  T1 arg1,
  T2 arg2,
  T3 arg3,
  T4 arg4,
  T5 arg5,
  T6 arg6,
  T7 arg7,
);
typedef Function8<T1, T2, T3, T4, T5, T6, T7, T8, R> = FutureOr<R> Function(
  T1 arg1,
  T2 arg2,
  T3 arg3,
  T4 arg4,
  T5 arg5,
  T6 arg6,
  T7 arg7,
  T8 arg8,
);
typedef Function9<T1, T2, T3, T4, T5, T6, T7, T8, T9, R> = FutureOr<R> Function(
  T1 arg1,
  T2 arg2,
  T3 arg3,
  T4 arg4,
  T5 arg5,
  T6 arg6,
  T7 arg7,
  T8 arg8,
  T9 arg9,
);

typedef ApplicationDidFinishLaunchingWithOptions = void Function(
  UIApplication application,
  Map options,
);
typedef ApplicationWillFinishLaunchingWithOptions = void Function(
  UIApplication application,
  Map options,
);
typedef ApplicationDidBecomeActive = void Function(UIApplication application);
typedef ApplicationWillResignActive = void Function(UIApplication application);
typedef ApplicationDidEnterBackground = void Function(
    UIApplication application);
typedef ApplicationWillEnterForeground = void Function(
    UIApplication application);
typedef ApplicationWillTerminate = void Function(UIApplication application);
typedef ApplicationDidRegisterUserNotificationSettings = void Function(
  UIApplication application,
  UIUserNotificationSettings notificationSettings,
);
typedef ApplicationDidRegisterForRemoteNotificationsWithDeviceToken = void
    Function(
  UIApplication application,
  NSData deviceToken,
);
typedef ApplicationDidReceiveRemoteNotificationFetchCompletionHandler = void
    Function(
  UIApplication application,
  Map userInfo,
);
typedef ApplicationOpenURLOptions = void Function(
  UIApplication application,
  NSURL url,
  Map<String, dynamic> options,
);
typedef ApplicationHandleOpenURL = void Function(
  UIApplication application,
  NSURL url,
);
typedef ApplicationOpenURLSourceApplicationAnnotation = void Function(
  UIApplication application,
  NSURL url,
  String sourceApplication,
  NSObject annotation,
);
typedef ApplicationPerformActionForShortcutItemCompletionHandler = void
    Function(
  UIApplication application,
  UIApplicationShortcutItem shortcutItem,
);
typedef ApplicationHandleEventsForBackgroundURLSessionCompletionHandler = void
    Function(
  UIApplication application,
  String identifier,
);
typedef ApplicationPerformFetchWithCompletionHandler = void Function(
  UIApplication application,
);
typedef ApplicationContinueUserActivityRestorationHandler = void Function(
  UIApplication application,
  NSUserActivity userActivity,
);
