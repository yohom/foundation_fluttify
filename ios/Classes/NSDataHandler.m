//
// Created by Yohom Bao on 2019/11/25.
//

#import "NSDataHandler.h"

extern NSMutableDictionary<NSString *, NSObject *> *STACK;
extern NSMutableDictionary<NSNumber *, NSObject *> *HEAP;
extern BOOL enableLog;
extern int getFluttifySequence(void);

void NSDataHandler(NSString* method, NSDictionary* args, FlutterResult methodResult) {
    if ([@"NSData::createWithUint8List" isEqualToString:method]) {
        FlutterStandardTypedData *data = (FlutterStandardTypedData *) args[@"data"];
        
        NSData *target = data.data;
        
        int64_t seqNumber = getFluttifySequence();
        HEAP[@(seqNumber)] = target;
        
        methodResult(@(seqNumber));
    } else {
        methodResult(FlutterMethodNotImplemented);
    }
}
