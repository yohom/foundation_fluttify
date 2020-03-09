//
// Created by Yohom Bao on 2019/11/25.
//

#import "NSDataHandler.h"

extern NSMutableDictionary<NSString *, NSObject *> *STACK;
extern NSMutableDictionary<NSNumber *, NSObject *> *HEAP;
extern BOOL enableLog;

void NSDataHandler(NSString* method, NSDictionary* args, FlutterResult methodResult) {
    if ([@"NSData::createWithUint8List" isEqualToString:method]) {
        FlutterStandardTypedData *data = (FlutterStandardTypedData *) args[@"data"];
        
        NSData *target = data.data;
        
        HEAP[@(target.hash)] = target;
        
        methodResult(@(target.hash));
    } else {
        methodResult(FlutterMethodNotImplemented);
    }
}
