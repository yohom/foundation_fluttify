//
//  CGSizeHandler.m
//  foundation_fluttify
//
//  Created by Yohom Bao on 2020/6/22.
//

#import "CGSizeHandler.h"

extern BOOL enableLog;

void CGSizeHandler(NSString* method, id rawArgs, FlutterResult methodResult) {
    if ([@"CGSize::create" isEqualToString:method]) {
        NSDictionary<NSString*, id>* args = (NSDictionary<NSString*, id>*) rawArgs;
        
        CGFloat width = [(NSNumber*) args[@"width"] floatValue];
        CGFloat height = [(NSNumber*) args[@"height"] floatValue];
        
        CGSize rect = CGSizeMake(width, height);
        
        NSValue* result = [NSValue valueWithCGSize:rect];
        
        methodResult(result);
    } else if ([@"CGSize::getWidth" isEqualToString:method]) {
        NSDictionary<NSString*, id>* args = (NSDictionary<NSString*, id>*) rawArgs;

        NSValue *__this__ = (NSValue *) args[@"__this__"];
        if (__this__ != nil && (NSNull*) __this__ != [NSNull null]) {
            CGSize cgSize = __this__.CGSizeValue;
            methodResult(@(cgSize.width));
        } else {
            methodResult([FlutterError errorWithCode:@"目标对象为nul"
                                             message:@"目标对象为nul"
                                             details:@"目标对象为nul"]);
        }
    } else if ([@"CGSize::getHeight" isEqualToString:method]) {
        NSDictionary<NSString*, id>* args = (NSDictionary<NSString*, id>*) rawArgs;

        NSValue *__this__ = (NSValue *) args[@"__this__"];
        if (__this__ != nil && (NSNull*) __this__ != [NSNull null]) {
            CGSize cgSize = __this__.CGSizeValue;
            methodResult(@(cgSize.height));
        } else {
            methodResult([FlutterError errorWithCode:@"目标对象为nul"
                                             message:@"目标对象为nul"
                                             details:@"目标对象为nul"]);
        }
    } else {
        methodResult(FlutterMethodNotImplemented);
    }
}

