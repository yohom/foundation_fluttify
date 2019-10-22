import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:foundation_fluttify/foundation_fluttify.dart';

void main() {
  const MethodChannel channel = MethodChannel('foundation_fluttify');

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
    expect(await FoundationFluttify.platformVersion, '42');
  });
}
