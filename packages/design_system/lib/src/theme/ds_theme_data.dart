import 'package:flutter/material.dart';
import 'package:design_system/src/theme/ds_color_scheme.dart';

/// Design System theme extension attached to Flutter's [ThemeData].
@immutable
class DSThemeData extends ThemeExtension<DSThemeData> {
  /// Creates a theme extension with Design System specific values.
  const DSThemeData({required this.colors});

  /// Semantic colors available to Design System components.
  final DSColorScheme colors;

  /// Default Design System theme extension for light mode.
  static const light = DSThemeData(colors: DSColorScheme.light);

  /// Default Design System theme extension for dark mode.
  static const dark = DSThemeData(colors: DSColorScheme.dark);

  @override
  DSThemeData copyWith({DSColorScheme? colors}) {
    return DSThemeData(colors: colors ?? this.colors);
  }

  @override
  DSThemeData lerp(ThemeExtension<DSThemeData>? other, double t) {
    if (other is! DSThemeData) {
      return this;
    }

    return DSThemeData(colors: DSColorScheme.lerp(colors, other.colors, t));
  }
}

extension DSThemeBuildContext on BuildContext {
  /// Reads the nearest [DSThemeData] from the current Flutter theme.
  DSThemeData get dsTheme {
    final theme = Theme.of(this).extension<DSThemeData>();
    assert(
      theme != null,
      'DSThemeData was not found. Use DSTheme.light or DSTheme.dark.',
    );
    return theme ?? DSThemeData.light;
  }
}
