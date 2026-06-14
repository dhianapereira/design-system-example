import 'package:design_system/src/theme/ds_theme_data.dart';
import 'package:flutter/widgets.dart';

/// Semantic color options supported by [DSText].
enum DSTextColor {
  /// Default text color for body content and headings.
  primary,

  /// Muted text color for disabled or unavailable content.
  disabled,

  /// Brand color for actionable or highlighted text.
  action,

  /// Text color used on top of primary surfaces.
  onPrimary,

  /// Text color used on top of secondary surfaces.
  onSecondary;

  /// Resolves this token using the nearest Design System theme.
  Color resolve(BuildContext context) {
    final colors = context.dsTheme.colors;

    return switch (this) {
      DSTextColor.primary => colors.textPrimary,
      DSTextColor.disabled => colors.textDisabled,
      DSTextColor.action => colors.primary,
      DSTextColor.onPrimary => colors.onPrimary,
      DSTextColor.onSecondary => colors.onSecondary,
    };
  }
}
