// ignore_for_file: non_constant_identifier_names
import 'ns_object.dart';

class _NSMutableCopying_SUB extends NSObject with NSMutableCopying {}

mixin NSMutableCopying on NSObject {
  static NSMutableCopying subInstance() => _NSMutableCopying_SUB();

  final String tag__ = 'platform';
}
