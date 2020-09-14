//
//  NSObjectHandler.m
//  FMDB
//
//  Created by Yohom Bao on 2020/9/14.
//

#import "NSObjectHandler.h"

extern BOOL enableLog;

void NSObjectHandler(NSString* method, id rawArgs, FlutterResult methodResult) {
    if ([@"NSObject::init" isEqualToString:method]) {
        NSDictionary<NSString*, id>* args = (NSDictionary<NSString*, id>*) rawArgs;
        
        NSObject *__this__ = (NSObject *) args[@"__this__"];
        
        NSObject *target = [__this__ init];

        methodResult(target);
    } else if ([@"NSObject::init_batch" isEqualToString:method]) {
        NSDictionary<NSString*, id>* args = (NSDictionary<NSString*, id>*) rawArgs;
        
        NSObject *__this__ = (NSObject *) args[@"__this__"];
        
        NSObject *target = [__this__ init];

        methodResult(target);
    } else {
        methodResult(FlutterMethodNotImplemented);
    }
}
