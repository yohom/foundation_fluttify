#import "FoundationFluttifyPlugin.h"
#import "PlatformService.h"
#import "UIImageHandler.h"
#import "UIViewHandler.h"
#import "CGPointHandler.h"
#import "NSDataHandler.h"
#import "NSDateHandler.h"
#import "UIEdgeInsetsHandler.h"
#import "UIColorHandler.h"
#import "NSErrorHandler.h"
#import "CGRectHandler.h"
#import "CGSizeHandler.h"
#import "UIViewControllerHandler.h"
#import "UIImageViewHandler.h"
#import "NSObjectHandler.h"
#import "platform_view/UIViewFactory.h"
#import "FluttifyMessageCodec.h"

// The stack that exists on the Dart side for a method call is enabled only when the MethodChannel passing parameters are limited
NSMutableDictionary<NSString *, NSObject *> *STACK;

// Container for Dart side random access objects
NSMutableDictionary<NSString *, NSObject *> *HEAP;

// whether enable log or not
BOOL enableLog;

NSString *_channelName = @"com.fluttify/foundation_method";

@implementation FoundationFluttifyPlugin {
  NSObject <FlutterPluginRegistrar> *_registrar;
}

+ (void)registerWithRegistrar:(NSObject <FlutterPluginRegistrar> *)registrar {
  // 栈容器
  STACK = @{}.mutableCopy;
  // 堆容器
  HEAP = @{}.mutableCopy;

  FlutterMethodChannel *channel = [FlutterMethodChannel
      methodChannelWithName:_channelName
            binaryMessenger:[registrar messenger]
                      codec:[FlutterStandardMethodCodec codecWithReaderWriter:[[FluttifyReaderWriter alloc] init]]];

  FoundationFluttifyPlugin *instance = [[FoundationFluttifyPlugin alloc] initWithRegistrar:registrar];
  [registrar addMethodCallDelegate:instance channel:channel];
  [registrar registerViewFactory:[[UIViewFactory alloc] initWithRegistrar:registrar] withId:@"me.yohom/foundation_fluttify/UIView"];
}

- (instancetype)initWithRegistrar:(NSObject <FlutterPluginRegistrar> *)registrar {
  self = [super init];
  if (self) {
    _registrar = registrar;
    [_registrar addApplicationDelegate:self];
  }
  return self;
}

- (void)handleMethodCall:(FlutterMethodCall *)methodCall result:(FlutterResult)methodResult {
  id rawArgs = [methodCall arguments];
  if ([methodCall.method hasPrefix:@"UIImage::"]) {
    UIImageHandler(methodCall.method, rawArgs, methodResult);
  } else if ([methodCall.method hasPrefix:@"UIViewController::"]) {
    UIViewControllerHandler(methodCall.method, rawArgs, methodResult);
  } else if ([methodCall.method hasPrefix:@"UIView::"]) {
    UIViewHandler(methodCall.method, rawArgs, methodResult);
  } else if ([methodCall.method hasPrefix:@"CGPoint::"]) {
    CGPointHandler(methodCall.method, rawArgs, methodResult);
  } else if ([methodCall.method hasPrefix:@"NSData::"]) {
    NSDataHandler(methodCall.method, rawArgs, methodResult);
  } else if ([methodCall.method hasPrefix:@"UIEdgeInsets::"]) {
    UIEdgeInsetsHandler(methodCall.method, rawArgs, methodResult);
  } else if ([methodCall.method hasPrefix:@"UIColor::"]) {
    UIColorHandler(methodCall.method, rawArgs, methodResult);
  } else if ([methodCall.method hasPrefix:@"NSError::"]) {
    NSErrorHandler(methodCall.method, rawArgs, methodResult);
  } else if ([methodCall.method hasPrefix:@"CGRect::"]) {
    CGRectHandler(methodCall.method, rawArgs, methodResult);
  } else if ([methodCall.method hasPrefix:@"CGSize::"]) {
    CGSizeHandler(methodCall.method, rawArgs, methodResult);
  } else if ([methodCall.method hasPrefix:@"UIImageView::"]) {
    UIImageViewHandler(methodCall.method, rawArgs, methodResult);
  } else if ([methodCall.method hasPrefix:@"NSObject::"]) {
    NSObjectHandler(methodCall.method, rawArgs, methodResult);
  } else if ([methodCall.method hasPrefix:@"NSDate::"]) {
    NSDateHandler(methodCall.method, rawArgs, methodResult);
  } else if ([methodCall.method hasPrefix:@"Platform"]) {
    PlatformService(methodCall.method, rawArgs, methodResult, self->_registrar);
  } else {
    methodResult(FlutterMethodNotImplemented);
  }
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
  if (enableLog) {
    NSLog(@"application:didFinishLaunchingWithOptions");
  }
  FlutterMethodChannel *channel = [FlutterMethodChannel
      methodChannelWithName:_channelName
            binaryMessenger:[_registrar messenger]
                      codec:[FlutterStandardMethodCodec codecWithReaderWriter:[[FluttifyReaderWriter alloc] init]]];

  [channel invokeMethod:@"applicationDidFinishLaunchingWithOptions"
              arguments:@{@"application": application, @"launchOptions": @{}}]; // 由于无法预知NSDictionary里的类型, 这里不传输了
  return YES;
}

