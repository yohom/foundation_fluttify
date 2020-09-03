//
//  FluttifyMessageCodec.m
//  FMDB
//
//  Created by Yohom Bao on 2020/8/31.
//

#import "FluttifyMessageCodec.h"

extern NSMutableDictionary<NSNumber *, NSObject *> *HEAP;

typedef NS_ENUM(NSInteger, FluttifyField) {
  FluttifyFieldNil,
  FluttifyFieldTrue,
  FluttifyFieldFalse,
  FluttifyFieldInt32,
  FluttifyFieldInt64,
  FluttifyFieldIntHex,
  FluttifyFieldFloat64,
  FluttifyFieldString,
  // The following must match the corresponding order from `FlutterStandardDataType`.
  FluttifyFieldUInt8Data,
  FluttifyFieldInt32Data,
  FluttifyFieldInt64Data,
  FluttifyFieldFloat64Data,
  FluttifyFieldList,
  FluttifyFieldMap,
  FluttifyFieldEnum = 126,
  FluttifyFieldRef = 127,
};

UInt8 elementSizeForFlutterStandardDataType(FlutterStandardDataType type) {
  switch (type) {
    case FlutterStandardDataTypeUInt8:
      return 1;
    case FlutterStandardDataTypeInt32:
      return 4;
    case FlutterStandardDataTypeInt64:
      return 8;
    case FlutterStandardDataTypeFloat64:
      return 8;
    default:
      return 0;
  }
}

@implementation FluttifyReaderWriter
- (FlutterStandardWriter *)writerWithData:(NSMutableData *)data {
  return [[FluttifyWriter alloc] initWithData:data];
}

- (FlutterStandardReader *)readerWithData:(NSData *)data {
  return [[FluttifyReader alloc] initWithData:data];
}
@end

@implementation FluttifyWriter

- (void)writeValue:(id)value {
  if (value == nil || value == [NSNull null]) {
    [self writeByte:FluttifyFieldNil];
  } else if ([value isKindOfClass:[NSNumber class]]) {
    CFNumberRef number = (__bridge CFNumberRef) value;
    BOOL success = NO;
    if (CFGetTypeID(number) == CFBooleanGetTypeID()) {
      BOOL b = CFBooleanGetValue((CFBooleanRef) number);
      [self writeByte:(b ? FluttifyFieldTrue : FluttifyFieldFalse)];
      success = YES;
    } else if (CFNumberIsFloatType(number)) {
      Float64 f;
      success = CFNumberGetValue(number, kCFNumberFloat64Type, &f);
      if (success) {
        [self writeByte:FluttifyFieldFloat64];
        [self writeAlignment:8];
        [self writeBytes:(UInt8 *) &f length:8];
      }
    } else if (CFNumberGetByteSize(number) <= 4) {
      SInt32 n;
      success = CFNumberGetValue(number, kCFNumberSInt32Type, &n);
      if (success) {
        [self writeByte:FluttifyFieldInt32];
        [self writeBytes:(UInt8 *) &n length:4];
      }
    } else if (CFNumberGetByteSize(number) <= 8) {
      SInt64 n;
      success = CFNumberGetValue(number, kCFNumberSInt64Type, &n);
      if (success) {
        [self writeByte:FluttifyFieldInt64];
        [self writeBytes:(UInt8 *) &n length:8];
      }
    }
    if (!success) {
      NSLog(@"Unsupported value: %@ of number type %d", value, CFNumberGetType(number));
      NSAssert(NO, @"Unsupported value for standard codec");
    }
  } else if ([value isKindOfClass:[NSString class]]) {
    NSString *string = value;
    [self writeByte:FluttifyFieldString];
    [self writeUTF8:string];
  } else if ([value isKindOfClass:[FlutterStandardTypedData class]]) {
    FlutterStandardTypedData *typedData = value;
    [self writeByte:(FluttifyField) (typedData.type + FluttifyFieldUInt8Data)];
    [self writeSize:typedData.elementCount];
    [self writeAlignment:typedData.elementSize];
    [self writeData:typedData.data];
  } else if ([value isKindOfClass:[NSData class]]) {
    [self writeValue:[FlutterStandardTypedData typedDataWithBytes:value]];
  } else if ([value isKindOfClass:[NSArray class]]) {
    NSArray *array = value;
    [self writeByte:FluttifyFieldList];
    [self writeSize:array.count];
    for (id object in array) {
      [self writeValue:object];
    }
  } else if ([value isKindOfClass:[NSDictionary class]]) {
    NSDictionary *dict = value;
    [self writeByte:FluttifyFieldMap];
    [self writeSize:dict.count];
    for (id key in dict) {
      [self writeValue:key];
      [self writeValue:dict[key]];
    }
  }
    // 传递NSObject类型
  else if ([value isKindOfClass:[NSObject class]]) {
    NSUInteger hash = [value hash];
    SInt32 n;
    BOOL success = CFNumberGetValue((CFNumberRef) hash, kCFNumberSInt32Type, &n);
    if (success) {
      [self writeByte:FluttifyFieldRef];
      [self writeBytes:(UInt8 *) &n length:4];
    }
  } else {
    NSLog(@"Unsupported value: %@ of type %@", value, [value class]);
    NSAssert(NO, @"Unsupported value for standard codec");
  }
}
@end

