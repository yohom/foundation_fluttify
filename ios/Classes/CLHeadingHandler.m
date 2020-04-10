//
//  CLHeadingHandler.m
//  foundation_fluttify
//
//  Created by Yohom Bao on 2019/12/11.
//

#import "CLHeadingHandler.h"
#import <CoreLocation/CoreLocation.h>

extern NSMutableDictionary<NSString *, NSObject *> *STACK;
extern NSMutableDictionary<NSNumber *, NSObject *> *HEAP;
extern BOOL enableLog;

void CLHeadingHandler(NSString* method, id rawArgs, FlutterResult methodResult){
    if ([@"CLHeading::getMagneticHeading" isEqualToString:method]) {
        NSDictionary<NSString*, id>* args = (NSDictionary<NSString*, id>*) rawArgs;
        
        NSNumber *refId = (NSNumber *) args[@"refId"];
        
        CLHeading *target = (CLHeading *) HEAP[refId];
        
        CLLocationDirection magneticHeading = [target magneticHeading];
        
        methodResult(@(magneticHeading));
    } if ([@"CLHeading::getTrueHeading" isEqualToString:method]) {
        NSDictionary<NSString*, id>* args = (NSDictionary<NSString*, id>*) rawArgs;
        
        NSNumber *refId = (NSNumber *) args[@"refId"];
        
        CLHeading *target = (CLHeading *) HEAP[refId];
        
        CLLocationDirection trueHeading = [target trueHeading];
        
        methodResult(@(trueHeading));
    } if ([@"CLHeading::getHeadingAccuracy" isEqualToString:method]) {
        NSDictionary<NSString*, id>* args = (NSDictionary<NSString*, id>*) rawArgs;
        
        NSNumber *refId = (NSNumber *) args[@"refId"];
        
        CLHeading *target = (CLHeading *) HEAP[refId];
        
        CLLocationDirection headingAccuracy = [target headingAccuracy];
        
        methodResult(@(headingAccuracy));
    } else {
        methodResult(FlutterMethodNotImplemented);
    }
}
