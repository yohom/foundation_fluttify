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
        NSNumber *refId = (NSNumber *) args[@"refId"];
        
        UIView *target = (UIView *) HEAP[refId];
        
        CGRect rect = [target frame];
        NSValue *dataValue = [NSValue value:&rect withObjCType:@encode(CGRect)];
        
        HEAP[@(dataValue.hash)] = dataValue;
        
        methodResult(@(dataValue.hash));
    } else if ([@"UIView::getHidden" isEqualToString:method]) {
        NSNumber *refId = (NSNumber *) args[@"refId"];
        
        UIView *target = (UIView *) HEAP[refId];
        
        methodResult(@(target.isHidden));
    } else if ([@"UIView::rotate" isEqualToString:method]) {
        NSNumber* refId = (NSNumber *) args[@"refId"];
        NSNumber* angle = (NSNumber*) args[@"angle"];

        UIView *target = (UIView *) HEAP[refId];
        target.transform = CGAffineTransformMakeRotation([angle doubleValue] / 180.0 * M_PI);
        
        methodResult(@"success");
    } else if ([@"UIView::create" isEqualToString:method]) {
        UIView* result = [UIView init];
        methodResult(@(result.hash));
    } else if ([@"UIView::setHidden" isEqualToString:method]) {
        NSNumber* refId = (NSNumber*) args[@"refId"];
        NSNumber* hidden = (NSNumber*) args[@"hidden"];
        
        UIView *target = (UIView *) HEAP[refId];
        
        target.hidden = [hidden boolValue];
        
        methodResult(@"success");
    } else if ([@"UIView::setAnchorPoint" isEqualToString:method]) {
        NSNumber* refId = (NSNumber*) args[@"refId"];
        NSNumber* anchorU = (NSNumber*) args[@"anchorU"];
        NSNumber* anchorV = (NSNumber*) args[@"anchorV"];
        
        UIView *target = (UIView *) HEAP[refId];
        
        target.layer.anchorPoint = CGPointMake([anchorU doubleValue], [anchorV doubleValue]);
        
        methodResult(@"success");
    } else if ([@"UIView::scaleWithDuration" isEqualToString:method]) {
        NSNumber* refId = (NSNumber*) args[@"refId"];
        NSNumber* duration = (NSNumber*) args[@"duration"];
        NSNumber* x = (NSNumber*) args[@"x"];
        NSNumber* toX = (NSNumber*) args[@"toX"];
        NSNumber* y = (NSNumber*) args[@"y"];
        NSNumber* toY = (NSNumber*) args[@"toY"];
        
        UIView *target = (UIView *) HEAP[refId];
        
        [UIView animateWithDuration:0.3f animations:^{
            target.transform = CGAffineTransformMake(1.05f, 0, 0, 1.0f, 0, 0);
        } completion:^(BOOL finished) {
            
        }];
        
        methodResult(@"success");
    } else {
        methodResult(FlutterMethodNotImplemented);
    }
}
