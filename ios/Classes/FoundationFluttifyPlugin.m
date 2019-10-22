#import "FoundationFluttifyPlugin.h"
#import <CoreLocation/CoreLocation.h>

// Dart端随机存取对象的容器
NSMutableDictionary<NSNumber*, NSObject*>* HEAP_Platform;

@implementation FoundationFluttifyPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  // 堆容器
  HEAP_Platform = @{}.mutableCopy;
    
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
    HEAP_Platform[@(dataValue.hash)] = dataValue;

    methodResult(@(dataValue.hash));
  }
  // CLLocationCoordinate2D获取latitude
  else if ([@"CLLocationCoordinate2D::get_latitude" isEqualToString:methodCall.method]) {
    NSNumber* refId = (NSNumber*) args[@"refId"];

    NSValue* dataValue = (NSValue*) HEAP_Platform[refId];

    CLLocationCoordinate2D _structValue;
    [dataValue getValue:&_structValue];

    methodResult(@(_structValue.latitude));
  }
  // CLLocationCoordinate2D获取longitude
  else if ([@"CLLocationCoordinate2D::get_longitude" isEqualToString:methodCall.method]) {
    NSNumber* refId = (NSNumber*) args[@"refId"];

    NSValue* dataValue = (NSValue*) HEAP_Platform[refId];

    CLLocationCoordinate2D _structValue;
    [dataValue getValue:&_structValue];

    methodResult(@(_structValue.longitude));
  }
  // CLLocation获取coordinate
  else if ([@"CLLocation::get_coordinate" isEqualToString:methodCall.method]) {
    NSNumber* refId = (NSNumber*) args[@"refId"];

    CLLocation* location = (CLLocation*) HEAP_Platform[refId];

    CLLocationCoordinate2D data = location.coordinate;

    NSValue* dataValue = [NSValue value:&data withObjCType:@encode(CLLocationCoordinate2D)];
    HEAP_Platform[@(dataValue.hash)] = dataValue;

    methodResult(@(dataValue.hash));
  }
  // CLLocation获取altitude
  else if ([@"CLLocation::get_altitude" isEqualToString:methodCall.method]) {
    NSNumber* refId = (NSNumber*) args[@"refId"];

    CLLocation* location = (CLLocation*) HEAP_Platform[refId];

    methodResult(@(location.altitude));
  }
  // CLLocation获取horizontalAccuracy
  else if ([@"CLLocation::get_horizontalAccuracy" isEqualToString:methodCall.method]) {
    NSNumber* refId = (NSNumber*) args[@"refId"];

    CLLocation* location = (CLLocation*) HEAP_Platform[refId];

    methodResult(@(location.horizontalAccuracy));
  }
  // CLLocation获取verticalAccuracy
  else if ([@"CLLocation::get_verticalAccuracy" isEqualToString:methodCall.method]) {
    NSNumber* refId = (NSNumber*) args[@"refId"];

    CLLocation* location = (CLLocation*) HEAP_Platform[refId];

    methodResult(@(location.verticalAccuracy));
  }
  // CLLocation获取course
  else if ([@"CLLocation::get_course" isEqualToString:methodCall.method]) {
    NSNumber* refId = (NSNumber*) args[@"refId"];

    CLLocation* location = (CLLocation*) HEAP_Platform[refId];

    methodResult(@(location.course));
  }
  // CLLocation获取speed
  else if ([@"CLLocation::get_speed" isEqualToString:methodCall.method]) {
    NSNumber* refId = (NSNumber*) args[@"refId"];

    CLLocation* location = (CLLocation*) HEAP_Platform[refId];

    methodResult(@(location.speed));
  }
  // CLLocation获取floor
  else if ([@"CLLocation::get_floor" isEqualToString:methodCall.method]) {
    NSNumber* refId = (NSNumber*) args[@"refId"];

    CLLocation* location = (CLLocation*) HEAP_Platform[refId];
    CLFloor* floor = location.floor;

    HEAP_Platform[@(floor.hash)] = floor;

    methodResult(@(floor.hash));
  }
  // CLFloor获取level
  else if ([@"CLFloor::get_level" isEqualToString:methodCall.method]) {
    NSNumber* refId = (NSNumber*) args[@"refId"];

    CLFloor* floor = (CLFloor*) HEAP_Platform[refId];

    methodResult(@(floor.level));
  }
  // 创建UIImage
  else if ([@"PlatformFactory::createUIImage" isEqualToString:methodCall.method]) {
    FlutterStandardTypedData* bitmapBytes = (FlutterStandardTypedData*) args[@"bitmapBytes"];

    UIImage* bitmap = [UIImage imageWithData:bitmapBytes.data];

    HEAP_Platform[@(bitmap.hash)] = bitmap;

    methodResult(@(bitmap.hash));
  } else {
    methodResult(FlutterMethodNotImplemented);
  }
}

@end
