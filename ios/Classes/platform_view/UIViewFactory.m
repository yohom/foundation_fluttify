//
//  UIViewFactory.m
//  foundation_fluttify
//
//  Created by Yohom Bao on 2020/4/17.
//

#import "UIViewFactory.h"
#import "FoundationFluttifyPlugin.h"

// Dart端随机存取对象的容器
extern NSMutableDictionary<NSNumber*, NSObject*>* HEAP;

@implementation UIViewFactory {
}

- (instancetype)initWithRegistrar:(NSObject <FlutterPluginRegistrar> *)registrar {
    self = [super init];
    if (self) {
        _registrar = registrar;
    }
    
    return self;
}

- (NSObject <FlutterPlatformView> *)createWithFrame:(CGRect)frame viewIdentifier:(int64_t)viewId arguments:(id _Nullable)args {
    return [[UIViewPlatformView alloc] initWithViewId:viewId frame: frame registrar:_registrar];
}

@end

@implementation UIViewPlatformView {
    NSInteger _viewId;
    CGRect _frame;
}

- (instancetype)initWithViewId:(NSInteger)viewId frame:(CGRect)frame registrar:(NSObject <FlutterPluginRegistrar> *)registrar {
    self = [super init];
    if (self) {
        _viewId = viewId;
        _registrar = registrar;
        _frame = frame;
    }
    
    return self;
}

- (UIView *)view {
    UIView *view = [[UIView alloc] initWithFrame:_frame];
    // 这里用一个magic number调整一下id
    HEAP[@(2147483647 - _viewId)] = view;
    return view;
}

@end

