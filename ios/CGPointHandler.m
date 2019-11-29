//
// Created by Yohom Bao on 2019/11/29.
//

#import <Flutter/Flutter.h>
#import "CGPointHandler.h"

extern NSMutableDictionary<NSString *, NSObject *> *STACK;
extern NSMutableDictionary<NSNumber *, NSObject *> *HEAP;
extern BOOL enableLog;

@implementation CGPointHandler
- (instancetype)initWith:(NSString *)method :(NSDictionary *)args :(FlutterResult)methodResult {
  self = [super init];
  if (self) {
    if ([@"CGPoint::getX" isEqualToString:method]) {
      NSNumber *refId = (NSNumber *) args[@"refId"];

      NSValue *value = (NSValue *) HEAP[refId];
      CGPoint cgPoint = value.CGPointValue;

      methodResult(@(cgPoint.x));
    } else if ([@"CGPoint::getY" isEqualToString:method]) {
      NSNumber *refId = (NSNumber *) args[@"refId"];

      NSValue *value = (NSValue *) HEAP[refId];
      CGPoint cgPoint = value.CGPointValue;

      methodResult(@(cgPoint.y));
    }
  }
  return self;
}
@end