//
//  UIViewFactory.h
//  foundation_fluttify
//
//  Created by Yohom Bao on 2020/4/17.
//

#import <Foundation/Foundation.h>
#import <Flutter/Flutter.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIViewFactory : NSObject <FlutterPlatformViewFactory>

- (instancetype)initWithRegistrar:(NSObject <FlutterPluginRegistrar> *)registrar;

@property(nonatomic) NSObject<FlutterPluginRegistrar>* registrar;

@end

@interface UIViewPlatformView : NSObject <FlutterPlatformView>

- (instancetype)initWithViewId:(NSInteger)viewId registrar:(NSObject <FlutterPluginRegistrar> *)registrar;

@property(nonatomic) NSObject<FlutterPluginRegistrar>* registrar;

@end

NS_ASSUME_NONNULL_END
