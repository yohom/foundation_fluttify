//
// Created by Yohom Bao on 2019/12/5.
//

#import "UIEdgeInsetsHandler.h"

extern NSMutableDictionary<NSString *, NSObject *> *STACK;
extern NSMutableDictionary<NSNumber *, NSObject *> *HEAP;
extern BOOL enableLog;

void UIEdgeInsetsHandler(NSString* method, NSDictionary* args, FlutterResult methodResult) {
    if ([@"UIEdgeInsets::getTop" isEqualToString:method]) {
        NSNumber *refId = (NSNumber *) args[@"refId"];
        
        NSValue *target = (NSValue *) HEAP[refId];
        UIEdgeInsets insets = [target UIEdgeInsetsValue];
        
        methodResult(@(insets.top));
    } else if ([@"UIEdgeInsets::getLeft" isEqualToString:method]) {
        NSNumber *refId = (NSNumber *) args[@"refId"];
        
        NSValue *target = (NSValue *) HEAP[refId];
        UIEdgeInsets insets = [target UIEdgeInsetsValue];
        
        methodResult(@(insets.left));
    } else if ([@"UIEdgeInsets::getBottom" isEqualToString:method]) {
        NSNumber *refId = (NSNumber *) args[@"refId"];
        
        NSValue *target = (NSValue *) HEAP[refId];
        UIEdgeInsets insets = [target UIEdgeInsetsValue];
        
        methodResult(@(insets.bottom));
    } else if ([@"UIEdgeInsets::getRight" isEqualToString:method]) {
        NSNumber *refId = (NSNumber *) args[@"refId"];
        
        NSValue *target = (NSValue *) HEAP[refId];
        UIEdgeInsets insets = [target UIEdgeInsetsValue];
        
        methodResult(@(insets.right));
    } else if ([@"UIEdgeInsets::create" isEqualToString:method]) {
        NSNumber *top = (NSNumber *) args[@"top"];
        NSNumber *left = (NSNumber *) args[@"left"];
        NSNumber *bottom = (NSNumber *) args[@"bottom"];
        NSNumber *right = (NSNumber *) args[@"right"];
        
        UIEdgeInsets insets = UIEdgeInsetsMake([top floatValue], [left floatValue], [bottom floatValue], [right floatValue]);
        
        NSValue *valuePoint = [NSValue valueWithUIEdgeInsets:insets];
        
        HEAP[@(valuePoint.hash)] = valuePoint;
        
        methodResult(@(valuePoint.hash));
    } else {
        methodResult(FlutterMethodNotImplemented);
    }
}
