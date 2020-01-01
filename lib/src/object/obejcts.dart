import 'package:flutter/services.dart';
import 'package:foundation_fluttify/src/type/base/ref.dart';

/// native object release pool, all objects returned by the native side will be in this set
final kNativeObjectPool = <Ref>{};

const kMethodChannelName = 'com.fluttify/foundation_method';
const kMethodChannel = MethodChannel(kMethodChannelName);

const kBroadcastEventChannelName = 'com.fluttify/foundation_broadcast_event';
const kBroadcastEventChannel = MethodChannel(kBroadcastEventChannelName);
