#import "FoundationFluttifyPlugin.h"
#import "PlatformService.h"
#import "CLLocationCoordinate2DHandler.h"
#import "CLLocationHandler.h"
#import "CLFloorHandler.h"
#import "CLLocationManagerHandler.h"
#import "UIImageHandler.h"
#import "UIViewHandler.h"
#import "CGPointHandler.h"
#import "NSDataHandler.h"
#import "UIEdgeInsetsHandler.h"
#import "CLHeadingHandler.h"
#import "UIColorHandler.h"

// The stack that exists on the Dart side for a method call is enabled only when the MethodChannel passing parameters are limited
NSMutableDictionary<NSString *, NSObject *> *STACK;

// Container for Dart side random access objects
NSMutableDictionary<NSNumber *, NSObject *> *HEAP;

// whether enable log or not
BOOL enableLog;

NSString* _channelName = @"com.fluttify/foundation_method";

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
                                     binaryMessenger:[registrar messenger]];
    FoundationFluttifyPlugin *instance = [[FoundationFluttifyPlugin alloc] initWithRegistrar:registrar];
    [registrar addMethodCallDelegate:instance channel:channel];
}

- (instancetype)initWithRegistrar:(NSObject <FlutterPluginRegistrar> *)registrar {
    self = [super init];
    if (self) {
        _registrar = registrar;
        [_registrar addApplicationDelegate: self];
    }
    return self;
}

- (void)handleMethodCall:(FlutterMethodCall *)methodCall result:(FlutterResult)methodResult {
    NSDictionary<NSString *, id> *args = (NSDictionary<NSString*, id> *) [methodCall arguments];
    if ([methodCall.method hasPrefix:@"CLLocationCoordinate2D"]) {
        CLLocationCoordinate2DHandler(methodCall.method, args, methodResult);
    } else if ([methodCall.method hasPrefix:@"CLLocation"]) {
        CLLocationHandler(methodCall.method, args, methodResult);
    } else if ([methodCall.method hasPrefix:@"CLFloor"]) {
        CLFloorHandler(methodCall.method, args, methodResult);
    } else if ([methodCall.method hasPrefix:@"CLLocationManager"]) {
        CLLocationManagerHandler(methodCall.method, args, methodResult);
    } else if ([methodCall.method hasPrefix:@"UIImage"]) {
        UIImageHandler(methodCall.method, args, methodResult);
    } else if ([methodCall.method hasPrefix:@"UIView"]) {
        UIViewHandler(methodCall.method, args, methodResult);
    } else if ([methodCall.method hasPrefix:@"CGPoint"]) {
        CGPointHandler(methodCall.method, args, methodResult);
    } else if ([methodCall.method hasPrefix:@"NSData"]) {
        NSDataHandler(methodCall.method, args, methodResult);
    } else if ([methodCall.method hasPrefix:@"UIEdgeInsets"]) {
        UIEdgeInsetsHandler(methodCall.method, args, methodResult);
    } else if ([methodCall.method hasPrefix:@"CLHeadingHandler"]) {
        CLHeadingHandler(methodCall.method, args, methodResult);
    } else if ([methodCall.method hasPrefix:@"UIColor"]) {
        UIColorHandler(methodCall.method, args, methodResult);
    } else if ([methodCall.method hasPrefix:@"Platform"]) {
        PlatformService(methodCall.method, args, methodResult, self->_registrar);
    } else {
        methodResult(FlutterMethodNotImplemented);
    }
}

- (BOOL)application:(UIApplication*)application didFinishLaunchingWithOptions:(NSDictionary*)launchOptions {
    FlutterMethodChannel* channel = [FlutterMethodChannel methodChannelWithName:_channelName binaryMessenger:[_registrar messenger]];
    [channel invokeMethod:@"applicationDidFinishLaunchingWithOptions"
                arguments:@{@"application": @(application.hash), @"launchOptions": launchOptions}];
    return YES;
}

/**
 * Called if this has been registered for `UIApplicationDelegate` callbacks.
 *
 * @return `NO` if this vetoes application launch.
 */
- (BOOL)application:(UIApplication*)application willFinishLaunchingWithOptions:(NSDictionary*)launchOptions {
    FlutterMethodChannel* channel = [FlutterMethodChannel methodChannelWithName:_channelName binaryMessenger:[_registrar messenger]];
    [channel invokeMethod:@"applicationWillFinishLaunchingWithOptions"
                arguments:@{@"application": @(application.hash), @"launchOptions": launchOptions}];
    return YES;
}

