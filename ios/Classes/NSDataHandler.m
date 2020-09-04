//
// Created by Yohom Bao on 2019/11/25.
//

#import "NSDataHandler.h"

extern NSMutableDictionary<NSString *, NSObject *> *STACK;
extern NSMutableDictionary<NSNumber *, NSObject *> *HEAP;
extern BOOL enableLog;

void NSDataHandler(NSString* method, id rawArgs, FlutterResult methodResult) {
    if ([@"NSData::createWithUint8List" isEqualToString:method]) {
        NSDictionary<NSString*, id>* args = (NSDictionary<NSString*, id>*) rawArgs;
        
        FlutterStandardTypedData *data = (FlutterStandardTypedData *) args[@"data"];
        
        NSData *target = data.data;
        
        methodResult(target);
    } else {
        methodResult(FlutterMethodNotImplemented);
    }
}
