//
// Created by Yohom Bao on 2019/11/22.
//

#import <CoreLocation/CoreLocation.h>
#import "CLLocationManagerHandler.h"

extern NSMutableDictionary<NSString *, NSObject *> *STACK;
extern NSMutableDictionary<NSNumber *, NSObject *> *HEAP;
extern BOOL enableLog;

void CLLocationManagerHandler(NSString* method, NSDictionary* args, FlutterResult methodResult) {
    // CLLocationManager::requestAlwaysAuthorization
    if ([@"CLLocationManager::requestAlwaysAuthorization" isEqualToString:method]) {
        NSNumber *refId = (NSNumber *) args[@"refId"];
        
        CLLocationManager *target = (CLLocationManager *) HEAP[refId];
        
        [target requestAlwaysAuthorization];
        
        methodResult(@"success");
    }
    // CLLocationManager::requestAlwaysAuthorization
    else if ([@"CLLocationManager::requestWhenInUseAuthorization" isEqualToString:method]) {
        NSNumber *refId = (NSNumber *) args[@"refId"];
        
        CLLocationManager *target = (CLLocationManager *) HEAP[refId];
        
        [target requestWhenInUseAuthorization];
        
        methodResult(@"success");
    }
    // 创建CLLocationCoordinate2D
    else if ([@"CLLocationCoordinate2D::createCLLocationCoordinate2D" isEqualToString:method]) {
        CLLocationDegrees latitude = [args[@"latitude"] doubleValue];
        CLLocationDegrees longitude = [args[@"longitude"] doubleValue];
        
        CLLocationCoordinate2D data = CLLocationCoordinate2DMake(latitude, longitude);
        
        NSValue *dataValue = [NSValue value:&data withObjCType:@encode(CLLocationCoordinate2D)];
        HEAP[@(dataValue.hash)] = dataValue;
        
        methodResult(@(dataValue.hash));
    }
    // 批量创建CLLocationCoordinate2D
    else if ([@"CLLocationCoordinate2D::create_batchCLLocationCoordinate2D" isEqualToString:method]) {
        NSArray<NSNumber*>* latitudeBatch = (NSArray<NSNumber*>*) args[@"latitude_batch"];
        NSArray<NSNumber*>* longitudeBatch = (NSArray<NSNumber*>*) args[@"longitude_batch"];
        
        NSMutableArray<NSNumber*>* resultBatch = [NSMutableArray arrayWithCapacity:latitudeBatch.count];
        for (int i = 0; i < latitudeBatch.count; i++) {
            CLLocationDegrees latitude = [[latitudeBatch objectAtIndex:i] doubleValue];
            CLLocationDegrees longitude = [[longitudeBatch objectAtIndex:i] doubleValue];
            
            CLLocationCoordinate2D data = CLLocationCoordinate2DMake(latitude, longitude);

            NSValue *dataValue = [NSValue value:&data withObjCType:@encode(CLLocationCoordinate2D)];
            [resultBatch addObject:@(dataValue.hash)];
            HEAP[@(dataValue.hash)] = dataValue;
        }
        
        methodResult(resultBatch);
    } else {
        methodResult(FlutterMethodNotImplemented);
    }
}
