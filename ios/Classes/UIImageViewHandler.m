//
//  UIImageViewHandler.m
//  foundation_fluttify
//
//  Created by Yohom Bao on 2020/7/2.
//

#import "UIImageViewHandler.h"
#import <Flutter/Flutter.h>

extern NSMutableDictionary<NSString *, NSObject *> *STACK;
extern NSMutableDictionary<NSNumber *, NSObject *> *HEAP;
extern BOOL enableLog;

void UIImageViewHandler(NSString* method, id rawArgs, FlutterResult methodResult) {
    if ([@"UIImageView::create" isEqualToString:method]) {
        NSDictionary<NSString*, id>* args = (NSDictionary<NSString*, id>*) rawArgs;
        
        NSNumber *refId = (NSNumber *) args[@"image"];
        
        UIImage *image = (UIImage *) HEAP[refId];
        
        UIImageView* imageView = [[UIImageView alloc]initWithImage:image];
        
        methodResult(imageView);
    } else {
        methodResult(FlutterMethodNotImplemented);
    }
}
