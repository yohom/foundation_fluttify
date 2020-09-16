import 'package:foundation_fluttify/foundation_fluttify.dart';

mixin CAMediaTiming on NSObject {
  /// The begin time of the object, in relation to its parent object, if
  /// applicable. Defaults to 0.
  double beginTime;

  /// The basic duration of the object. Defaults to 0.
  double duration;

  /// The rate of the layer. Used to scale parent time to local time, e.g.
  /// if rate is 2, local time progresses twice as fast as parent time.
  /// Defaults to 1.
  double speed;

  /// Additional offset in active local time. i.e. to convert from parent
  /// time tp to active local time t: t = (tp - begin) * speed + offset.
  /// One use of this is to "pause" a layer by setting `speed' to zero and
  /// `offset' to a suitable value. Defaults to 0. */
  double timeOffset;

  /// The repeat count of the object. May be fractional. Defaults to 0.
  double repeatCount;

  /// The repeat duration of the object. Defaults to 0.
  double repeatDuration;

  /// When true, the object plays backwards after playing forwards. Defaults
  /// to NO.
  bool autoreverses;

  /// Defines how the timed object behaves outside its active duration.
  /// Local time may be clamped to either end of the active duration, or
  /// the element may be removed from the presentation. The legal values
  /// are `backwards', `forwards', `both' and `removed'. Defaults to
  /// `removed'.
  bool fillMode;
}

enum CAMediaTimingFillMode {
  backwards,
  forwards,
  both,
  removed,
}
