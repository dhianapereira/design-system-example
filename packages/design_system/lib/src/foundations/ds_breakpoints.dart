/// Named responsive ranges used by layout components.
enum DSBreakpoint {
  /// Small phones and narrow layouts.
  compact,

  /// Tablets, foldables, and larger phones in landscape.
  medium,

  /// Small desktop or wide tablet layouts.
  expanded,

  /// Desktop layouts.
  large,

  /// Wide desktop layouts.
  extraLarge,
}

/// Breakpoint tokens for responsive behavior.
abstract final class DSBreakpoints {
  /// Maximum width for compact layouts.
  static const double compactMax = 599;

  /// Minimum width for medium layouts.
  static const double mediumMin = 600;

  /// Maximum width for medium layouts.
  static const double mediumMax = 839;

  /// Minimum width for expanded layouts.
  static const double expandedMin = 840;

  /// Maximum width for expanded layouts.
  static const double expandedMax = 1199;

  /// Minimum width for large layouts.
  static const double largeMin = 1200;

  /// Maximum width for large layouts.
  static const double largeMax = 1599;

  /// Minimum width for extra-large layouts.
  static const double extraLargeMin = 1600;

  /// Returns the breakpoint that matches a viewport [width].
  static DSBreakpoint fromWidth(double width) {
    return switch (width) {
      >= extraLargeMin => DSBreakpoint.extraLarge,
      >= largeMin => DSBreakpoint.large,
      >= expandedMin => DSBreakpoint.expanded,
      >= mediumMin => DSBreakpoint.medium,
      _ => DSBreakpoint.compact,
    };
  }
}
