#import "FoundationFluttifyPlugin.h"
#import <CoreLocation/CoreLocation.h>

// The stack that exists on the Dart side for a method call is enabled only when the MethodChannel passing parameters are limited
NSMutableDictionary<NSString*, NSObject*>* STACK;
// Container for Dart side random access objects
NSMutableDictionary<NSNumber*, NSObject*>* HEAP;
// whether enable log or not
BOOL enableLog;

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
  // toggle log
  if ([@"PlatformService::enableLog" isEqualToString:methodCall.method]) {
    enableLog = [args[@"enable"] boolValue];
    methodResult(@"success");
  }
  // 创建CLLocationCoordinate2D
  else if ([@"PlatformFactory::createCLLocationCoordinate2D" isEqualToString:methodCall.method]) {
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
  // 创建UIColor
  else if ([@"PlatformFactory::createUIColor" isEqualToString:methodCall.method]) {
    NSNumber* colorValue = (NSNumber*) args[@"colorValue"];
    CGFloat alpha = (0xff000000 & [colorValue integerValue]) >> 24;
    CGFloat red = (0x00ff0000 & [colorValue integerValue]) >> 16;
    CGFloat green = (0x0000ff00 & [colorValue integerValue]) >> 8;
    CGFloat blue = (0x000000ff & [colorValue integerValue]) >> 0;
      
    UIColor* color = [UIColor colorWithRed:red / 0xFF green:green / 0xFF blue:blue / 0xFF alpha:alpha / 0xFF];

    HEAP[@(color.hash)] = color;

    methodResult(@(color.hash));
  }
  // 释放一个对象
  else if ([@"PlatformFactory::release" isEqualToString:methodCall.method]) {
    NSNumber* refId = (NSNumber *) args[@"refId"];

    NSLog(@"PlatformFactory::释放对象: %@@%@", NSStringFromClass([HEAP[refId] class]), refId);

    [HEAP removeObjectForKey:refId];
    methodResult(@"success");

    if (enableLog) NSLog(@"HEAP: %@", HEAP);
  }
  // 清空堆
  else if ([@"PlatformFactory::clearHeap" isEqualToString:methodCall.method]) {
    NSLog(@"PlatformFactory::清空堆");

    [HEAP removeAllObjects];
    methodResult(@"success");

    if (enableLog) NSLog(@"HEAP: %@", HEAP);
  }
  // 压入栈
  else if ([@"PlatformFactory::pushStack" isEqualToString:methodCall.method]) {
    NSString* name = (NSString*) args[@"name"];
    NSNumber* refId = (NSNumber*) args[@"refId"];

    // todo release去掉日志
    NSLog(@"PlatformFactory::压入栈 %@@%@", NSStringFromClass([HEAP[refId] class]), refId);

    STACK[name] = HEAP[refId];

    methodResult(@"success");

    if (enableLog) NSLog(@"STACK: %@", STACK);
  }
  // 压入栈 jsonable
  else if ([@"PlatformFactory::pushStackJsonable" isEqualToString:methodCall.method]) {
    NSString* name = (NSString*) args[@"name"];
    NSObject* data = (NSObject*) args[@"data"];

    // todo release去掉日志
    NSLog(@"PlatformFactory::压入栈 %@", data);

    STACK[name] = data;

    methodResult(@"success");

    if (enableLog) NSLog(@"STACK: %@", STACK);
  }
  // 清空栈
  else if ([@"PlatformFactory::clearStack" isEqualToString:methodCall.method]) {
    NSLog(@"PlatformFactory::清空栈");

    [STACK removeAllObjects];
    methodResult(@"success");

    if (enableLog) NSLog(@"STACK: %@", STACK);
  }
  // 通过反射调用方法
  else if ([@"Ref::performSelectorWithObject" isEqualToString:methodCall.method]) {
    NSNumber* refId = (NSNumber*) args[@"refId"];
    NSString* selector = (NSString*) args[@"selector"];
    NSObject* object = (NSObject*) args[@"object"];

    NSObject* target = (NSObject*) HEAP[refId];

    [target performSelector: NSSelectorFromString(selector) withObject: object];

    methodResult(@"success");
  }
  // CLLocationManager::requestAlwaysAuthorization
  else if ([@"CLLocationManager::requestAlwaysAuthorization" isEqualToString:methodCall.method]) {
    NSNumber* refId = (NSNumber*) args[@"refId"];

    CLLocationManager* target = (CLLocationManager*) HEAP[refId];

    [target requestAlwaysAuthorization];

    methodResult(@"success");
  }
  // CLLocationManager::requestAlwaysAuthorization
  else if ([@"CLLocationManager::requestWhenInUseAuthorization" isEqualToString:methodCall.method]) {
    NSNumber* refId = (NSNumber*) args[@"refId"];

    CLLocationManager* target = (CLLocationManager*) HEAP[refId];

    [target requestWhenInUseAuthorization];

    methodResult(@"success");
  }
  // UIImage::getData
  else if ([@"UIImage::getData" isEqualToString:methodCall.method]) {
    NSNumber* refId = (NSNumber*) args[@"refId"];

    UIImage* target = (UIImage*) HEAP[refId];
    NSData *data = UIImageJPEGRepresentation(target, 100);
    methodResult([FlutterStandardTypedData typedDataWithBytes:data]);
  }
  // UIImage::getFrame
  else if ([@"UIView::getFrame" isEqualToString:methodCall.method]) {
    NSNumber* refId = (NSNumber*) args[@"refId"];

    UIView* target = (UIView*) HEAP[refId];
      
    CGRect rect = [target frame];
    NSValue* dataValue = [NSValue value:&rect withObjCType:@encode(CGRect)];
      
    HEAP[@(dataValue.hash)] = dataValue;
      
    methodResult(@(dataValue.hash));
  } else {
    methodResult(FlutterMethodNotImplemented);
  }
}

@end
