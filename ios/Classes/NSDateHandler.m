//
//  NSDateHandler.m
//  foundation_fluttify
//
//  Created by Yohom Bao on 2020/11/9.
//

#import "NSDateHandler.h"

extern BOOL enableLog;

void NSDateHandler(NSString* method, id rawArgs, FlutterResult methodResult) {
    if ([@"NSDate::get_timeIntervalSince1970" isEqualToString:method]) {
        NSDictionary<NSString*, id>* args = (NSDictionary<NSString*, id>*) rawArgs;
        
        NSDate *target = (NSDate *) args[@"__this__"];
        if (target != nil && (NSNull*) target != [NSNull null]) {
            methodResult(@(target.timeIntervalSince1970));
        } else {
            methodResult([FlutterError errorWithCode:@"目标对象为nul"
                                             message:@"目标对象为nul"
                                             details:@"目标对象为nul"]);
        }
    } else {
        methodResult(FlutterMethodNotImplemented);
    }
}
