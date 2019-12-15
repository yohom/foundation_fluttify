import 'package:flutter/services.dart';

const kMethodChannelName = 'com.fluttify/foundation_method';
const kMethodChannel = MethodChannel(kMethodChannelName);

const kBroadcastEventChannelName = 'com.fluttify/foundation_broadcast_event';
const kBroadcastEventChannel = MethodChannel(kBroadcastEventChannelName);
