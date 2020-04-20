//
//  CGRectHandler.m
//  foundation_fluttify
//
//  Created by Yohom Bao on 2020/4/20.
//

#import "CGRectHandler.h"

extern NSMutableDictionary<NSString *, NSObject *> *STACK;
extern NSMutableDictionary<NSNumber *, NSObject *> *HEAP;
extern BOOL enableLog;

void CGRectHandler(NSString* method, id rawArgs, FlutterResult methodResult) {
    if ([@"CGRect::create" isEqualToString:method]) {
        NSDictionary<NSString*, id>* args = (NSDictionary<NSString*, id>*) rawArgs;
        
        CGFloat x = [(NSNumber*) args[@"x"] floatValue];
        CGFloat y = [(NSNumber*) args[@"y"] floatValue];
        CGFloat width = [(NSNumber*) args[@"width"] floatValue];
        CGFloat height = [(NSNumber*) args[@"height"] floatValue];
        
        CGRect rect = CGRectMake(x, y, width, height);
        
        NSValue* result = [NSValue valueWithCGRect:rect];
        
        HEAP[@(result.hash)] = result;
        
        methodResult(@(result.hash));
    } else {
        methodResult(FlutterMethodNotImplemented);
    }
}

