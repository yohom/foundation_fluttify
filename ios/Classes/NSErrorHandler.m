//
//  NSErrorHandler.m
//  foundation_fluttify
//
//  Created by Yohom Bao on 2020/4/5.
//

#import "NSErrorHandler.h"

extern NSMutableDictionary<NSString *, NSObject *> *STACK;
extern NSMutableDictionary<NSNumber *, NSObject *> *HEAP;
extern BOOL enableLog;

void NSErrorHandler(NSString* method, id rawArgs, FlutterResult methodResult) {
    if ([@"NSError::getCode" isEqualToString:method]) {
        NSDictionary<NSString*, id>* args = (NSDictionary<NSString*, id>*) rawArgs;
        
        NSNumber *refId = (NSNumber *) args[@"refId"];
        
        NSError *target = (NSError *) HEAP[refId];
        
        methodResult(@(target.code));
    } else if ([@"NSError::getDescription" isEqualToString:method]) {
        NSDictionary<NSString*, id>* args = (NSDictionary<NSString*, id>*) rawArgs;
        
        NSNumber *refId = (NSNumber *) args[@"refId"];
        
        NSError *target = (NSError *) HEAP[refId];
        
        methodResult(target.description);
    } else {
        methodResult(FlutterMethodNotImplemented);
    }
}