/**
 * Called if this has been registered for `UIApplicationDelegate` callbacks.
 */
- (void)applicationDidBecomeActive:(UIApplication*)application {
    FlutterMethodChannel* channel = [FlutterMethodChannel methodChannelWithName:_channelName binaryMessenger:[_registrar messenger]];
    [channel invokeMethod:@"applicationDidBecomeActive"
                arguments:@{@"application": @(application.hash)}];
}

/**
 * Called if this has been registered for `UIApplicationDelegate` callbacks.
 */
- (void)applicationWillResignActive:(UIApplication*)application {
    FlutterMethodChannel* channel = [FlutterMethodChannel methodChannelWithName:_channelName binaryMessenger:[_registrar messenger]];
    [channel invokeMethod:@"applicationWillResignActive"
                arguments:@{@"application": @(application.hash)}];
}

/**
 * Called if this has been registered for `UIApplicationDelegate` callbacks.
 */
- (void)applicationDidEnterBackground:(UIApplication*)application {
    FlutterMethodChannel* channel = [FlutterMethodChannel methodChannelWithName:_channelName binaryMessenger:[_registrar messenger]];
    [channel invokeMethod:@"applicationDidEnterBackground"
                arguments:@{@"application": @(application.hash)}];
}

/**
 * Called if this has been registered for `UIApplicationDelegate` callbacks.
 */
- (void)applicationWillEnterForeground:(UIApplication*)application {
    FlutterMethodChannel* channel = [FlutterMethodChannel methodChannelWithName:_channelName binaryMessenger:[_registrar messenger]];
    [channel invokeMethod:@"applicationWillEnterForeground"
                arguments:@{@"application": @(application.hash)}];
}

/**
 Called if this has been registered for `UIApplicationDelegate` callbacks.
 */
- (void)applicationWillTerminate:(UIApplication*)application {
    FlutterMethodChannel* channel = [FlutterMethodChannel methodChannelWithName:_channelName binaryMessenger:[_registrar messenger]];
    [channel invokeMethod:@"applicationWillTerminate"
                arguments:@{@"application": @(application.hash)}];
}

/**
 * Called if this has been registered for `UIApplicationDelegate` callbacks.
 */
- (void)application:(UIApplication*)application
didRegisterUserNotificationSettings:(UIUserNotificationSettings*)notificationSettings
API_DEPRECATED(
               "See -[UIApplicationDelegate application:didRegisterUserNotificationSettings:] deprecation",
               ios(8.0, 10.0)) {
    FlutterMethodChannel* channel = [FlutterMethodChannel methodChannelWithName:_channelName binaryMessenger:[_registrar messenger]];
    [channel invokeMethod:@"applicationDidRegisterUserNotificationSettings"
                arguments:@{@"application": @(application.hash), @"notificationSettings": @(notificationSettings.hash)}];
}

/**
 * Called if this has been registered for `UIApplicationDelegate` callbacks.
 */
- (void)application:(UIApplication*)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData*)deviceToken {
    FlutterMethodChannel* channel = [FlutterMethodChannel methodChannelWithName:_channelName binaryMessenger:[_registrar messenger]];
    [channel invokeMethod:@"applicationDidRegisterForRemoteNotificationsWithDeviceToken"
                arguments:@{@"application": @(application.hash), @"deviceToken": @(deviceToken.hash)}];
}

/**
 * Called if this has been registered for `UIApplicationDelegate` callbacks.
 *
 * @return `YES` if this handles the request.
 */
- (BOOL)application:(UIApplication*)application
didReceiveRemoteNotification:(NSDictionary*)userInfo
fetchCompletionHandler:(void (^)(UIBackgroundFetchResult result))completionHandler {
    FlutterMethodChannel* channel = [FlutterMethodChannel methodChannelWithName:_channelName binaryMessenger:[_registrar messenger]];
    [channel invokeMethod:@"applicationDidReceiveRemoteNotificationFetchCompletionHandler"
                arguments:@{@"application": @(application.hash), @"userInfo": @(userInfo.hash)}];
    return YES;
}

/**
 * Called if this has been registered for `UIApplicationDelegate` callbacks.
 *
 * @return `YES` if this handles the request.
 */
