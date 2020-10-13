//
//  CGRectHandler.m
//  foundation_fluttify
//
//  Created by Yohom Bao on 2020/4/20.
//

#import "CGRectHandler.h"

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
        
        methodResult(result);
    } else if ([@"CGRect::getX" isEqualToString:method]) {
        NSDictionary<NSString*, id>* args = (NSDictionary<NSString*, id>*) rawArgs;
        
        NSValue *value = (NSValue *) args[@"__this__"];
        if (value != nil && (NSNull*) value != [NSNull null]) {
            CGRect cgRect = value.CGRectValue;
            methodResult(@(cgRect.origin.x));
        } else {
            methodResult([FlutterError errorWithCode:@"目标对象为nul"
                                             message:@"目标对象为nul"
                                             details:@"目标对象为nul"]);
        }
    } else if ([@"CGRect::getY" isEqualToString:method]) {
        NSDictionary<NSString*, id>* args = (NSDictionary<NSString*, id>*) rawArgs;
        
        NSValue *value = (NSValue *) args[@"__this__"];
        if (value != nil && (NSNull*) value != [NSNull null]) {
            CGRect cgRect = value.CGRectValue;
            methodResult(@(cgRect.origin.y));
        } else {
            methodResult([FlutterError errorWithCode:@"目标对象为nul"
                                             message:@"目标对象为nul"
                                             details:@"目标对象为nul"]);
        }
    } else if ([@"CGRect::getWidth" isEqualToString:method]) {
        NSDictionary<NSString*, id>* args = (NSDictionary<NSString*, id>*) rawArgs;
        
        NSValue *value = (NSValue *) args[@"__this__"];
        if (value != nil && (NSNull*) value != [NSNull null]) {
            CGRect cgRect = value.CGRectValue;
            methodResult(@(cgRect.size.width));
        } else {
            methodResult([FlutterError errorWithCode:@"目标对象为nul"
                                             message:@"目标对象为nul"
                                             details:@"目标对象为nul"]);
        }
    } else if ([@"CGRect::getHeight" isEqualToString:method]) {
        NSDictionary<NSString*, id>* args = (NSDictionary<NSString*, id>*) rawArgs;
        
        NSValue *value = (NSValue *) args[@"__this__"];
        if (value != nil && (NSNull*) value != [NSNull null]) {
            CGRect cgRect = value.CGRectValue;
            methodResult(@(cgRect.size.height));
        } else {
            methodResult([FlutterError errorWithCode:@"目标对象为nul"
                                             message:@"目标对象为nul"
                                             details:@"目标对象为nul"]);
        }
    } else {
        methodResult(FlutterMethodNotImplemented);
    }
}

