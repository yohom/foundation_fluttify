//
// Created by Yohom Bao on 2019/11/22.
//

#import <CoreLocation/CoreLocation.h>
#import "CLLocationCoordinate2DHandler.h"

extern NSMutableDictionary<NSString *, NSObject *> *STACK;
extern NSMutableDictionary<NSNumber *, NSObject *> *HEAP;
extern BOOL enableLog;

@implementation CLLocationCoordinate2DHandler

- (instancetype)initWith:(NSString *)method :(NSDictionary *)args :(FlutterResult)methodResult {
  self = [super init];
  if (self) {
    // CLLocationCoordinate2D获取latitude
    if ([@"CLLocationCoordinate2D::get_latitude" isEqualToString:method]) {
      NSNumber *refId = (NSNumber *) args[@"refId"];

      NSValue *dataValue = (NSValue *) HEAP[refId];

      CLLocationCoordinate2D _structValue;
      [dataValue getValue:&_structValue];

      methodResult(@(_structValue.latitude));
    }
      // CLLocationCoordinate2D获取longitude
    else if ([@"CLLocationCoordinate2D::get_longitude" isEqualToString:method]) {
      NSNumber *refId = (NSNumber *) args[@"refId"];

      NSValue *dataValue = (NSValue *) HEAP[refId];

      CLLocationCoordinate2D _structValue;
      [dataValue getValue:&_structValue];

      methodResult(@(_structValue.longitude));
    } else {
      methodResult(FlutterMethodNotImplemented);
    }
  }
  return self;
}

@end