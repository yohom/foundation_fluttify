//
//  UIImageViewHandler.m
//  foundation_fluttify
//
//  Created by Yohom Bao on 2020/7/2.
//

#import "UIImageViewHandler.h"

extern BOOL enableLog;

void UIImageViewHandler(NSString *method, id rawArgs, FlutterResult methodResult) {
  if ([@"UIImageView::create" isEqualToString:method]) {
    NSDictionary<NSString *, id> *args = (NSDictionary<NSString *, id> *) rawArgs;

    UIImage *image = (UIImage *) args[@"image"];

    UIImageView *imageView = [[UIImageView alloc] initWithImage:image];

    methodResult(imageView);
  } else {
    methodResult(FlutterMethodNotImplemented);
  }
}
