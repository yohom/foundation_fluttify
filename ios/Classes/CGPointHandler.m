//
// Created by Yohom Bao on 2019/11/29.
//

#import <Flutter/Flutter.h>
#import "CGPointHandler.h"

extern BOOL enableLog;

void CGPointHandler(NSString* method, id rawArgs, FlutterResult methodResult) {
    if ([@"CGPoint::getX" isEqualToString:method]) {
        NSDictionary<NSString*, id>* args = (NSDictionary<NSString*, id>*) rawArgs;
        
        NSValue *value = (NSValue *) args[@"__this__"];
        if (value != nil && (NSNull*) value != [NSNull null]) {
            CGPoint cgPoint = value.CGPointValue;
            methodResult(@(cgPoint.x));
        } else {
            methodResult([FlutterError errorWithCode:@"目标对象为nul"
                                             message:@"目标对象为nul"
                                             details:@"目标对象为nul"]);
        }
    } else if ([@"CGPoint::getY" isEqualToString:method]) {
        NSDictionary<NSString*, id>* args = (NSDictionary<NSString*, id>*) rawArgs;
        
        NSValue *value = (NSValue *) args[@"__this__"];
        if (value != nil && (NSNull*) value != [NSNull null]) {
            CGPoint cgPoint = value.CGPointValue;
            methodResult(@(cgPoint.y));
        } else {
            methodResult([FlutterError errorWithCode:@"目标对象为nul"
                                             message:@"目标对象为nul"
                                             details:@"目标对象为nul"]);
        }
    } else if ([@"CGPoint::getX_batch" isEqualToString:method]) {
        NSDictionary<NSString*, id>* args = (NSDictionary<NSString*, id>*) rawArgs;
        
        NSArray<NSValue*>* value = (NSArray<NSValue*>*) args[@"__this__"];
        if (value != nil && (NSNull*) value != [NSNull null]) {
            NSMutableArray<NSNumber*>* result = [NSMutableArray arrayWithCapacity:value.count];
            
            for (NSValue* pointValue in value) {
                [result addObject:@(pointValue.CGPointValue.x)];
            }
            
            methodResult(result);
        } else {
            methodResult([FlutterError errorWithCode:@"目标对象为nul"
                                             message:@"目标对象为nul"
                                             details:@"目标对象为nul"]);
        }
    } else if ([@"CGPoint::getY_batch" isEqualToString:method]) {
        NSDictionary<NSString*, id>* args = (NSDictionary<NSString*, id>*) rawArgs;
        
        NSArray<NSValue*>* value = (NSArray<NSValue*>*) args[@"__this__"];
        if (value != nil && (NSNull*) value != [NSNull null]) {
            NSMutableArray<NSNumber*>* result = [NSMutableArray arrayWithCapacity:value.count];
            
            for (NSValue* pointValue in value) {
                [result addObject:@(pointValue.CGPointValue.y)];
            }
            
            methodResult(result);
        } else {
            methodResult([FlutterError errorWithCode:@"目标对象为nul"
                                             message:@"目标对象为nul"
                                             details:@"目标对象为nul"]);
        }
    } else if ([@"CGPoint::create" isEqualToString:method]) {
        NSDictionary<NSString*, id>* args = (NSDictionary<NSString*, id>*) rawArgs;
        
        NSNumber *x = (NSNumber *) args[@"x"];
        NSNumber *y = (NSNumber *) args[@"y"];
        
        CGPoint cgPoint = CGPointMake([x floatValue], [y floatValue]);
        NSValue *valuePoint = [NSValue valueWithCGPoint:cgPoint];
        
        methodResult(valuePoint);
    } else if ([@"CGPoint::create_batch" isEqualToString:method]) {
        NSDictionary<NSString*, id>* args = (NSDictionary<NSString*, id>*) rawArgs;
        
        NSArray<NSNumber*>* x = (NSArray<NSNumber*>*) args[@"x"];
        NSArray<NSNumber*>* y = (NSArray<NSNumber*>*) args[@"y"];
        
        NSMutableArray<NSValue*>* result = [NSMutableArray arrayWithCapacity:x.count];
        
        for (NSUInteger i = 0; i < x.count; i++) {
            CGPoint cgPoint = CGPointMake([x[i] floatValue], [y[i] floatValue]);
            NSValue *valuePoint = [NSValue valueWithCGPoint:cgPoint];
            
            [result addObject:valuePoint];
        }
        
        methodResult(result);
    } else {
        methodResult(FlutterMethodNotImplemented);
    }
}