/**
 * Called if this has been registered for `UIApplicationDelegate` callbacks.
 *
 * @return `NO` if this vetoes application launch.
 */
- (BOOL)application:(UIApplication *)application willFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
  if (enableLog) {
    NSLog(@"application:willFinishLaunchingWithOptions");
  }
  FlutterMethodChannel *channel = [FlutterMethodChannel
      methodChannelWithName:_channelName
            binaryMessenger:[_registrar messenger]
                      codec:[FlutterStandardMethodCodec codecWithReaderWriter:[[FluttifyReaderWriter alloc] init]]];

  [channel invokeMethod:@"applicationWillFinishLaunchingWithOptions"
              arguments:@{@"application": application, @"launchOptions": @{}}];
  return YES;
}

/**
 * Called if this has been registered for `UIApplicationDelegate` callbacks.
 */
- (void)applicationDidBecomeActive:(UIApplication *)application {
  if (enableLog) {
    NSLog(@"applicationDidBecomeActive");
  }
  FlutterMethodChannel *channel = [FlutterMethodChannel
      methodChannelWithName:_channelName
            binaryMessenger:[_registrar messenger]
                      codec:[FlutterStandardMethodCodec codecWithReaderWriter:[[FluttifyReaderWriter alloc] init]]];

  [channel invokeMethod:@"applicationDidBecomeActive"
              arguments:@{@"application": application}];
}

/**
 * Called if this has been registered for `UIApplicationDelegate` callbacks.
 */
- (void)applicationWillResignActive:(UIApplication *)application {
  if (enableLog) {
    NSLog(@"applicationWillResignActive");
  }
  FlutterMethodChannel *channel = [FlutterMethodChannel
      methodChannelWithName:_channelName
            binaryMessenger:[_registrar messenger]
                      codec:[FlutterStandardMethodCodec codecWithReaderWriter:[[FluttifyReaderWriter alloc] init]]];

  [channel invokeMethod:@"applicationWillResignActive"
              arguments:@{@"application": application}];
}

/**
 * Called if this has been registered for `UIApplicationDelegate` callbacks.
 */
- (void)applicationDidEnterBackground:(UIApplication *)application {
  if (enableLog) {
    NSLog(@"applicationDidEnterBackground");
  }
  FlutterMethodChannel *channel = [FlutterMethodChannel
      methodChannelWithName:_channelName
            binaryMessenger:[_registrar messenger]
                      codec:[FlutterStandardMethodCodec codecWithReaderWriter:[[FluttifyReaderWriter alloc] init]]];

  [channel invokeMethod:@"applicationDidEnterBackground"
              arguments:@{@"application": application}];
}

/**
 * Called if this has been registered for `UIApplicationDelegate` callbacks.
 */
- (void)applicationWillEnterForeground:(UIApplication *)application {
  if (enableLog) {
    NSLog(@"applicationWillEnterForeground");
  }
  FlutterMethodChannel *channel = [FlutterMethodChannel
      methodChannelWithName:_channelName
            binaryMessenger:[_registrar messenger]
                      codec:[FlutterStandardMethodCodec codecWithReaderWriter:[[FluttifyReaderWriter alloc] init]]];

  [channel invokeMethod:@"applicationWillEnterForeground"
              arguments:@{@"application": application}];
}

/**
 Called if this has been registered for `UIApplicationDelegate` callbacks.
 */
- (void)applicationWillTerminate:(UIApplication *)application {
  if (enableLog) {
    NSLog(@"applicationWillTerminate");
  }
  FlutterMethodChannel *channel = [FlutterMethodChannel
      methodChannelWithName:_channelName
            binaryMessenger:[_registrar messenger]
                      codec:[FlutterStandardMethodCodec codecWithReaderWriter:[[FluttifyReaderWriter alloc] init]]];

  [channel invokeMethod:@"applicationWillTerminate"
              arguments:@{@"application": application}];
}

