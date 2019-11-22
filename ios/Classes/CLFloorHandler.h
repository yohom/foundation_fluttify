//
// Created by Yohom Bao on 2019/11/22.
//

#import <Foundation/Foundation.h>
#import <Flutter/Flutter.h>
#import "FoundationFluttifyPlugin.h"

@interface CLFloorHandler : NSObject
- (instancetype)initWith:(NSString*) method :(NSDictionary*)args :(FlutterResult)methodResult;
@end