@implementation FluttifyReader

- (FlutterStandardTypedData *)readTypedDataOfType:(FlutterStandardDataType)type {
  UInt32 elementCount = [self readSize];
  UInt8 elementSize = elementSizeForFlutterStandardDataType(type);
  [self readAlignment:elementSize];
  NSData *data = [self readData:elementCount * elementSize];

  switch (type) {
    case FlutterStandardDataTypeUInt8:
      return [FlutterStandardTypedData typedDataWithBytes:data];
    case FlutterStandardDataTypeInt32:
      return [FlutterStandardTypedData typedDataWithInt32:data];
    case FlutterStandardDataTypeInt64:
      return [FlutterStandardTypedData typedDataWithInt64:data];
    case FlutterStandardDataTypeFloat64:
      return [FlutterStandardTypedData typedDataWithFloat64:data];
    default:
      return nil;
  }
}

- (nullable id)readValueOfType:(UInt8)type {
  FluttifyField field = (FluttifyField) type;
  switch (field) {
    case FluttifyFieldNil:
      return nil;
    case FluttifyFieldTrue:
      return @YES;
    case FluttifyFieldFalse:
      return @NO;
    case FluttifyFieldInt32: {
      SInt32 value;
      [self readBytes:&value length:4];
      return @(value);
    }
    case FluttifyFieldInt64: {
      SInt64 value;
      [self readBytes:&value length:8];
      return @(value);
    }
    case FluttifyFieldFloat64: {
      Float64 value;
      [self readAlignment:8];
      [self readBytes:&value length:8];
      return @(value);
    }
    case FluttifyFieldIntHex:
    case FluttifyFieldString:
      return [self readUTF8];
    case FluttifyFieldUInt8Data:
    case FluttifyFieldInt32Data:
    case FluttifyFieldInt64Data:
    case FluttifyFieldFloat64Data:
      return [self readTypedDataOfType:(FlutterStandardDataType) (field - FluttifyFieldUInt8Data)];
    case FluttifyFieldList: {
      UInt32 length = [self readSize];
      NSMutableArray *array = [NSMutableArray arrayWithCapacity:length];
      for (UInt32 i = 0; i < length; i++) {
        id value = [self readValue];
        [array addObject:(value == nil ? [NSNull null] : value)];
      }
      return array;
    }
    case FluttifyFieldMap: {
      UInt32 size = [self readSize];
      NSMutableDictionary *dict = [NSMutableDictionary dictionaryWithCapacity:size];
      for (UInt32 i = 0; i < size; i++) {
        id key = [self readValue];
        id val = [self readValue];
        dict[key == nil ? [NSNull null] : key] = val == nil ? [NSNull null] : val;
      }
      return dict;
    }
      // 枚举类型直接使用int值
    case FluttifyFieldEnum: {
      SInt32 value;
      [self readBytes:&value length:4];
      return @(value);
    }
    case FluttifyFieldRef: {
      SInt32 value;
      [self readBytes:&value length:4];
      return HEAP[@(value)];
    }
    default:
      NSAssert(NO, @"Corrupted standard message");
      return nil;
  }
}
@end