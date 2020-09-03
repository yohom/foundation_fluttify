//
// Created by Yohom Bao on 2019/11/22.
//

#import <Flutter/Flutter.h>
#import "UIViewHandler.h"

extern NSMutableDictionary<NSString *, NSObject *> *STACK;
extern NSMutableDictionary<NSNumber *, NSObject *> *HEAP;
extern BOOL enableLog;

void UIViewHandler(NSString* method, id args, FlutterResult methodResult) {
    // UIImage::getFrame
    if ([@"UIView::getFrame" isEqualToString:method]) {
        UIView *target = (UIView *) args[@"__this__"];
        
        CGRect rect = [target frame];
        NSValue *dataValue = [NSValue value:&rect withObjCType:@encode(CGRect)];
        
        methodResult(dataValue);
    } else if ([@"UIView::getHidden" isEqualToString:method]) {
        UIView *target = (UIView *) args[@"__this__"];
        
        methodResult(@(target.isHidden));
    } else if ([@"UIView::rotate" isEqualToString:method]) {
        NSNumber* angle = (NSNumber*) args[@"angle"];

        UIView *target = (UIView *) args[@"__this__"];
        target.transform = CGAffineTransformMakeRotation([angle doubleValue] / 180.0 * M_PI);
        
        methodResult(@"success");
    } else if ([@"UIView::create" isEqualToString:method]) {
        UIView* result = [UIView init];
        methodResult(@(result.hash));
    } else if ([@"UIView::setHidden" isEqualToString:method]) {
        NSNumber* hidden = (NSNumber*) args[@"hidden"];
        
        UIView *target = (UIView *) args[@"__this__"];
        
        target.hidden = [hidden boolValue];
        
        methodResult(@"success");
    } else if ([@"UIView::setAnchorPoint" isEqualToString:method]) {
        NSNumber* anchorU = (NSNumber*) args[@"anchorU"];
        NSNumber* anchorV = (NSNumber*) args[@"anchorV"];
        
        UIView *target = (UIView *) args[@"__this__"];
        
        target.layer.anchorPoint = CGPointMake([anchorU doubleValue], [anchorV doubleValue]);
        
        methodResult(@"success");
    } else if ([@"UIView::scaleWithDuration" isEqualToString:method]) {
        NSNumber* duration = (NSNumber*) args[@"duration"];
        NSNumber* fromValue = (NSNumber*) args[@"fromValue"];
        NSNumber* toValue = (NSNumber*) args[@"toValue"];
        NSNumber* repeatCount = (NSNumber*) args[@"repeatCount"];

        UIView *target = (UIView *) args[@"__this__"];

        CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
        animation.fromValue = fromValue;
        animation.toValue = toValue;
        animation.duration = [duration doubleValue];
        animation.autoreverses = NO;
        animation.repeatCount = [repeatCount intValue];
        animation.removedOnCompletion = NO;
        animation.fillMode = kCAFillModeForwards;
        [target.layer addAnimation:animation forKey:@"zoom"];
        
        methodResult(@"success");
    } else if ([@"UIView::alphaWithDuration" isEqualToString:method]) {
        NSNumber* duration = (NSNumber*) args[@"duration"];
        NSNumber* fromValue = (NSNumber*) args[@"fromValue"];
        NSNumber* toValue = (NSNumber*) args[@"toValue"];
        NSNumber* repeatCount = (NSNumber*) args[@"repeatCount"];

        UIView *target = (UIView *) args[@"__this__"];

        CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"opacity"];
        animation.fromValue = fromValue;
        animation.toValue = toValue;
        animation.duration = [duration doubleValue];
        animation.autoreverses = NO;
        animation.repeatCount = [repeatCount intValue];
        animation.removedOnCompletion = NO;
        animation.fillMode = kCAFillModeForwards;
        [target.layer addAnimation:animation forKey:@"opacity"];
        
        methodResult(@"success");
    } else if ([@"UIView::rotateWithDuration" isEqualToString:method]) {
        NSNumber* duration = (NSNumber*) args[@"duration"];
        NSNumber* fromValue = (NSNumber*) args[@"fromValue"];
        NSNumber* toValue = (NSNumber*) args[@"toValue"];
        NSNumber* repeatCount = (NSNumber*) args[@"repeatCount"];

        UIView *target = (UIView *) args[@"__this__"];

        CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform.rotation"];
        animation.fromValue = fromValue;
        animation.toValue = toValue;
        animation.duration = [duration doubleValue];
        animation.autoreverses = NO;
        animation.repeatCount = [repeatCount intValue];
        animation.removedOnCompletion = NO;
        animation.fillMode = kCAFillModeForwards;
        [target.layer addAnimation:animation forKey:@"rotation"];
        
        methodResult(@"success");
    } else {
        methodResult(FlutterMethodNotImplemented);
    }
}
