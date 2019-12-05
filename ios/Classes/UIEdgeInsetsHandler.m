//
// Created by Yohom Bao on 2019/12/5.
//

#import "UIEdgeInsetsHandler.h"

extern NSMutableDictionary<NSString *, NSObject *> *STACK;
extern NSMutableDictionary<NSNumber *, NSObject *> *HEAP;
extern BOOL enableLog;

@implementation UIEdgeInsetsHandler
- (instancetype)initWith:(NSString *)method :(NSDictionary *)args :(FlutterResult)methodResult {
  self = [super init];
  if (self) {
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
    } else {
      methodResult(FlutterMethodNotImplemented);
    }
  }
  return self;
}
@end