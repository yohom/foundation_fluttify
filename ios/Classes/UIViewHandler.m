//
// Created by Yohom Bao on 2019/11/22.
//

#import <Flutter/Flutter.h>
#import "UIViewHandler.h"

extern BOOL enableLog;

void UIViewHandler(NSString* method, id args, FlutterResult methodResult) {
    // UIImage::getFrame
    if ([@"UIView::getFrame" isEqualToString:method]) {
        UIView *target = (UIView *) args[@"__this__"];
        if (target != nil && (NSNull*) target != [NSNull null]) {
            CGRect rect = [target frame];
            NSValue *dataValue = [NSValue value:&rect withObjCType:@encode(CGRect)];
            methodResult(dataValue);
        } else {
            methodResult([FlutterError errorWithCode:@"目标对象为nul"
                                             message:@"目标对象为nul"
                                             details:@"目标对象为nul"]);
        }
    } else if ([@"UIView::getHidden" isEqualToString:method]) {
        UIView *target = (UIView *) args[@"__this__"];
        if (target != nil && (NSNull*) target != [NSNull null]) {
            methodResult(@(target.isHidden));
        } else {
            methodResult([FlutterError errorWithCode:@"目标对象为nul"
                                             message:@"目标对象为nul"
                                             details:@"目标对象为nul"]);
        }
    } else if ([@"UIView::rotate" isEqualToString:method]) {
        NSNumber* angle = (NSNumber*) args[@"angle"];

        UIView *target = (UIView *) args[@"__this__"];
        if (target != nil && (NSNull*) target != [NSNull null]) {
            target.transform = CGAffineTransformMakeRotation([angle doubleValue] / 180.0 * M_PI);
            methodResult(@"success");
        } else {
            methodResult([FlutterError errorWithCode:@"目标对象为nul"
                                             message:@"目标对象为nul"
                                             details:@"目标对象为nul"]);
        }
    } else if ([@"UIView::create" isEqualToString:method]) {
        UIView* result = [[UIView alloc] init];
        methodResult(result);
    } else if ([@"UIView::setHidden" isEqualToString:method]) {
        NSNumber* hidden = (NSNumber*) args[@"hidden"];
        
        UIView *target = (UIView *) args[@"__this__"];
        if (target != nil && (NSNull*) target != [NSNull null]) {
            target.hidden = [hidden boolValue];
            methodResult(@"success");
        } else {
            methodResult([FlutterError errorWithCode:@"目标对象为nul"
                                             message:@"目标对象为nul"
                                             details:@"目标对象为nul"]);
        }
    } else if ([@"UIView::setAnchorPoint" isEqualToString:method]) {
        NSNumber* anchorU = (NSNumber*) args[@"anchorU"];
        NSNumber* anchorV = (NSNumber*) args[@"anchorV"];
        
        UIView *target = (UIView *) args[@"__this__"];
        if (target != nil && (NSNull*) target != [NSNull null]) {
            target.layer.anchorPoint = CGPointMake([anchorU doubleValue], [anchorV doubleValue]);
            methodResult(@"success");
        } else {
            methodResult([FlutterError errorWithCode:@"目标对象为nul"
                                             message:@"目标对象为nul"
                                             details:@"目标对象为nul"]);
        }
    } else if ([@"UIView::scaleWithDuration" isEqualToString:method]) {
        NSNumber* duration = (NSNumber*) args[@"duration"];
        NSNumber* fromValue = (NSNumber*) args[@"fromValue"];
        NSNumber* toValue = (NSNumber*) args[@"toValue"];
        NSNumber* repeatCount = (NSNumber*) args[@"repeatCount"];
        NSNumber* repeatMode = (NSNumber*) args[@"repeatMode"];

        UIView *target = (UIView *) args[@"__this__"];
        if (target != nil && (NSNull*) target != [NSNull null]) {
            CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
            animation.fromValue = fromValue;
            animation.toValue = toValue;
            animation.duration = [duration doubleValue];
            animation.autoreverses = [repeatMode intValue] == 0 ? NO : YES;
            animation.repeatCount = [repeatCount intValue] == 0 ? MAXFLOAT : [repeatCount intValue];
            animation.removedOnCompletion = NO;
            animation.fillMode = kCAFillModeForwards;
            [target.layer addAnimation:animation forKey:@"zoom"];
            
            methodResult(@"success");
        } else {
            methodResult([FlutterError errorWithCode:@"目标对象为nul"
                                             message:@"目标对象为nul"
                                             details:@"目标对象为nul"]);
        }
    } else if ([@"UIView::translateWithDuration" isEqualToString:method]) {
        NSNumber* duration = (NSNumber*) args[@"duration"];
        NSNumber* toX = (NSNumber*) args[@"toX"];
        NSNumber* toY = (NSNumber*) args[@"toY"];
        NSNumber* repeatCount = (NSNumber*) args[@"repeatCount"];
        NSNumber* repeatMode = (NSNumber*) args[@"repeatMode"];

        UIView *target = (UIView *) args[@"__this__"];
        if (target != nil && (NSNull*) target != [NSNull null]) {
            CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"position"];
            animation.toValue = [NSValue valueWithCGPoint:CGPointMake([toX floatValue], [toY floatValue])];
            animation.duration = [duration doubleValue];
            animation.autoreverses = [repeatMode intValue] == 0 ? NO : YES;
            animation.repeatCount = [repeatCount intValue] == 0 ? MAXFLOAT : [repeatCount intValue];
            animation.removedOnCompletion = NO;
            animation.fillMode = kCAFillModeForwards;
            [target.layer addAnimation:animation forKey:@"position"];
            
            methodResult(@"success");
        } else {
            methodResult([FlutterError errorWithCode:@"目标对象为nul"
                                             message:@"目标对象为nul"
                                             details:@"目标对象为nul"]);
        }
    } else if ([@"UIView::alphaWithDuration" isEqualToString:method]) {
        NSNumber* duration = (NSNumber*) args[@"duration"];
        NSNumber* fromValue = (NSNumber*) args[@"fromValue"];
        NSNumber* toValue = (NSNumber*) args[@"toValue"];
        NSNumber* repeatCount = (NSNumber*) args[@"repeatCount"];
        NSNumber* repeatMode = (NSNumber*) args[@"repeatMode"];

        UIView *target = (UIView *) args[@"__this__"];
        if (target != nil && (NSNull*) target != [NSNull null]) {
            CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"opacity"];
            animation.fromValue = fromValue;
            animation.toValue = toValue;
            animation.duration = [duration doubleValue];
            animation.autoreverses = [repeatMode intValue] == 0 ? NO : YES;
            animation.repeatCount = [repeatCount intValue] == 0 ? MAXFLOAT : [repeatCount intValue];
            animation.removedOnCompletion = NO;
            animation.fillMode = kCAFillModeForwards;
            [target.layer addAnimation:animation forKey:@"opacity"];
            
            methodResult(@"success");
        } else {
            methodResult([FlutterError errorWithCode:@"目标对象为nul"
                                             message:@"目标对象为nul"
                                             details:@"目标对象为nul"]);
        }
    } else if ([@"UIView::rotateWithDuration" isEqualToString:method]) {
        NSNumber* duration = (NSNumber*) args[@"duration"];
        NSNumber* fromValue = (NSNumber*) args[@"fromValue"];
        NSNumber* toValue = (NSNumber*) args[@"toValue"];
        NSNumber* repeatCount = (NSNumber*) args[@"repeatCount"];
        NSNumber* repeatMode = (NSNumber*) args[@"repeatMode"];

        UIView *target = (UIView *) args[@"__this__"];
        if (target != nil && (NSNull*) target != [NSNull null]) {
            CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform.rotation"];
            animation.fromValue = fromValue;
            animation.toValue = toValue;
            animation.duration = [duration doubleValue];
            animation.autoreverses = [repeatMode intValue] == 0 ? NO : YES;
            animation.repeatCount = [repeatCount intValue] == 0 ? MAXFLOAT : [repeatCount intValue];
            animation.removedOnCompletion = NO;
            animation.fillMode = kCAFillModeForwards;
            [target.layer addAnimation:animation forKey:@"rotation"];
            
            methodResult(@"success");
        } else {
            methodResult([FlutterError errorWithCode:@"目标对象为nul"
                                             message:@"目标对象为nul"
                                             details:@"目标对象为nul"]);
        }
    } else if ([@"UIView::groupWithDuration" isEqualToString:method]) {
        NSNumber* duration = (NSNumber*) args[@"duration"];
        NSArray<NSNumber*>* fromValue = (NSArray<NSNumber*>*) args[@"fromValue"];
        NSArray<NSNumber*>* toValue = (NSArray<NSNumber*>*) args[@"toValue"];
        NSArray<NSString*>* keyPath = (NSArray<NSString*>*) args[@"keyPath"];
        NSNumber* repeatCount = (NSNumber*) args[@"repeatCount"];
        NSNumber* repeatMode = (NSNumber*) args[@"repeatMode"];

        UIView *target = (UIView *) args[@"__this__"];
        if (target != nil && (NSNull*) target != [NSNull null]) {
            NSMutableArray<CAAnimation*>* animations = [NSMutableArray arrayWithCapacity:[fromValue count]];
            
            for (NSUInteger i = 0; i < animations.count; i++) {
                CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:keyPath[i]];
                animation.fromValue = fromValue[i];
                animation.toValue = toValue[i];
                
                [animations addObject:animation];
            }
            
            CAAnimationGroup *group = [CAAnimationGroup animation];
            group.duration = [duration doubleValue];
            group.autoreverses = [repeatMode intValue] == 0 ? NO : YES;
            group.repeatCount = [repeatCount intValue] == 0 ? MAXFLOAT : [repeatCount intValue];
            group.removedOnCompletion = NO;
            group.fillMode = kCAFillModeForwards;
            [group setAnimations:animations];
            
            [target.layer addAnimation:group forKey:@"group"];

            methodResult(@"success");
        } else {
            methodResult([FlutterError errorWithCode:@"目标对象为nul"
                                             message:@"目标对象为nul"
                                             details:@"目标对象为nul"]);
        }
    } else {
        methodResult(FlutterMethodNotImplemented);
    }
}
