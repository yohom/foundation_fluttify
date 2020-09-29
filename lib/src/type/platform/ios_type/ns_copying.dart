// ignore_for_file: non_constant_identifier_names
import 'ns_object.dart';

// ignore: camel_case_types
class _NSCopying_SUB extends NSObject with NSCopying {}

mixin NSCopying on NSObject {
  final String tag__ = 'platform';

  static NSCopying subInstance() => _NSCopying_SUB();
}
