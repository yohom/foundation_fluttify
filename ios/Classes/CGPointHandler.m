//
// Created by Yohom Bao on 2019/11/29.
//

#import <Flutter/Flutter.h>
#import "CGPointHandler.h"

extern NSMutableDictionary<NSString *, NSObject *> *STACK;
extern NSMutableDictionary<NSNumber *, NSObject *> *HEAP;
extern BOOL enableLog;

void CGPointHandler(NSString* method, id rawArgs, FlutterResult methodResult) {
    if ([@"CGPoint::getX" isEqualToString:method]) {
        NSDictionary<NSString*, id>* args = (NSDictionary<NSString*, id>*) rawArgs;
        
        NSValue *value = (NSValue *) args[@"__this__"];
        CGPoint cgPoint = value.CGPointValue;
        
        methodResult(@(cgPoint.x));
    } else if ([@"CGPoint::getY" isEqualToString:method]) {
        NSDictionary<NSString*, id>* args = (NSDictionary<NSString*, id>*) rawArgs;
        
        NSValue *value = (NSValue *) args[@"__this__"];
        CGPoint cgPoint = value.CGPointValue;
        
        methodResult(@(cgPoint.y));
    } else if ([@"CGPoint::create" isEqualToString:method]) {
        NSDictionary<NSString*, id>* args = (NSDictionary<NSString*, id>*) rawArgs;
        
        NSNumber *x = (NSNumber *) args[@"x"];
        NSNumber *y = (NSNumber *) args[@"y"];
        
        CGPoint cgPoint = CGPointMake([x floatValue], [y floatValue]);
        NSValue *valuePoint = [NSValue valueWithCGPoint:cgPoint];
        
        methodResult(valuePoint);
    } else {
        methodResult(FlutterMethodNotImplemented);
    }
}
