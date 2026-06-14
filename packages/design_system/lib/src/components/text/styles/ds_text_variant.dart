import 'package:design_system/src/foundations/ds_typography.dart';
import 'package:flutter/widgets.dart';

/// Typography variants supported by [DSText].
enum DSTextVariant {
  /// Largest display text style.
  displayLarge,

  /// Medium display text style.
  displayMedium,

  /// Small display text style.
  displaySmall,

  /// Large headline text style.
  headlineLarge,

  /// Medium headline text style.
  headlineMedium,

  /// Small headline text style.
  headlineSmall,

  /// Large title text style.
  titleLarge,

  /// Medium title text style.
  titleMedium,

  /// Small title text style.
  titleSmall,

  /// Large label text style.
  labelLarge,

  /// Medium label text style.
  labelMedium,

  /// Small label text style.
  labelSmall,

  /// Large body text style.
  bodyLarge,

  /// Medium body text style.
  bodyMedium,

  /// Small body text style.
  bodySmall;

  /// Text style token associated with this variant.
  TextStyle get style {
    return switch (this) {
      DSTextVariant.displayLarge => DSTypography.displayLarge,
      DSTextVariant.displayMedium => DSTypography.displayMedium,
      DSTextVariant.displaySmall => DSTypography.displaySmall,
      DSTextVariant.headlineLarge => DSTypography.headlineLarge,
      DSTextVariant.headlineMedium => DSTypography.headlineMedium,
      DSTextVariant.headlineSmall => DSTypography.headlineSmall,
      DSTextVariant.titleLarge => DSTypography.titleLarge,
      DSTextVariant.titleMedium => DSTypography.titleMedium,
      DSTextVariant.titleSmall => DSTypography.titleSmall,
      DSTextVariant.labelLarge => DSTypography.labelLarge,
      DSTextVariant.labelMedium => DSTypography.labelMedium,
      DSTextVariant.labelSmall => DSTypography.labelSmall,
      DSTextVariant.bodyLarge => DSTypography.bodyLarge,
      DSTextVariant.bodyMedium => DSTypography.bodyMedium,
      DSTextVariant.bodySmall => DSTypography.bodySmall,
    };
  }
}
