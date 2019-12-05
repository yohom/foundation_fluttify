#import "FoundationFluttifyPlugin.h"
#import "PlatformFactoryHandler.h"
#import "CLLocationCoordinate2DHandler.h"
#import "CLLocationHandler.h"
#import "CLFloorHandler.h"
#import "CLLocationManagerHandler.h"
#import "UIImageHandler.h"
#import "UIViewHandler.h"
#import "CGPointHandler.h"
#import "NSDataHandler.h"
#import "UIEdgeInsetsHandler.h"

// The stack that exists on the Dart side for a method call is enabled only when the MethodChannel passing parameters are limited
NSMutableDictionary<NSString *, NSObject *> *STACK;
// Container for Dart side random access objects
NSMutableDictionary<NSNumber *, NSObject *> *HEAP;
// whether enable log or not
BOOL enableLog;

@implementation FoundationFluttifyPlugin {
  NSObject <FlutterPluginRegistrar> *_registrar;
}

+ (void)registerWithRegistrar:(NSObject <FlutterPluginRegistrar> *)registrar {
  // 栈容器
  STACK = @{}.mutableCopy;
  // 堆容器
  HEAP = @{}.mutableCopy;

  FlutterMethodChannel *channel = [FlutterMethodChannel
      methodChannelWithName:@"com.fluttify/foundation"
            binaryMessenger:[registrar messenger]];
  FoundationFluttifyPlugin *instance = [[FoundationFluttifyPlugin alloc] initWithRegistrar:registrar];
  [registrar addMethodCallDelegate:instance channel:channel];
}

- (instancetype)initWithRegistrar:(NSObject <FlutterPluginRegistrar> *)registrar {
  self = [super init];
  if (self) {
    _registrar = registrar;
  }
  return self;
}

- (void)handleMethodCall:(FlutterMethodCall *)methodCall result:(FlutterResult)methodResult {
  NSDictionary<NSString *, id> *args = (NSDictionary<NSString*, id> *) [methodCall arguments];
  if ([methodCall.method hasPrefix:@"CLLocationCoordinate2D"]) {
    [[CLLocationCoordinate2DHandler alloc] initWith:methodCall.method :args :methodResult];
  } else if ([methodCall.method hasPrefix:@"CLLocation"]) {
    [[CLLocationHandler alloc] initWith:methodCall.method :args :methodResult];
  } else if ([methodCall.method hasPrefix:@"CLFloor"]) {
    [[CLFloorHandler alloc] initWith:methodCall.method :args :methodResult];
  } else if ([methodCall.method hasPrefix:@"CLLocationManager"]) {
    [[CLLocationManagerHandler alloc] initWith:methodCall.method :args :methodResult];
  } else if ([methodCall.method hasPrefix:@"UIImage"]) {
    [[UIImageHandler alloc] initWith:methodCall.method :args :methodResult];
  } else if ([methodCall.method hasPrefix:@"UIView"]) {
    [[UIViewHandler alloc] initWith:methodCall.method :args :methodResult];
  } else if ([methodCall.method hasPrefix:@"CGPoint"]) {
    [[CGPointHandler alloc] initWith:methodCall.method :args :methodResult];
  } else if ([methodCall.method hasPrefix:@"NSData"]) {
    [[NSDataHandler alloc] initWith:methodCall.method :args :methodResult];
  } else if ([methodCall.method hasPrefix:@"UIEdgeInsets"]) {
    [[UIEdgeInsetsHandler alloc] initWith:methodCall.method :args :methodResult];
  } else if ([methodCall.method hasPrefix:@"Platform"]) {
    [[PlatformFactoryHandler alloc] initWith:methodCall.method :args :methodResult :self->_registrar];
  } else {
    methodResult(FlutterMethodNotImplemented);
  }
}

@end