/**
 * Called if this has been registered for `UIApplicationDelegate` callbacks.
 */
- (void)                application:(UIApplication *)application
didRegisterUserNotificationSettings:(UIUserNotificationSettings *)notificationSettings
API_DEPRECATED(
    "See -[UIApplicationDelegate application:didRegisterUserNotificationSettings:] deprecation",
    ios(8.0, 10.0)) {
  if (enableLog) {
    NSLog(@"application:didRegisterUserNotificationSettings");
  }
  FlutterMethodChannel *channel = [FlutterMethodChannel
      methodChannelWithName:_channelName
            binaryMessenger:[_registrar messenger]
                      codec:[FlutterStandardMethodCodec codecWithReaderWriter:[[FluttifyReaderWriter alloc] init]]];

  [channel invokeMethod:@"applicationDidRegisterUserNotificationSettings"
              arguments:@{@"application": application, @"notificationSettings": notificationSettings}];
}

/**
 * Called if this has been registered for `UIApplicationDelegate` callbacks.
 */
- (void)application:(UIApplication *)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken {
  if (enableLog) {
    NSLog(@"application:didRegisterForRemoteNotificationsWithDeviceToken");
  }
  FlutterMethodChannel *channel = [FlutterMethodChannel
      methodChannelWithName:_channelName
            binaryMessenger:[_registrar messenger]
                      codec:[FlutterStandardMethodCodec codecWithReaderWriter:[[FluttifyReaderWriter alloc] init]]];

  [channel invokeMethod:@"applicationDidRegisterForRemoteNotificationsWithDeviceToken"
              arguments:@{@"application": application, @"deviceToken": deviceToken}];
}

/**
 * Called if this has been registered for `UIApplicationDelegate` callbacks.
 *
 * @return `YES` if this handles the request.
 */
- (BOOL)         application:(UIApplication *)application
didReceiveRemoteNotification:(NSDictionary *)userInfo
      fetchCompletionHandler:(void (^)(UIBackgroundFetchResult result))completionHandler {
  if (enableLog) {
    NSLog(@"application:didReceiveRemoteNotification:fetchCompletionHandler");
  }
  FlutterMethodChannel *channel = [FlutterMethodChannel
      methodChannelWithName:_channelName
            binaryMessenger:[_registrar messenger]
                      codec:[FlutterStandardMethodCodec codecWithReaderWriter:[[FluttifyReaderWriter alloc] init]]];

  [channel invokeMethod:@"applicationDidReceiveRemoteNotificationFetchCompletionHandler"
              arguments:@{@"application": application, @"userInfo": userInfo}];
  return NO;
}

/**
 * Called if this has been registered for `UIApplicationDelegate` callbacks.
 *
 * @return `YES` if this handles the request.
 */
- (BOOL)application:(UIApplication *)application
            openURL:(NSURL *)url
            options:(NSDictionary<UIApplicationOpenURLOptionsKey, id> *)options {
  if (enableLog) {
    NSLog(@"application:openURL:options");
  }
  FlutterMethodChannel *channel = [FlutterMethodChannel
      methodChannelWithName:_channelName
            binaryMessenger:[_registrar messenger]
                      codec:[FlutterStandardMethodCodec codecWithReaderWriter:[[FluttifyReaderWriter alloc] init]]];

  [channel invokeMethod:@"applicationOpenURLOptions"
              arguments:@{@"application": application, @"url": url, @"options": @{}}];
  return NO;
}

/**
 * Called if this has been registered for `UIApplicationDelegate` callbacks.
 *
 * @return `YES` if this handles the request.
 */
- (BOOL)application:(UIApplication *)application handleOpenURL:(NSURL *)url {
  if (enableLog) {
    NSLog(@"application:handleOpenURL");
  }
  FlutterMethodChannel *channel = [FlutterMethodChannel
      methodChannelWithName:_channelName
            binaryMessenger:[_registrar messenger]
                      codec:[FlutterStandardMethodCodec codecWithReaderWriter:[[FluttifyReaderWriter alloc] init]]];

  [channel invokeMethod:@"applicationHandleOpenURL"
              arguments:@{@"application": application, @"url": url}];
  return NO;
}

