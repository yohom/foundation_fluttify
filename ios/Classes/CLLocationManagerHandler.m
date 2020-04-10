//
// Created by Yohom Bao on 2019/11/22.
//

#import <CoreLocation/CoreLocation.h>
#import "CLLocationManagerHandler.h"

extern NSMutableDictionary<NSString *, NSObject *> *STACK;
extern NSMutableDictionary<NSNumber *, NSObject *> *HEAP;
extern BOOL enableLog;

void CLLocationManagerHandler(NSString* method, id rawArgs, FlutterResult methodResult) {
    // CLLocationManager::requestAlwaysAuthorization
    if ([@"CLLocationManager::requestAlwaysAuthorization" isEqualToString:method]) {
        NSDictionary<NSString*, id>* args = (NSDictionary<NSString*, id>*) rawArgs;
        
        NSNumber *refId = (NSNumber *) args[@"refId"];
        
        CLLocationManager *target = (CLLocationManager *) HEAP[refId];
        
        [target requestAlwaysAuthorization];
        
        methodResult(@"success");
    }
    // CLLocationManager::requestAlwaysAuthorization
    else if ([@"CLLocationManager::requestWhenInUseAuthorization" isEqualToString:method]) {
        NSDictionary<NSString*, id>* args = (NSDictionary<NSString*, id>*) rawArgs;
        
        NSNumber *refId = (NSNumber *) args[@"refId"];
        
        CLLocationManager *target = (CLLocationManager *) HEAP[refId];
        
        [target requestWhenInUseAuthorization];
        
        methodResult(@"success");
    } else {
        methodResult(FlutterMethodNotImplemented);
    }
}
