//
// Created by Yohom Bao on 2019/11/29.
//

#import <Flutter/Flutter.h>
#import "CGPointHandler.h"

extern NSMutableDictionary<NSString *, NSObject *> *STACK;
extern NSMutableDictionary<NSNumber *, NSObject *> *HEAP;
extern BOOL enableLog;

void CGPointHandler(NSString* method, NSDictionary* args, FlutterResult methodResult) {
    if ([@"CGPoint::getX" isEqualToString:method]) {
        NSNumber *refId = (NSNumber *) args[@"refId"];
        
        NSValue *value = (NSValue *) HEAP[refId];
        CGPoint cgPoint = value.CGPointValue;
        
        methodResult(@(cgPoint.x));
    } else if ([@"CGPoint::getY" isEqualToString:method]) {
        NSNumber *refId = (NSNumber *) args[@"refId"];
        
        NSValue *value = (NSValue *) HEAP[refId];
        CGPoint cgPoint = value.CGPointValue;
        
        methodResult(@(cgPoint.y));
    } else if ([@"CGPoint::create" isEqualToString:method]) {
        NSNumber *x = (NSNumber *) args[@"x"];
        NSNumber *y = (NSNumber *) args[@"y"];
        
        CGPoint cgPoint = CGPointMake([x floatValue], [y floatValue]);
        NSValue *valuePoint = [NSValue valueWithCGPoint:cgPoint];
        
        HEAP[@(valuePoint.hash)] = valuePoint;
        
        methodResult(@(valuePoint.hash));
    } else {
        methodResult(FlutterMethodNotImplemented);
    }
}
