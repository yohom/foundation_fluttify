//
//  PlatformFactoryHandler.h
//  foundation_fluttify
//
//  Created by Yohom Bao on 2019/11/22.
//

#import "FoundationFluttifyPlugin.h"
#import <Flutter/Flutter.h>

NS_ASSUME_NONNULL_BEGIN

void PlatformFactoryHandler(NSString* method, NSDictionary* args, FlutterResult methodResult, NSObject<FlutterPluginRegistrar>* registrar);

NS_ASSUME_NONNULL_END
