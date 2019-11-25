//
// Created by Yohom Bao on 2019/11/25.
//

#import <Foundation/Foundation.h>
#import <Flutter/Flutter.h>


@interface NSDataHandler : NSObject
- (instancetype)initWith:(NSString*) method :(NSDictionary*)args :(FlutterResult)methodResult;
@end