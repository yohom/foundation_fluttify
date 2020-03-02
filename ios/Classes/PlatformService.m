//
//  PlatformFactoryHandler.m
//  foundation_fluttify
//
//  Created by Yohom Bao on 2019/11/22.
//

#import "PlatformService.h"
#import <CoreLocation/CoreLocation.h>
#import <objc/runtime.h>

extern NSMutableDictionary<NSString *, NSObject *> *STACK;
extern NSMutableDictionary<NSNumber *, NSObject *> *HEAP;
extern BOOL enableLog;

// TODO 跟具体类有关联的都放到对应类下面去, 不要放到PlatformService里
void PlatformService(NSString* method, NSDictionary* args, FlutterResult methodResult, NSObject<FlutterPluginRegistrar>* registrar) {
    // toggle log
    if ([@"PlatformService::enableLog" isEqualToString:method]) {
        enableLog = [args[@"enable"] boolValue];
        methodResult(@"success");
    }
    // 通过反射调用方法
    else if ([@"PlatformService::performSelectorWithObject" isEqualToString:method]) {
        NSNumber *refId = (NSNumber *) args[@"refId"];
        NSString *selector = (NSString *) args[@"selector"];
        NSObject *object = (NSObject *) args[@"object"];
        
        NSObject *target = (NSObject *) HEAP[refId];
        
        [target performSelector:NSSelectorFromString(selector) withObject:object];
        
        methodResult(@"success");
    }
    // 为对象添加字段
    else if ([@"PlatformService::addProperty" isEqualToString:method]) {
        NSNumber *refId = (NSNumber *) args[@"refId"];
        NSInteger propertyKey = [(NSNumber *) args[@"propertyKey"] integerValue];
        NSNumber *propertyRefId = (NSNumber *) args[@"property"];
        
        NSObject *target = HEAP[refId];
        NSObject *property = HEAP[propertyRefId];
        
        objc_setAssociatedObject(target, (const void *) propertyKey, property, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
        
        methodResult(@"success");
    }
    // 获取添加字段的值
    else if ([@"PlatformService::getProperty" isEqualToString:method]) {
        NSNumber *refId = (NSNumber *) args[@"refId"];
        NSInteger propertyKey = [(NSNumber *) args[@"propertyKey"] integerValue];
        
        NSObject *target = HEAP[refId];
                
        NSObject *result = objc_getAssociatedObject(target, (const void *) propertyKey);
        
        methodResult(@(result.hash));
    }
    // 为对象添加jsonable字段
    else if ([@"PlatformService::addJsonableProperty" isEqualToString:method]) {
        NSNumber *refId = (NSNumber *) args[@"refId"];
        NSInteger propertyKey = [(NSNumber *) args[@"propertyKey"] integerValue];
        NSObject *property = (NSObject *) args[@"property"];
        
        NSObject *target = HEAP[refId];
                
        objc_setAssociatedObject(target, (const void *) propertyKey, property, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
        
        methodResult(@"success");
    }
    // 获取添加字段的jsonable值
    else if ([@"PlatformService::getJsonableProperty" isEqualToString:method]) {
        NSNumber *refId = (NSNumber *) args[@"refId"];
        NSInteger propertyKey = [(NSNumber *) args[@"propertyKey"] integerValue];
        
        NSObject *target = HEAP[refId];
                
        methodResult(objc_getAssociatedObject(target, (const void *) propertyKey));
    }
    // 创建UIColor
    else if ([@"PlatformService::createUIColor" isEqualToString:method]) {
        NSNumber *colorValue = (NSNumber *) args[@"colorValue"];
        CGFloat alpha = (0xff000000 & [colorValue integerValue]) >> 24;
        CGFloat red = (0x00ff0000 & [colorValue integerValue]) >> 16;
        CGFloat green = (0x0000ff00 & [colorValue integerValue]) >> 8;
        CGFloat blue = (0x000000ff & [colorValue integerValue]) >> 0;
        
        UIColor *color = [UIColor colorWithRed:red / 0xFF green:green / 0xFF blue:blue / 0xFF alpha:alpha / 0xFF];
        
        HEAP[@(color.hash)] = color;
        
        methodResult(@(color.hash));
    }
    // 根据Uint8List创建NSData
    else if ([@"PlatformService::createNSDataWithUint8List" isEqualToString:method]) {
        FlutterStandardTypedData *data = (FlutterStandardTypedData *) args[@"data"];
        
        NSData *target = data.data;
        
        HEAP[@(target.hash)] = target;
        
        methodResult(@(target.hash));
    }
    // 创建CGPoint
    else if ([@"PlatformService::createCGPoint" isEqualToString:method]) {
        NSNumber *x = (NSNumber *) args[@"x"];
        NSNumber *y = (NSNumber *) args[@"y"];
        
        CGPoint cgPoint = CGPointMake([x floatValue], [y floatValue]);
        NSValue *valuePoint = [NSValue valueWithCGPoint:cgPoint];
        
        HEAP[@(valuePoint.hash)] = valuePoint;
        
        methodResult(@(valuePoint.hash));
    }
    // 创建UIEdgeInsets
    else if ([@"PlatformService::createUIEdgeInsets" isEqualToString:method]) {
        NSNumber *top = (NSNumber *) args[@"top"];
        NSNumber *left = (NSNumber *) args[@"left"];
        NSNumber *bottom = (NSNumber *) args[@"bottom"];
        NSNumber *right = (NSNumber *) args[@"right"];
        
        UIEdgeInsets insets = UIEdgeInsetsMake([top floatValue], [left floatValue], [bottom floatValue], [right floatValue]);
        
        NSValue *valuePoint = [NSValue valueWithUIEdgeInsets:insets];
        
        HEAP[@(valuePoint.hash)] = valuePoint;
        
        methodResult(@(valuePoint.hash));
    }
    // 释放一个对象
    else if ([@"PlatformService::release" isEqualToString:method]) {
        NSNumber *refId = (NSNumber *) args[@"refId"];
        
        if (enableLog) NSLog(@"PlatformService::释放对象: %@@%@", NSStringFromClass([HEAP[refId] class]), refId);
        
        [HEAP removeObjectForKey:refId];
        methodResult(@"success");
        
        if (enableLog) NSLog(@"HEAP: %@", HEAP);
    }
    // 释放一批对象
    else if ([@"PlatformService::release_batch" isEqualToString:method]) {
        NSArray<NSNumber*>* refBatch = (NSArray<NSNumber*>*) args[@"refId_batch"];
        
        if (enableLog) NSLog(@"PlatformService::批量释放对象: %@", refBatch);
        
        for (NSNumber* refId in refBatch) {
            [HEAP removeObjectForKey:refId];
        }
        methodResult(@"success");
        
        if (enableLog) NSLog(@"HEAP: %@", HEAP);
    }
    // 清空堆
    else if ([@"PlatformService::clearHeap" isEqualToString:method]) {
        NSLog(@"PlatformService::清空堆");
        
        [HEAP removeAllObjects];
        methodResult(@"success");
        
        if (enableLog) NSLog(@"HEAP: %@", HEAP);
    }
    // 压入栈
    else if ([@"PlatformService::pushStack" isEqualToString:method]) {
        NSString *name = (NSString *) args[@"name"];
        NSNumber *refId = (NSNumber *) args[@"refId"];
        
        if (enableLog) NSLog(@"PlatformService::压入栈 %@@%@", NSStringFromClass([HEAP[refId] class]), refId);
        
        STACK[name] = HEAP[refId];
        
        methodResult(@"success");
        
        if (enableLog) NSLog(@"STACK: %@", STACK);
    }
    // 压入栈 jsonable
    else if ([@"PlatformService::pushStackJsonable" isEqualToString:method]) {
        NSString *name = (NSString *) args[@"name"];
        NSObject *data = (NSObject *) args[@"data"];
        
        if (enableLog) NSLog(@"PlatformService::压入栈 %@", data);
        
        STACK[name] = data;
        
        methodResult(@"success");
        
        if (enableLog) NSLog(@"STACK: %@", STACK);
    }
    // 清空栈
    else if ([@"PlatformService::clearStack" isEqualToString:method]) {
        NSLog(@"PlatformService::清空栈");
        
        [STACK removeAllObjects];
        methodResult(@"success");
        
        if (enableLog) NSLog(@"STACK: %@", STACK);
    } else {
        methodResult(FlutterMethodNotImplemented);
    }
}
