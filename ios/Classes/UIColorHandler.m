//
//  UIColorHandler.m
//  foundation_fluttify
//
//  Created by Yohom Bao on 2020/3/9.
//

#import "UIColorHandler.h"

extern BOOL enableLog;

void UIColorHandler(NSString* method, id rawArgs, FlutterResult methodResult) {
    if ([@"UIColor::create" isEqualToString:method]) {
        NSDictionary<NSString*, id>* args = (NSDictionary<NSString*, id>*) rawArgs;
        
        NSNumber *colorValue = (NSNumber *) args[@"colorValue"];
        CGFloat alpha = (0xff000000 & [colorValue integerValue]) >> 24;
        CGFloat red = (0x00ff0000 & [colorValue integerValue]) >> 16;
        CGFloat green = (0x0000ff00 & [colorValue integerValue]) >> 8;
        CGFloat blue = (0x000000ff & [colorValue integerValue]) >> 0;
        
        UIColor *color = [UIColor colorWithRed:red / 0xFF green:green / 0xFF blue:blue / 0xFF alpha:alpha / 0xFF];
        
        methodResult(color);
    } else {
        methodResult(FlutterMethodNotImplemented);
    }
}

