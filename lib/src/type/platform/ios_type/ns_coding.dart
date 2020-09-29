// ignore_for_file: non_constant_identifier_names
import 'ns_object.dart';

// ignore: camel_case_types
class _NSCoding_SUB extends NSObject with NSCoding {}

mixin NSCoding on NSObject {
  @override
  final String tag__ = 'platform';

  static NSCoding subInstance() => _NSCoding_SUB();
}
