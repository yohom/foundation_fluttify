//
//  NSErrorHandler.m
//  foundation_fluttify
//
//  Created by Yohom Bao on 2020/4/5.
//

#import "NSErrorHandler.h"

extern BOOL enableLog;

void NSErrorHandler(NSString* method, id rawArgs, FlutterResult methodResult) {
    if ([@"NSError::getCode" isEqualToString:method]) {
        NSDictionary<NSString*, id>* args = (NSDictionary<NSString*, id>*) rawArgs;
        
        NSError *target = (NSError *) args[@"__this__"];
        if (target != nil && (NSNull*) target != [NSNull null]) {
            methodResult(@(target.code));
        } else {
            methodResult([FlutterError errorWithCode:@"目标对象为nul"
                                             message:@"目标对象为nul"
                                             details:@"目标对象为nul"]);
        }
    } else if ([@"NSError::getDescription" isEqualToString:method]) {
        NSDictionary<NSString*, id>* args = (NSDictionary<NSString*, id>*) rawArgs;
        
        NSError *target = (NSError *) args[@"__this__"];
        if (target != nil && (NSNull*) target != [NSNull null]) {
            methodResult(target.description);
        } else {
            methodResult([FlutterError errorWithCode:@"目标对象为nul"
                                             message:@"目标对象为nul"
                                             details:@"目标对象为nul"]);
        }
    } else {
        methodResult(FlutterMethodNotImplemented);
    }
}

