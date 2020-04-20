//
// Created by Yohom Bao on 2019/11/22.
//

#import "UIImageHandler.h"

extern NSMutableDictionary<NSString *, NSObject *> *STACK;
extern NSMutableDictionary<NSNumber *, NSObject *> *HEAP;
extern BOOL enableLog;

void UIImageHandler(NSString* method, id rawArgs, FlutterResult methodResult) {
    // UIImage::getData
    if ([@"UIImage::getData" isEqualToString:method]) {
        NSDictionary<NSString*, id>* args = (NSDictionary<NSString*, id>*) rawArgs;
        
        NSNumber *refId = (NSNumber *) args[@"refId"];
        
        UIImage *target = (UIImage *) HEAP[refId];
        NSData *data = UIImageJPEGRepresentation(target, 100);
        methodResult([FlutterStandardTypedData typedDataWithBytes:data]);
    }
    // 创建UIImage
    else if ([@"UIImage::createUIImage" isEqualToString:method]) {
        NSDictionary<NSString*, id>* args = (NSDictionary<NSString*, id>*) rawArgs;
        
        FlutterStandardTypedData* bitmapBytes = (FlutterStandardTypedData*) args[@"bitmapBytes"];
        
        UIImage *bitmap = [UIImage imageWithData:bitmapBytes.data];
        
        HEAP[@(bitmap.hash)] = bitmap;
        
        methodResult(@(bitmap.hash));
    }
    // 创建UIImage
    else if ([@"UIImage::createWithPath" isEqualToString:method]) {
        NSDictionary<NSString*, id>* args = (NSDictionary<NSString*, id>*) rawArgs;
        
        NSString* resource = (NSString*) args[@"resource"];
        NSString* type = (NSString*) args[@"type"];
        NSString* fileName = (NSString*) args[@"fileName"];
        
        NSString * path = [[NSBundle mainBundle] pathForResource:resource ofType:type];
        path = [path stringByAppendingPathComponent:fileName];

        UIImage* bitmap = [UIImage imageWithContentsOfFile:path];
        
        HEAP[@(bitmap.hash)] = bitmap;
        
        methodResult(@(bitmap.hash));
    }
    // 批量创建UIImage
    else if ([@"UIImage::createUIImage_batch" isEqualToString:method]) {
        NSArray<NSDictionary<NSString*, NSObject*>*>* argsBatch = (NSArray<NSDictionary<NSString*, NSObject*>*>*) rawArgs;

        NSMutableArray* resultList = [NSMutableArray array];
        
        for (int __i__ = 0; __i__ < argsBatch.count; __i__++) {
            NSDictionary<NSString*, id>* args = [argsBatch objectAtIndex:__i__];

            FlutterStandardTypedData* bitmapBytes = (FlutterStandardTypedData*) args[@"bitmapBytes"];
            
            UIImage *bitmap = [UIImage imageWithData:bitmapBytes.data];
            
            HEAP[@(bitmap.hash)] = bitmap;
        
            [resultList addObject:@(bitmap.hash)];
        }
        
        methodResult(resultList);
    } else {
        methodResult(FlutterMethodNotImplemented);
    }
}
