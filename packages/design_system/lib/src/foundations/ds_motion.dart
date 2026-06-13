import 'package:flutter/animation.dart';

/// Motion tokens for durations and easing curves.
abstract final class DSMotion {
  /// Instant duration for disabled animations in tests or reduced motion.
  static const Duration instant = Duration.zero;

  /// Fast duration for small state changes.
  static const Duration fast = Duration(milliseconds: 150);

  /// Default duration for component transitions.
  static const Duration normal = Duration(milliseconds: 250);

  /// Slow duration for larger transitions.
  static const Duration slow = Duration(milliseconds: 400);

  /// Default easing curve for most component transitions.
  static const Curve standard = Curves.easeInOutCubic;

  /// Easing curve for elements entering the screen.
  static const Curve enter = Curves.easeOutCubic;

  /// Easing curve for elements leaving the screen.
  static const Curve exit = Curves.easeInCubic;
}
