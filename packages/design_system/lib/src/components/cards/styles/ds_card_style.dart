import 'package:design_system/src/components/cards/styles/ds_card_padding.dart';
import 'package:design_system/src/components/cards/styles/ds_card_variant.dart';
import 'package:design_system/src/foundations/ds_border_width.dart';
import 'package:design_system/src/foundations/ds_elevation.dart';
import 'package:design_system/src/foundations/ds_radius.dart';
import 'package:design_system/src/foundations/ds_spacing.dart';
import 'package:design_system/src/theme/ds_color_scheme.dart';
import 'package:flutter/material.dart';

class DSCardStyle {
  const DSCardStyle({
    required this.backgroundColor,
    required this.borderColor,
    required this.elevation,
    required this.padding,
  });

  final Color backgroundColor;
  final Color borderColor;
  final double elevation;
  final EdgeInsetsGeometry padding;

  static DSCardStyle resolve({
    required DSCardVariant variant,
    required DSColorScheme colors,
    DSCardPadding padding = DSCardPadding.md,
  }) {
    return switch (variant) {
      DSCardVariant.outlined => DSCardStyle(
          backgroundColor: colors.surface,
          borderColor: colors.border,
          elevation: DSElevation.none,
          padding: _resolvePadding(padding),
        ),
      DSCardVariant.elevated => DSCardStyle(
          backgroundColor: colors.surface,
          borderColor: Colors.transparent,
          elevation: DSElevation.sm,
          padding: _resolvePadding(padding),
        ),
      DSCardVariant.filled => DSCardStyle(
          backgroundColor: colors.secondary,
          borderColor: Colors.transparent,
          elevation: DSElevation.none,
          padding: _resolvePadding(padding),
        ),
    };
  }

  ShapeBorder get shape {
    return RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(DSRadius.md),
      side: BorderSide(
        color: borderColor,
        width: borderColor == Colors.transparent
            ? DSBorderWidth.none
            : DSBorderWidth.thin,
      ),
    );
  }

  static EdgeInsetsGeometry _resolvePadding(DSCardPadding padding) {
    return switch (padding) {
      DSCardPadding.none => EdgeInsets.zero,
      DSCardPadding.sm => const EdgeInsets.all(DSSpacing.md),
      DSCardPadding.md => const EdgeInsets.all(DSSpacing.lg),
      DSCardPadding.lg => const EdgeInsets.all(DSSpacing.xl),
    };
  }
}