- (BOOL)application:(UIApplication*)application
            openURL:(NSURL*)url
            options:(NSDictionary<UIApplicationOpenURLOptionsKey, id>*)options {
    FlutterMethodChannel* channel = [FlutterMethodChannel methodChannelWithName:_channelName binaryMessenger:[_registrar messenger]];
    [channel invokeMethod:@"applicationOpenURLOptions"
                arguments:@{@"application": @(application.hash), @"url": @(url.hash), @"options": options}];
    return YES;
}

/**
 * Called if this has been registered for `UIApplicationDelegate` callbacks.
 *
 * @return `YES` if this handles the request.
 */
- (BOOL)application:(UIApplication*)application handleOpenURL:(NSURL*)url {
    FlutterMethodChannel* channel = [FlutterMethodChannel methodChannelWithName:_channelName binaryMessenger:[_registrar messenger]];
    [channel invokeMethod:@"applicationHandleOpenURL"
                arguments:@{@"application": @(application.hash), @"url": @(url.hash)}];
    return YES;
}

/**
 * Called if this has been registered for `UIApplicationDelegate` callbacks.
 *
 * @return `YES` if this handles the request.
 */
- (BOOL)application:(UIApplication*)application
            openURL:(NSURL*)url
  sourceApplication:(NSString*)sourceApplication
         annotation:(id)annotation {
    FlutterMethodChannel* channel = [FlutterMethodChannel methodChannelWithName:_channelName binaryMessenger:[_registrar messenger]];
    [channel invokeMethod:@"applicationOpenURLSourceApplicationAnnotation"
                arguments:@{@"application": @(application.hash), @"url": @(url.hash), @"sourceApplication": sourceApplication, @"annotation": @(((NSObject*) annotation).hash)}];
    return YES;
}

/**
 * Called if this has been registered for `UIApplicationDelegate` callbacks.
 *
 * @return `YES` if this handles the request.
 */
- (BOOL)application:(UIApplication*)application
performActionForShortcutItem:(UIApplicationShortcutItem*)shortcutItem
  completionHandler:(void (^)(BOOL succeeded))completionHandler
API_AVAILABLE(ios(9.0)) {
    FlutterMethodChannel* channel = [FlutterMethodChannel methodChannelWithName:_channelName binaryMessenger:[_registrar messenger]];
    [channel invokeMethod:@"applicationPerformActionForShortcutItemCompletionHandler"
                arguments:@{@"application": @(application.hash), @"shortcutItem": @(shortcutItem.hash)}];
    return YES;
}

/**
 * Called if this has been registered for `UIApplicationDelegate` callbacks.
 *
 * @return `YES` if this handles the request.
 */
- (BOOL)application:(UIApplication*)application
handleEventsForBackgroundURLSession:(nonnull NSString*)identifier
  completionHandler:(nonnull void (^)(void))completionHandler {
    FlutterMethodChannel* channel = [FlutterMethodChannel methodChannelWithName:_channelName binaryMessenger:[_registrar messenger]];
    [channel invokeMethod:@"applicationHandleEventsForBackgroundURLSessionCompletionHandler"
                arguments:@{@"application": @(application.hash), @"identifier": identifier}];
    return YES;
}

/**
 * Called if this has been registered for `UIApplicationDelegate` callbacks.
 *
 * @return `YES` if this handles the request.
 */
- (BOOL)application:(UIApplication*)application
performFetchWithCompletionHandler:(void (^)(UIBackgroundFetchResult result))completionHandler {
    FlutterMethodChannel* channel = [FlutterMethodChannel methodChannelWithName:_channelName binaryMessenger:[_registrar messenger]];
    [channel invokeMethod:@"applicationPerformFetchWithCompletionHandler"
                arguments:@{@"application": @(application.hash)}];
    return YES;
}

/**
 * Called if this has been registered for `UIApplicationDelegate` callbacks.
 *
 * @return `YES` if this handles the request.
 */
- (BOOL)application:(UIApplication*)application
continueUserActivity:(NSUserActivity*)userActivity
 restorationHandler:(void (^)(NSArray*))restorationHandler {
    FlutterMethodChannel* channel = [FlutterMethodChannel methodChannelWithName:_channelName binaryMessenger:[_registrar messenger]];
    [channel invokeMethod:@"applicationContinueUserActivityRestorationHandler"
                arguments:@{@"application": @(application.hash), @"userActivity": @(userActivity.hash)}];
    return YES;
}

@end
