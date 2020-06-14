import 'ns_object.dart';

// ignore: camel_case_types
class _NSCopying_SUB extends NSObject with NSCopying {}

mixin NSCopying on NSObject {
  static NSCopying subInstance() => _NSCopying_SUB();
}
