//
// Created by Yohom Bao on 2019/12/5.
//

#import "UIEdgeInsetsHandler.h"

extern BOOL enableLog;

void UIEdgeInsetsHandler(NSString* method, id rawArgs, FlutterResult methodResult) {
    if ([@"UIEdgeInsets::getTop" isEqualToString:method]) {
        NSDictionary<NSString*, id>* args = (NSDictionary<NSString*, id>*) rawArgs;
        
        NSValue *target = (NSValue *) args[@"__this__"];
        if (target != nil && (NSNull*) target != [NSNull null]) {
            UIEdgeInsets insets = [target UIEdgeInsetsValue];
            methodResult(@(insets.top));
        } else {
            methodResult([FlutterError errorWithCode:@"目标对象为nul"
                                             message:@"目标对象为nul"
                                             details:@"目标对象为nul"]);
        }
    } else if ([@"UIEdgeInsets::getLeft" isEqualToString:method]) {
        NSDictionary<NSString*, id>* args = (NSDictionary<NSString*, id>*) rawArgs;
        
        NSValue *target = (NSValue *) args[@"__this__"];
        if (target != nil && (NSNull*) target != [NSNull null]) {
            UIEdgeInsets insets = [target UIEdgeInsetsValue];
            methodResult(@(insets.left));
        } else {
            methodResult([FlutterError errorWithCode:@"目标对象为nul"
                                             message:@"目标对象为nul"
                                             details:@"目标对象为nul"]);
        }
    } else if ([@"UIEdgeInsets::getBottom" isEqualToString:method]) {
        NSDictionary<NSString*, id>* args = (NSDictionary<NSString*, id>*) rawArgs;
        
        NSValue *target = (NSValue *) args[@"__this__"];
        if (target != nil && (NSNull*) target != [NSNull null]) {
            UIEdgeInsets insets = [target UIEdgeInsetsValue];
            methodResult(@(insets.bottom));
        } else {
            methodResult([FlutterError errorWithCode:@"目标对象为nul"
                                             message:@"目标对象为nul"
                                             details:@"目标对象为nul"]);
        }
    } else if ([@"UIEdgeInsets::getRight" isEqualToString:method]) {
        NSDictionary<NSString*, id>* args = (NSDictionary<NSString*, id>*) rawArgs;
        
        NSValue *target = (NSValue *) args[@"__this__"];
        if (target != nil && (NSNull*) target != [NSNull null]) {
            UIEdgeInsets insets = [target UIEdgeInsetsValue];
            methodResult(@(insets.right));
        } else {
            methodResult([FlutterError errorWithCode:@"目标对象为nul"
                                             message:@"目标对象为nul"
                                             details:@"目标对象为nul"]);
        }
    } else if ([@"UIEdgeInsets::create" isEqualToString:method]) {
        NSDictionary<NSString*, id>* args = (NSDictionary<NSString*, id>*) rawArgs;
        
        NSNumber *top = (NSNumber *) args[@"top"];
        NSNumber *left = (NSNumber *) args[@"left"];
        NSNumber *bottom = (NSNumber *) args[@"bottom"];
        NSNumber *right = (NSNumber *) args[@"right"];
        
        UIEdgeInsets insets = UIEdgeInsetsMake([top floatValue], [left floatValue], [bottom floatValue], [right floatValue]);
        
        NSValue *valuePoint = [NSValue valueWithUIEdgeInsets:insets];
        
        methodResult(valuePoint);
    } else {
        methodResult(FlutterMethodNotImplemented);
    }
}
