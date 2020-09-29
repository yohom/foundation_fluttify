// ignore_for_file: non_constant_identifier_names
import 'ca_property_animation.dart';

class CABasicAnimation extends CAPropertyAnimation {
  CABasicAnimation(this.fromValue, this.toValue, this.byValue);

  final String tag__ = 'platform';

  final dynamic fromValue;
  final dynamic toValue;
  final dynamic byValue;

  @override
  String toString() {
    return 'CABasicAnimation{fromValue: $fromValue, toValue: $toValue, byValue: $byValue}';
  }
}
