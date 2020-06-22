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
    if ([@"CGSize::getWidth" isEqualToString:method]) {
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

