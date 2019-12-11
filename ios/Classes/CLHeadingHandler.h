//
//  CLHeadingHandler.h
//  foundation_fluttify
//
//  Created by Yohom Bao on 2019/12/11.
//

#import <Foundation/Foundation.h>
#import <Flutter/Flutter.h>

NS_ASSUME_NONNULL_BEGIN

@interface CLHeadingHandler : NSObject
- (instancetype)initWith:(NSString*) method :(NSDictionary*)args :(FlutterResult)methodResult;
@end

NS_ASSUME_NONNULL_END
