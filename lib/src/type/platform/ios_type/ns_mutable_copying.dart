import 'ns_object.dart';

// ignore: camel_case_types
class _NSMutableCopying_SUB extends NSObject with NSMutableCopying {}

mixin NSMutableCopying on NSObject {
  static NSMutableCopying subInstance() => _NSMutableCopying_SUB();
}
