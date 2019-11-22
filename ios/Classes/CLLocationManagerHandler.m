//
// Created by Yohom Bao on 2019/11/22.
//

#import <CoreLocation/CoreLocation.h>
#import "CLLocationManagerHandler.h"

extern NSMutableDictionary<NSString *, NSObject *> *STACK;
extern NSMutableDictionary<NSNumber *, NSObject *> *HEAP;
extern BOOL enableLog;

@implementation CLLocationManagerHandler
- (instancetype)initWith:(NSString *)method :(NSDictionary *)args :(FlutterResult)methodResult {
  self = [super init];
  if (self) {
    // CLLocationManager::requestAlwaysAuthorization
    if ([@"CLLocationManager::requestAlwaysAuthorization" isEqualToString:method]) {
      NSNumber *refId = (NSNumber *) args[@"refId"];

      CLLocationManager *target = (CLLocationManager *) HEAP[refId];

      [target requestAlwaysAuthorization];

      methodResult(@"success");
    }
      // CLLocationManager::requestAlwaysAuthorization
    else if ([@"CLLocationManager::requestWhenInUseAuthorization" isEqualToString:method]) {
      NSNumber *refId = (NSNumber *) args[@"refId"];

      CLLocationManager *target = (CLLocationManager *) HEAP[refId];

      [target requestWhenInUseAuthorization];

      methodResult(@"success");
    }
  }

  return self;
}

@end