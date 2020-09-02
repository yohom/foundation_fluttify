import 'dart:async';

import 'package:foundation_fluttify/foundation_fluttify.dart';
import 'package:foundation_fluttify/src/type/platform/ios_type/ui_application.dart';

typedef Future<void> FutureVoidCallback();
typedef Future<void> FutureValueChanged<T>(T value);
typedef FutureOr<void> Action0();
typedef FutureOr<void> Action1<T>(T arg0);
typedef FutureOr<void> Action2<T1, T2>(T1 arg0, T2 arg1);
typedef FutureOr<void> Action3<T1, T2, T3>(T1 arg1, T2 arg2, T3 arg3);
typedef FutureOr<void> Action4<T1, T2, T3, T4>(
  T1 arg1,
  T2 arg2,
  T3 arg3,
  T4 arg4,
);
typedef FutureOr<void> Action5<T1, T2, T3, T4, T5>(
  T1 arg1,
  T2 arg2,
  T3 arg3,
  T4 arg4,
  T5 arg5,
);
typedef FutureOr<void> Action6<T1, T2, T3, T4, T5, T6>(
  T1 arg1,
  T2 arg2,
  T3 arg3,
  T4 arg4,
  T5 arg5,
  T6 arg6,
);
typedef FutureOr<void> Action7<T1, T2, T3, T4, T5, T6, T7>(
  T1 arg1,
  T2 arg2,
  T3 arg3,
  T4 arg4,
  T5 arg5,
  T6 arg6,
  T7 arg7,
);
typedef FutureOr<void> Action8<T1, T2, T3, T4, T5, T6, T7, T8>(
  T1 arg1,
  T2 arg2,
  T3 arg3,
  T4 arg4,
  T5 arg5,
  T6 arg6,
  T7 arg7,
  T8 arg8,
);
typedef FutureOr<void> Action9<T1, T2, T3, T4, T5, T6, T7, T8, T9>(
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
typedef FutureOr<R> Function0<R>();
typedef FutureOr<R> Function1<T, R>(T arg0);
typedef FutureOr<R> Function2<T1, T2, R>(T1 arg0, T2 arg1);
typedef FutureOr<R> Function3<T1, T2, T3, R>(T1 arg1, T2 arg2, T3 arg3);
typedef FutureOr<R> Function4<T1, T2, T3, T4, R>(
  T1 arg1,
  T2 arg2,
  T3 arg3,
  T4 arg4,
);
typedef FutureOr<R> Function5<T1, T2, T3, T4, T5, R>(
  T1 arg1,
  T2 arg2,
  T3 arg3,
  T4 arg4,
  T5 arg5,
);
typedef FutureOr<R> Function6<T1, T2, T3, T4, T5, T6, R>(
  T1 arg1,
  T2 arg2,
  T3 arg3,
  T4 arg4,
  T5 arg5,
  T6 arg6,
);
typedef FutureOr<R> Function7<T1, T2, T3, T4, T5, T6, T7, R>(
  T1 arg1,
  T2 arg2,
  T3 arg3,
  T4 arg4,
  T5 arg5,
  T6 arg6,
  T7 arg7,
);
typedef FutureOr<R> Function8<T1, T2, T3, T4, T5, T6, T7, T8, R>(
  T1 arg1,
  T2 arg2,
  T3 arg3,
  T4 arg4,
  T5 arg5,
  T6 arg6,
  T7 arg7,
  T8 arg8,
);
typedef FutureOr<R> Function9<T1, T2, T3, T4, T5, T6, T7, T8, T9, R>(
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

typedef void ApplicationDidFinishLaunchingWithOptions(
  UIApplication application,
  Map options,
);
typedef void ApplicationWillFinishLaunchingWithOptions(
  UIApplication application,
  Map options,
);
typedef void ApplicationDidBecomeActive(UIApplication application);
typedef void ApplicationWillResignActive(UIApplication application);
typedef void ApplicationDidEnterBackground(UIApplication application);
typedef void ApplicationWillEnterForeground(UIApplication application);
typedef void ApplicationWillTerminate(UIApplication application);
typedef void ApplicationDidRegisterUserNotificationSettings(
  UIApplication application,
  UIUserNotificationSettings notificationSettings,
);
typedef void ApplicationDidRegisterForRemoteNotificationsWithDeviceToken(
  UIApplication application,
  NSData deviceToken,
);
typedef void ApplicationDidReceiveRemoteNotificationFetchCompletionHandler(
  UIApplication application,
  Map userInfo,
);
typedef void ApplicationOpenURLOptions(
  UIApplication application,
  NSURL url,
  Map<String, dynamic> options,
);
typedef void ApplicationHandleOpenURL(
  UIApplication application,
  NSURL url,
);
typedef void ApplicationOpenURLSourceApplicationAnnotation(
  UIApplication application,
  NSURL url,
  String sourceApplication,
  NSObject annotation,
);
typedef void ApplicationPerformActionForShortcutItemCompletionHandler(
  UIApplication application,
  UIApplicationShortcutItem shortcutItem,
);
typedef void ApplicationHandleEventsForBackgroundURLSessionCompletionHandler(
  UIApplication application,
  String identifier,
);
typedef void ApplicationPerformFetchWithCompletionHandler(
  UIApplication application,
);
typedef void ApplicationContinueUserActivityRestorationHandler(
  UIApplication application,
  NSUserActivity userActivity,
);
