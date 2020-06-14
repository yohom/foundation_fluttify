import 'ns_object.dart';

// ignore: camel_case_types
class _NSCoding_SUB extends NSObject with NSCoding {}

mixin NSCoding on NSObject {
  static NSCoding subInstance() => _NSCoding_SUB();
}
