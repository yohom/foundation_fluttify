//
//  CGSizeHandler.m
//  foundation_fluttify
//
//  Created by Yohom Bao on 2020/6/22.
//

#import "CGSizeHandler.h"

extern NSMutableDictionary<NSString *, NSObject *> *STACK;
extern NSMutableDictionary<NSNumber *, NSObject *> *HEAP;
extern BOOL enableLog;

void CGSizeHandler(NSString* method, id rawArgs, FlutterResult methodResult) {
    if ([@"CGSize::create" isEqualToString:method]) {
        NSDictionary<NSString*, id>* args = (NSDictionary<NSString*, id>*) rawArgs;
        
        CGFloat width = [(NSNumber*) args[@"width"] floatValue];
        CGFloat height = [(NSNumber*) args[@"height"] floatValue];
        
        CGSize rect = CGSizeMake(width, height);
        
        NSValue* result = [NSValue valueWithCGSize:rect];
        
        HEAP[@(result.hash)] = result;
        
        methodResult(@(result.hash));
    } else if ([@"CGSize::getWidth" isEqualToString:method]) {
        NSDictionary<NSString*, id>* args = (NSDictionary<NSString*, id>*) rawArgs;
        
        NSNumber *refId = (NSNumber *) args[@"refId"];
        
        NSValue *value = (NSValue *) HEAP[refId];
        CGSize cgSize = value.CGSizeValue;
        
        methodResult(@(cgSize.width));
    } else if ([@"CGSize::getHeight" isEqualToString:method]) {
        NSDictionary<NSString*, id>* args = (NSDictionary<NSString*, id>*) rawArgs;
        
        NSNumber *refId = (NSNumber *) args[@"refId"];
        
        NSValue *value = (NSValue *) HEAP[refId];
        CGSize cgSize = value.CGSizeValue;
        
        methodResult(@(cgSize.height));
    } else {
        methodResult(FlutterMethodNotImplemented);
    }
}

