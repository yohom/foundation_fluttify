//
//  UIViewControllerHandler.m
//  foundation_fluttify
//
//  Created by Yohom Bao on 2020/6/6.
//

#import "UIViewControllerHandler.h"
#import <Flutter/Flutter.h>

extern BOOL enableLog;

void UIViewControllerHandler(NSString* method, id args, FlutterResult methodResult) {
    if ([@"UIViewController::get" isEqualToString:method]) {
        UIViewController* controller = [UIApplication sharedApplication].keyWindow.rootViewController;

        methodResult(controller);
    } else {
        methodResult(FlutterMethodNotImplemented);
    }
}