/**
 * Called if this has been registered for `UIApplicationDelegate` callbacks.
 *
 * @return `YES` if this handles the request.
 */
- (BOOL)application:(UIApplication *)application
            openURL:(NSURL *)url
  sourceApplication:(NSString *)sourceApplication
         annotation:(id)annotation {
  if (enableLog) {
    NSLog(@"application:openURL:sourceApplication:annotation");
  }
  FlutterMethodChannel *channel = [FlutterMethodChannel
      methodChannelWithName:_channelName
            binaryMessenger:[_registrar messenger]
                      codec:[FlutterStandardMethodCodec codecWithReaderWriter:[[FluttifyReaderWriter alloc] init]]];

  [channel invokeMethod:@"applicationOpenURLSourceApplicationAnnotation"
              arguments:@{@"application": application, @"url": url, @"sourceApplication": sourceApplication, @"annotation": (NSObject *) annotation}];
  return NO;
}

/**
 * Called if this has been registered for `UIApplicationDelegate` callbacks.
 *
 * @return `YES` if this handles the request.
 */
- (BOOL)         application:(UIApplication *)application
performActionForShortcutItem:(UIApplicationShortcutItem *)shortcutItem
           completionHandler:(void (^)(BOOL succeeded))completionHandler
API_AVAILABLE(ios(9.0)) {
  if (enableLog) {
    NSLog(@"application:performActionForShortcutItem:completionHandler");
  }
  FlutterMethodChannel *channel = [FlutterMethodChannel
      methodChannelWithName:_channelName
            binaryMessenger:[_registrar messenger]
                      codec:[FlutterStandardMethodCodec codecWithReaderWriter:[[FluttifyReaderWriter alloc] init]]];

  [channel invokeMethod:@"applicationPerformActionForShortcutItemCompletionHandler"
              arguments:@{@"application": application, @"shortcutItem": shortcutItem}];
  return NO;
}

/**
 * Called if this has been registered for `UIApplicationDelegate` callbacks.
 *
 * @return `YES` if this handles the request.
 */
- (BOOL)                application:(UIApplication *)application
handleEventsForBackgroundURLSession:(nonnull NSString *)identifier
                  completionHandler:(nonnull void (^)(void))completionHandler {
  if (enableLog) {
    NSLog(@"application:handleEventsForBackgroundURLSession:completionHandler");
  }
  FlutterMethodChannel *channel = [FlutterMethodChannel
      methodChannelWithName:_channelName
            binaryMessenger:[_registrar messenger]
                      codec:[FlutterStandardMethodCodec codecWithReaderWriter:[[FluttifyReaderWriter alloc] init]]];

  [channel invokeMethod:@"applicationHandleEventsForBackgroundURLSessionCompletionHandler"
              arguments:@{@"application": application, @"identifier": identifier}];
  return NO;
}

/**
 * Called if this has been registered for `UIApplicationDelegate` callbacks.
 *
 * @return `YES` if this handles the request.
 */
- (BOOL)              application:(UIApplication *)application
performFetchWithCompletionHandler:(void (^)(UIBackgroundFetchResult result))completionHandler {
  if (enableLog) {
    NSLog(@"application:performFetchWithCompletionHandler");
  }
  FlutterMethodChannel *channel = [FlutterMethodChannel
      methodChannelWithName:_channelName
            binaryMessenger:[_registrar messenger]
                      codec:[FlutterStandardMethodCodec codecWithReaderWriter:[[FluttifyReaderWriter alloc] init]]];

  [channel invokeMethod:@"applicationPerformFetchWithCompletionHandler"
              arguments:@{@"application": application}];
  return NO;
}

/**
 * Called if this has been registered for `UIApplicationDelegate` callbacks.
 *
 * @return `YES` if this handles the request.
 */
- (BOOL) application:(UIApplication *)application
continueUserActivity:(NSUserActivity *)userActivity
  restorationHandler:(void (^)(NSArray *))restorationHandler {
  if (enableLog) {
    NSLog(@"application:continueUserActivity:restorationHandler");
  }
  FlutterMethodChannel *channel = [FlutterMethodChannel
      methodChannelWithName:_channelName
            binaryMessenger:[_registrar messenger]
                      codec:[FlutterStandardMethodCodec codecWithReaderWriter:[[FluttifyReaderWriter alloc] init]]];

  [channel invokeMethod:@"applicationContinueUserActivityRestorationHandler"
              arguments:@{@"application": application, @"userActivity": userActivity}];
  return NO;
}

@end
