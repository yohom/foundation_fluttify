//
// Created by Yohom Bao on 2019/11/22.
//

#import <Foundation/Foundation.h>
#import "FoundationFluttifyPlugin.h"

NS_ASSUME_NONNULL_BEGIN

@interface UIViewHandler : NSObject
- (instancetype)initWith:(NSString*) method :(NSDictionary*)args :(FlutterResult)methodResult;
@end

NS_ASSUME_NONNULL_END
