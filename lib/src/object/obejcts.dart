import 'package:flutter/services.dart';
import 'package:foundation_fluttify/foundation_fluttify.dart';
import 'package:foundation_fluttify/src/type/core/ref.dart';
import 'package:foundation_fluttify/src/type/core/typedefs.dart';

/// native object release pool, all objects returned by the native side will be in this set
final kNativeObjectPool = <Ref>{};

const kMethodChannelName = 'com.fluttify/foundation_method';
final kMethodChannel = MethodChannel(kMethodChannelName)
  ..setMethodCallHandler((call) async {
    final method = call.method;
    final arguments = call.arguments as Map<String, dynamic>;

    final application = UIApplication()..refId = arguments['application'];
    switch (method) {
      case 'applicationDidFinishLaunchingWithOptions':
        if (applicationDidFinishLaunchingWithOptions != null) {
          final launchOptions = arguments['launchOptions'] as Map;
          applicationDidFinishLaunchingWithOptions(application, launchOptions);
        }
        break;
      case 'applicationWillFinishLaunchingWithOptions':
        if (applicationWillFinishLaunchingWithOptions != null) {
          final launchOptions = arguments['launchOptions'] as Map;
          applicationWillFinishLaunchingWithOptions(application, launchOptions);
        }
        break;
      case 'applicationDidBecomeActive':
        if (applicationDidBecomeActive != null) {
          applicationDidBecomeActive(application);
        }
        break;
      case 'applicationWillResignActive':
        if (applicationWillResignActive != null) {
          applicationWillResignActive(application);
        }
        break;
      case 'applicationDidEnterBackground':
        if (applicationDidEnterBackground != null) {
          applicationDidEnterBackground(application);
        }
        break;
      case 'applicationWillEnterForeground':
        if (applicationWillEnterForeground != null) {
          applicationWillEnterForeground(application);
        }
        break;
      case 'applicationWillTerminate':
        if (applicationWillTerminate != null) {
          applicationWillTerminate(application);
        }
        break;
      case 'applicationDidRegisterUserNotificationSettings':
        if (applicationDidRegisterUserNotificationSettings != null) {
          final notificationSettings = UIUserNotificationSettings()
            ..refId = arguments['notificationSettings'];

          applicationDidRegisterUserNotificationSettings(
              application, notificationSettings);
        }
        break;
      case 'applicationDidRegisterForRemoteNotificationsWithDeviceToken':
        if (applicationDidRegisterForRemoteNotificationsWithDeviceToken !=
            null) {
          final deviceToken = NSData()..refId = arguments['deviceToken'];

          applicationDidRegisterForRemoteNotificationsWithDeviceToken(
              application, deviceToken);
        }
        break;
      case 'applicationDidReceiveRemoteNotificationFetchCompletionHandler':
        if (applicationDidReceiveRemoteNotificationFetchCompletionHandler !=
            null) {
          final userInfo = arguments['userInfo'] as Map;
          applicationDidReceiveRemoteNotificationFetchCompletionHandler(
              application, userInfo);
        }
        break;
      case 'applicationOpenURLOptions':
        if (applicationOpenURLOptions != null) {
          final url = NSUrl()..refId = arguments['url'];
          final options = arguments['options'] as Map;
          applicationOpenURLOptions(application, url, options);
        }
        break;
      case 'applicationHandleOpenURL':
        if (applicationHandleOpenURL != null) {
          final url = NSUrl()..refId = arguments['url'];
          applicationHandleOpenURL(application, url);
        }
        break;
      case 'applicationOpenURLSourceApplicationAnnotation':
        if (applicationOpenURLSourceApplicationAnnotation != null) {
          final openURL = NSUrl()..refId = arguments['openURL'];
          final sourceApplication = arguments['sourceApplication'] as String;
          final annotation = NSObject()..refId = arguments['annotation'];

          applicationOpenURLSourceApplicationAnnotation(
            application,
            openURL,
            sourceApplication,
            annotation,
          );
        }
        break;
      case 'applicationPerformActionForShortcutItemCompletionHandler':
        if (applicationPerformActionForShortcutItemCompletionHandler != null) {
          final shortcutItem = UIApplicationShortcutItem()
            ..refId = arguments['shortcutItem'];

          applicationPerformActionForShortcutItemCompletionHandler(
              application, shortcutItem);
        }
        break;
      case 'applicationHandleEventsForBackgroundURLSessionCompletionHandler':
        if (applicationHandleEventsForBackgroundURLSessionCompletionHandler !=
            null) {
          final identifier = arguments['identifier'] as String;

          applicationHandleEventsForBackgroundURLSessionCompletionHandler(
              application, identifier);
        }
        break;
      case 'applicationPerformFetchWithCompletionHandler':
        if (applicationPerformFetchWithCompletionHandler != null) {
          applicationPerformFetchWithCompletionHandler(application);
        }
        break;
      case 'applicationContinueUserActivityRestorationHandler':
        if (applicationContinueUserActivityRestorationHandler != null) {
          final userActivity = NSUserActivity()
            ..refId = arguments['userActivity'];

          applicationContinueUserActivityRestorationHandler(
              application, userActivity);
        }
        break;
      default:
        return Future.error('not implemented');
    }
  });

const kBroadcastEventChannelName = 'com.fluttify/foundation_broadcast_event';
const kBroadcastEventChannel = EventChannel(kBroadcastEventChannelName);

const kSensorEventChannelName = 'com.fluttify/foundation_sensor_event';
const kSensorEventChannel = EventChannel(kSensorEventChannelName);

ApplicationDidFinishLaunchingWithOptions
    applicationDidFinishLaunchingWithOptions;

ApplicationWillFinishLaunchingWithOptions
    applicationWillFinishLaunchingWithOptions;

ApplicationDidBecomeActive applicationDidBecomeActive;

ApplicationWillResignActive applicationWillResignActive;

ApplicationDidEnterBackground applicationDidEnterBackground;

ApplicationWillEnterForeground applicationWillEnterForeground;

ApplicationWillTerminate applicationWillTerminate;

ApplicationDidRegisterUserNotificationSettings
    applicationDidRegisterUserNotificationSettings;

ApplicationDidRegisterForRemoteNotificationsWithDeviceToken
    applicationDidRegisterForRemoteNotificationsWithDeviceToken;

ApplicationDidReceiveRemoteNotificationFetchCompletionHandler
    applicationDidReceiveRemoteNotificationFetchCompletionHandler;

ApplicationOpenURLOptions applicationOpenURLOptions;

ApplicationHandleOpenURL applicationHandleOpenURL;

ApplicationOpenURLSourceApplicationAnnotation
    applicationOpenURLSourceApplicationAnnotation;

ApplicationPerformActionForShortcutItemCompletionHandler
    applicationPerformActionForShortcutItemCompletionHandler;

ApplicationHandleEventsForBackgroundURLSessionCompletionHandler
    applicationHandleEventsForBackgroundURLSessionCompletionHandler;

ApplicationPerformFetchWithCompletionHandler
    applicationPerformFetchWithCompletionHandler;

ApplicationContinueUserActivityRestorationHandler
    applicationContinueUserActivityRestorationHandler;
