//
// Created by Yohom Bao on 2019/11/25.
//

#import "NSDataHandler.h"

extern BOOL enableLog;

void NSDataHandler(NSString* method, id rawArgs, FlutterResult methodResult) {
    if ([@"NSData::createWithUint8List" isEqualToString:method]) {
        NSDictionary<NSString*, id>* args = (NSDictionary<NSString*, id>*) rawArgs;
        
        FlutterStandardTypedData *data = (FlutterStandardTypedData *) args[@"data"];
        if (data != nil && (NSNull*) data != [NSNull null]) {
            NSData *target = data.data;
            methodResult(target);
        } else {
            methodResult([FlutterError errorWithCode:@"目标对象为nul"
                                             message:@"目标对象为nul"
                                             details:@"目标对象为nul"]);
        }
    } else if ([@"NSData::getData" isEqualToString:method]) {
        NSDictionary<NSString*, id>* args = (NSDictionary<NSString*, id>*) rawArgs;
        
        NSData *target = (NSData *) args[@"__this__"];
        if (target != nil && (NSNull*) target != [NSNull null]) {
            methodResult([FlutterStandardTypedData typedDataWithBytes:target]);
        } else {
            methodResult([FlutterError errorWithCode:@"目标对象为nul"
                                             message:@"目标对象为nul"
                                             details:@"目标对象为nul"]);
        }
    } else {
        methodResult(FlutterMethodNotImplemented);
    }
}
