#import "FoundationFluttifyPlugin.h"
#import <CoreLocation/CoreLocation.h>

// Dart端一次方法调用所存在的栈, 只有当MethodChannel传递参数受限时, 再启用这个容器
NSMutableDictionary<NSString*, NSObject*>* STACK;
// Dart端随机存取对象的容器
NSMutableDictionary<NSNumber*, NSObject*>* HEAP;

@implementation FoundationFluttifyPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  // 栈容器
  STACK = @{}.mutableCopy;
  // 堆容器
  HEAP = @{}.mutableCopy;
    
  FlutterMethodChannel* channel = [FlutterMethodChannel
      methodChannelWithName:@"com.fluttify/foundation"
            binaryMessenger:[registrar messenger]];
  FoundationFluttifyPlugin* instance = [[FoundationFluttifyPlugin alloc] init];
  [registrar addMethodCallDelegate:instance channel:channel];
}

- (void)handleMethodCall:(FlutterMethodCall*)methodCall result:(FlutterResult)methodResult {
  NSDictionary<NSString *, id> *args = (NSDictionary<NSString *, id> *) [methodCall arguments];
  // 创建CLLocationCoordinate2D
  if ([@"PlatformFactory::createCLLocationCoordinate2D" isEqualToString:methodCall.method]) {
    CLLocationDegrees latitude = [args[@"latitude"] doubleValue];
    CLLocationDegrees longitude = [args[@"longitude"] doubleValue];

    CLLocationCoordinate2D data = CLLocationCoordinate2DMake(latitude, longitude);

    NSValue* dataValue = [NSValue value:&data withObjCType:@encode(CLLocationCoordinate2D)];
    HEAP[@(dataValue.hash)] = dataValue;

    methodResult(@(dataValue.hash));
  }
  // CLLocationCoordinate2D获取latitude
  else if ([@"CLLocationCoordinate2D::get_latitude" isEqualToString:methodCall.method]) {
    NSNumber* refId = (NSNumber*) args[@"refId"];

    NSValue* dataValue = (NSValue*) HEAP[refId];

    CLLocationCoordinate2D _structValue;
    [dataValue getValue:&_structValue];

    methodResult(@(_structValue.latitude));
  }
  // CLLocationCoordinate2D获取longitude
  else if ([@"CLLocationCoordinate2D::get_longitude" isEqualToString:methodCall.method]) {
    NSNumber* refId = (NSNumber*) args[@"refId"];

    NSValue* dataValue = (NSValue*) HEAP[refId];

    CLLocationCoordinate2D _structValue;
    [dataValue getValue:&_structValue];

    methodResult(@(_structValue.longitude));
  }
  // CLLocation获取coordinate
  else if ([@"CLLocation::get_coordinate" isEqualToString:methodCall.method]) {
    NSNumber* refId = (NSNumber*) args[@"refId"];

    CLLocation* location = (CLLocation*) HEAP[refId];

    CLLocationCoordinate2D data = location.coordinate;

    NSValue* dataValue = [NSValue value:&data withObjCType:@encode(CLLocationCoordinate2D)];
    HEAP[@(dataValue.hash)] = dataValue;

    methodResult(@(dataValue.hash));
  }
  // CLLocation获取altitude
  else if ([@"CLLocation::get_altitude" isEqualToString:methodCall.method]) {
    NSNumber* refId = (NSNumber*) args[@"refId"];

    CLLocation* location = (CLLocation*) HEAP[refId];

    methodResult(@(location.altitude));
  }
  // CLLocation获取horizontalAccuracy
  else if ([@"CLLocation::get_horizontalAccuracy" isEqualToString:methodCall.method]) {
    NSNumber* refId = (NSNumber*) args[@"refId"];

    CLLocation* location = (CLLocation*) HEAP[refId];

    methodResult(@(location.horizontalAccuracy));
  }
  // CLLocation获取verticalAccuracy
  else if ([@"CLLocation::get_verticalAccuracy" isEqualToString:methodCall.method]) {
    NSNumber* refId = (NSNumber*) args[@"refId"];

    CLLocation* location = (CLLocation*) HEAP[refId];

    methodResult(@(location.verticalAccuracy));
  }
  // CLLocation获取course
  else if ([@"CLLocation::get_course" isEqualToString:methodCall.method]) {
    NSNumber* refId = (NSNumber*) args[@"refId"];

    CLLocation* location = (CLLocation*) HEAP[refId];

    methodResult(@(location.course));
  }
  // CLLocation获取speed
  else if ([@"CLLocation::get_speed" isEqualToString:methodCall.method]) {
    NSNumber* refId = (NSNumber*) args[@"refId"];

    CLLocation* location = (CLLocation*) HEAP[refId];

    methodResult(@(location.speed));
  }
  // CLLocation获取floor
  else if ([@"CLLocation::get_floor" isEqualToString:methodCall.method]) {
    NSNumber* refId = (NSNumber*) args[@"refId"];

    CLLocation* location = (CLLocation*) HEAP[refId];
    CLFloor* floor = location.floor;

    HEAP[@(floor.hash)] = floor;

    methodResult(@(floor.hash));
  }
  // CLFloor获取level
  else if ([@"CLFloor::get_level" isEqualToString:methodCall.method]) {
    NSNumber* refId = (NSNumber*) args[@"refId"];

    CLFloor* floor = (CLFloor*) HEAP[refId];

    methodResult(@(floor.level));
  }
  // 创建UIImage
  else if ([@"PlatformFactory::createUIImage" isEqualToString:methodCall.method]) {
    FlutterStandardTypedData* bitmapBytes = (FlutterStandardTypedData*) args[@"bitmapBytes"];

    UIImage* bitmap = [UIImage imageWithData:bitmapBytes.data];

    HEAP[@(bitmap.hash)] = bitmap;

    methodResult(@(bitmap.hash));
  }
  // 释放一个对象
  else if ([@"PlatformFactory::release" isEqualToString:methodCall.method]) {
    NSNumber* refId = (NSNumber *) args[@"refId"];

    NSLog(@"PlatformFactory::释放对象: %@@%@", NSStringFromClass([HEAP[refId] class]), refId);

    [HEAP removeObjectForKey:refId];
    methodResult(@"success");

    NSLog(@"HEAP: %@", HEAP);
  }
  // 清空堆
  else if ([@"PlatformFactory::clearHeap" isEqualToString:methodCall.method]) {
    NSLog(@"PlatformFactory::清空堆");

    [HEAP removeAllObjects];
    methodResult(@"success");

    NSLog(@"HEAP: %@", HEAP);
  }
  // 压入栈
  else if ([@"PlatformFactory::pushStack" isEqualToString:methodCall.method]) {
    NSString* name = (NSString*) args[@"name"];
    NSNumber* refId = (NSNumber*) args[@"refId"];

    // todo release去掉日志
    NSLog(@"PlatformFactory::压入栈 %@@%@", NSStringFromClass([HEAP[refId] class]), refId);

    STACK[name] = HEAP[refId];

    methodResult(@"success");

    NSLog(@"STACK: %@", STACK);
  }
  // 压入栈 jsonable
  else if ([@"PlatformFactory::pushStackJsonable" isEqualToString:methodCall.method]) {
    NSString* name = (NSString*) args[@"name"];
    NSObject* data = (NSObject*) args[@"data"];

    // todo release去掉日志
    NSLog(@"PlatformFactory::压入栈 %@", data);

    STACK[name] = data;

    methodResult(@"success");

    NSLog(@"STACK: %@", STACK);
  }
  // 清空栈
  else if ([@"PlatformFactory::clearStack" isEqualToString:methodCall.method]) {
    NSLog(@"PlatformFactory::清空栈");

    [STACK removeAllObjects];
    methodResult(@"success");

    NSLog(@"STACK: %@", STACK);
  }
  // 通过反射调用方法
  else if ([@"Ref::performSelectorWithObject" isEqualToString:methodCall.method]) {
    NSNumber* refId = (NSNumber*) args[@"refId"];
    NSString* selector = (NSString*) args[@"selector"];
    NSObject* object = (NSObject*) args[@"object"];

    NSObject* target = (NSObject*) HEAP[refId];

    [target performSelector: NSSelectorFromString(selector) withObject: object];

    methodResult(@"success");
  } else {
    methodResult(FlutterMethodNotImplemented);
  }
}

@end
