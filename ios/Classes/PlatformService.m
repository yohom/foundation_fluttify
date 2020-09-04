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

void PlatformService(NSString* method, id rawArgs, FlutterResult methodResult, NSObject<FlutterPluginRegistrar>* registrar) {
    // toggle log
    if ([@"PlatformService::enableLog" isEqualToString:method]) {
        NSDictionary<NSString*, id>* args = (NSDictionary<NSString*, id>*) rawArgs;
        
        enableLog = [args[@"enable"] boolValue];
        methodResult(@"success");
    }
    // 通过反射调用方法
    else if ([@"PlatformService::performSelectorWithObject" isEqualToString:method]) {
        NSDictionary<NSString*, id>* args = (NSDictionary<NSString*, id>*) rawArgs;
        
        NSString *selector = (NSString *) args[@"selector"];
        NSObject *object = (NSObject *) args[@"object"];
        
        NSObject *__this__ = (NSObject *) args[@"__this__"];
        
        [__this__ performSelector:NSSelectorFromString(selector) withObject:object];
        
        methodResult(@"success");
    }
    // 为对象添加字段
    else if ([@"PlatformService::addProperty" isEqualToString:method]) {
        NSDictionary<NSString*, id>* args = (NSDictionary<NSString*, id>*) rawArgs;
        
        NSInteger propertyKey = [(NSNumber *) args[@"propertyKey"] integerValue];
        NSNumber *property__this__ = (NSNumber *) args[@"property"];
        
        NSObject *__this__ = args[@"__this__"];
        NSObject *property = HEAP[property__this__];
        
        if (__this__) {
            objc_setAssociatedObject(__this__, (const void *) propertyKey, property, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
            methodResult(@"success");
        } else {
            methodResult([FlutterError errorWithCode:@"目标对象为空" message:@"目标对象为空" details:@"目标对象为空"]);
        }
    }
    // 为对象添加列表字段
    else if ([@"PlatformService::addListProperty" isEqualToString:method]) {
        NSDictionary<NSString*, id>* args = (NSDictionary<NSString*, id>*) rawArgs;
        
        NSInteger propertyKey = [(NSNumber *) args[@"propertyKey"] integerValue];
        NSArray<NSObject*>* property__ = (NSArray<NSObject *>*) args[@"property"];
        
        NSObject *__this__ = args[@"__this__"];

        if (__this__) {
            objc_setAssociatedObject(__this__, (const void *) propertyKey, property__, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
            methodResult(@"success");
        } else {
            methodResult([FlutterError errorWithCode:@"目标对象为空" message:@"目标对象为空" details:@"目标对象为空"]);
        }
    }
    // 批量为对象添加字段
    else if ([@"PlatformService::addProperty_batch" isEqualToString:method]) {
        NSArray<NSDictionary<NSString*, NSObject*>*>* argsBatch = (NSArray<NSDictionary<NSString*, NSObject*>*>*) rawArgs;
        
        NSMutableArray* resultList = [NSMutableArray array];
        
        for (NSUInteger __i__ = 0; __i__ < argsBatch.count; __i__++) {
            NSDictionary<NSString*, id>* args = argsBatch[__i__];
            
            NSInteger propertyKey = [(NSNumber *) args[@"propertyKey"] integerValue];
            NSObject *property__ = (NSObject *) args[@"property"];
            
            NSObject *__this__ = args[@"__this__"];

            if (__this__) {
                objc_setAssociatedObject(__this__, (const void *) propertyKey, property__, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
                [resultList addObject:@"success"];
            } else {
                methodResult([FlutterError errorWithCode:@"目标对象为空" message:@"目标对象为空" details:@"目标对象为空"]);
                break;
            }
        }
        
        methodResult(resultList);
    }
    // 获取添加字段的值
    else if ([@"PlatformService::getProperty" isEqualToString:method]) {
        NSDictionary<NSString*, id>* args = (NSDictionary<NSString*, id>*) rawArgs;
        
        NSInteger propertyKey = [(NSNumber *) args[@"propertyKey"] integerValue];
        
        NSObject *__this__ = args[@"__this__"];
        
        if (__this__) {
            NSObject *result = objc_getAssociatedObject(__this__, (const void *) propertyKey);
            methodResult(result);
        } else {
            methodResult([FlutterError errorWithCode:@"目标对象为空" message:@"目标对象为空" details:@"目标对象为空"]);
        }
    }
    // 批量获取添加字段的值
    else if ([@"PlatformService::getProperty_batch" isEqualToString:method]) {
        NSArray<NSDictionary<NSString*, NSObject*>*>* argsBatch = (NSArray<NSDictionary<NSString*, NSObject*>*>*) rawArgs;
        
        NSMutableArray* resultList = [NSMutableArray array];
        
        for (int __i__ = 0; __i__ < argsBatch.count; __i__++) {
            NSDictionary<NSString*, id>* args = argsBatch[__i__];
            
            NSInteger propertyKey = [(NSNumber *) args[@"propertyKey"] integerValue];
            
            NSObject *__this__ = args[@"__this__"];
            
            if (__this__) {
                NSObject *result = objc_getAssociatedObject(__this__, (const void *) propertyKey);
                [resultList addObject:result];
            } else {
                methodResult([FlutterError errorWithCode:@"目标对象为空" message:@"目标对象为空" details:@"目标对象为空"]);
                break;
            }
        }
        
        methodResult(resultList);
    }
    // 为对象添加jsonable字段
    else if ([@"PlatformService::addJsonableProperty" isEqualToString:method]) {
        NSDictionary<NSString*, id>* args = (NSDictionary<NSString*, id>*) rawArgs;
        
        NSInteger propertyKey = [(NSNumber *) args[@"propertyKey"] integerValue];
        NSObject *property = (NSObject *) args[@"property"];
        
        NSObject *__this__ = args[@"__this__"];
        
        if (__this__) {
            objc_setAssociatedObject(__this__, (const void *) propertyKey, property, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
            methodResult(@"success");
        } else {
            methodResult([FlutterError errorWithCode:@"目标对象为空" message:@"目标对象为空" details:@"目标对象为空"]);
        }
    }
    // 批量为对象添加jsonable字段
    else if ([@"PlatformService::addJsonableProperty_batch" isEqualToString:method]) {
        NSArray<NSDictionary<NSString*, NSObject*>*>* argsBatch = (NSArray<NSDictionary<NSString*, NSObject*>*>*) rawArgs;
        
        NSMutableArray* resultList = [NSMutableArray array];
        
        for (int __i__ = 0; __i__ < argsBatch.count; __i__++) {
            NSDictionary<NSString*, id>* args = argsBatch[__i__];
            
            NSInteger propertyKey = [(NSNumber *) args[@"propertyKey"] integerValue];
            NSObject *property = (NSObject *) args[@"property"];
            
            NSObject *__this__ = args[@"__this__"];
            
            if (__this__) {
                objc_setAssociatedObject(__this__, (const void *) propertyKey, property, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
                [resultList addObject:@"success"];
            } else {
                methodResult([FlutterError errorWithCode:@"目标对象为空" message:@"目标对象为空" details:@"目标对象为空"]);
                break;
            }
        }
        
        methodResult(resultList);
    }
    // 获取添加字段的jsonable值
    else if ([@"PlatformService::getJsonableProperty" isEqualToString:method]) {
        NSDictionary<NSString*, id>* args = (NSDictionary<NSString*, id>*) rawArgs;
        
        NSInteger propertyKey = [(NSNumber *) args[@"propertyKey"] integerValue];
        
        NSObject *__this__ = args[@"__this__"];
        
        if (__this__) {
            methodResult(objc_getAssociatedObject(__this__, (const void *) propertyKey));
        } else {
            methodResult([FlutterError errorWithCode:@"目标对象为空" message:@"目标对象为空" details:@"目标对象为空"]);
        }
    }
    // 批量获取添加字段的jsonable值
    else if ([@"PlatformService::getJsonableProperty_batch" isEqualToString:method]) {
        NSArray<NSDictionary<NSString*, NSObject*>*>* argsBatch = (NSArray<NSDictionary<NSString*, NSObject*>*>*) rawArgs;
        
        NSMutableArray* resultList = [NSMutableArray array];
        
        for (int __i__ = 0; __i__ < argsBatch.count; __i__++) {
            NSDictionary<NSString*, id>* args = argsBatch[__i__];
            
            NSInteger propertyKey = [(NSNumber *) args[@"propertyKey"] integerValue];
            
            NSObject *__this__ = args[@"__this__"];
            
            if (__this__) {
                NSObject* result = objc_getAssociatedObject(__this__, (const void *) propertyKey);
                [resultList addObject:result];
            } else {
                methodResult([FlutterError errorWithCode:@"目标对象为空" message:@"目标对象为空" details:@"目标对象为空"]);
                break;
            }
        }
        
        methodResult(resultList);
    }
    // 释放一个对象
    else if ([@"PlatformService::release" isEqualToString:method]) {
        NSDictionary<NSString*, id>* args = (NSDictionary<NSString*, id>*) rawArgs;

        NSObject *__this__ = (NSObject *) args[@"__this__"];
        
        if (enableLog) NSLog(@"PlatformService::释放对象: %@@%@", NSStringFromClass([__this__ class]), @([__this__ hash]));

        [HEAP removeObjectForKey:@(__this__.hash)];
        methodResult(@"success");
        
        if (enableLog) NSLog(@"HEAP: %@", HEAP);
    }
    // 释放一批对象
    else if ([@"PlatformService::release_batch" isEqualToString:method]) {
        NSDictionary<NSString*, id>* args = (NSDictionary<NSString*, id>*) rawArgs;
        
        NSArray<NSObject *>* __this_batch__ = (NSArray<NSObject*>*) args[@"__this__"];
        
        if (enableLog) NSLog(@"PlatformService::批量释放对象: %@", __this_batch__);
        
        for (NSObject* item in __this_batch__) {
            [HEAP removeObjectForKey:@(item.hash)];
        }
        methodResult(@"success");
        
        if (enableLog) NSLog(@"HEAP: %@", HEAP);
    }
    // 清空堆
    else if ([@"PlatformService::clearHeap" isEqualToString:method]) {
        if (enableLog) NSLog(@"PlatformService::清空堆");
        
        [HEAP removeAllObjects];
        methodResult(@"success");
        
        if (enableLog) NSLog(@"HEAP: %@", HEAP);
    }
    // 压入栈
    else if ([@"PlatformService::pushStack" isEqualToString:method]) {
        NSDictionary<NSString*, id>* args = (NSDictionary<NSString*, id>*) rawArgs;
        
        NSString *name = (NSString *) args[@"name"];

        NSObject *__this__ = (NSObject *) args[@"__this__"];

        if (enableLog) NSLog(@"PlatformService::压入栈 %@@%@", NSStringFromClass([args[@"__this__"] class]), __this__);

        STACK[name] = __this__;
        
        methodResult(@"success");
        
        if (enableLog) NSLog(@"STACK: %@", STACK);
    }
    // 压入栈 jsonable
    else if ([@"PlatformService::pushStackJsonable" isEqualToString:method]) {
        NSDictionary<NSString*, id>* args = (NSDictionary<NSString*, id>*) rawArgs;
        
        NSString *name = (NSString *) args[@"name"];
        NSObject *data = (NSObject *) args[@"data"];
        
        if (enableLog) NSLog(@"PlatformService::压入栈 %@", data);
        
        STACK[name] = data;
        
        methodResult(@"success");
        
        if (enableLog) NSLog(@"STACK: %@", STACK);
    }
    // 清空栈
    else if ([@"PlatformService::clearStack" isEqualToString:method]) {
        if (enableLog) NSLog(@"PlatformService::清空栈");
        
        [STACK removeAllObjects];
        methodResult(@"success");
        
        if (enableLog) NSLog(@"STACK: %@", STACK);
    }
    // 打开一个ViewController
    else if ([@"PlatformService::presentViewController" isEqualToString:method]) {
        NSDictionary<NSString*, id>* args = (NSDictionary<NSString*, id>*) rawArgs;
        
        if (enableLog) NSLog(@"PlatformService::打开一个ViewController");
        NSString* viewControllerClass = (NSString*) args[@"viewControllerClass"];
        BOOL withNavigationController = [(NSNumber*) args[@"withNavigationController"] boolValue];
        
        UIViewController *controller = [[NSClassFromString(viewControllerClass) alloc] init];
        if (withNavigationController) {
            //            UINavigationController *naviController = [[UINavigationController alloc] initWithRootViewController:controller];
            //            UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithTitle:@"关闭" style:UIBarButtonItemStyleDone __this__:nil action:@selector(dismiss)];
            //            [[controller navigationItem] setLeftBarButtonItem:item];
            //            [[UIApplication sharedApplication].keyWindow.rootViewController presentViewController:naviController animated:YES completion:nil];
        } else {
            [[UIApplication sharedApplication].keyWindow.rootViewController presentViewController:controller animated:YES completion:nil];
        }
        methodResult(@"success");
    }
    // 获取flutter asset的路径
    else if ([@"PlatformService::getAssetPath" isEqualToString:method]) {
        NSDictionary<NSString*, id>* args = (NSDictionary<NSString*, id>*) rawArgs;
        
        NSString *flutterAssetPath = (NSString *) args[@"flutterAssetPath"];
        
        if (enableLog) NSLog(@"PlatformService::Flutter Asset%@", flutterAssetPath);
        
        NSString* key = [registrar lookupKeyForAsset:flutterAssetPath];
        NSString* path = [[NSBundle mainBundle] pathForResource:key ofType:nil];
        
        methodResult(path);
    } else {
        methodResult(FlutterMethodNotImplemented);
    }
}
