import 'package:design_system/src/components/badges/styles/ds_badge_size.dart';
import 'package:design_system/src/components/badges/styles/ds_badge_size_style.dart';
import 'package:design_system/src/components/badges/styles/ds_badge_variant.dart';
import 'package:design_system/src/foundations/ds_border_width.dart';
import 'package:design_system/src/foundations/ds_radius.dart';
import 'package:design_system/src/theme/ds_color_scheme.dart';
import 'package:flutter/material.dart';

class DSBadgeStyle {
  const DSBadgeStyle({
    required this.backgroundColor,
    required this.foregroundColor,
    required this.borderColor,
    required this.sizeStyle,
  });

  final Color backgroundColor;
  final Color foregroundColor;
  final Color borderColor;
  final DSBadgeSizeStyle sizeStyle;

  static DSBadgeStyle resolve({
    required DSBadgeVariant variant,
    required DSColorScheme colors,
    DSBadgeSize size = DSBadgeSize.md,
  }) {
    return switch (variant) {
      DSBadgeVariant.neutral => DSBadgeStyle(
          backgroundColor: colors.surface,
          foregroundColor: colors.textPrimary,
          borderColor: colors.border,
          sizeStyle: DSBadgeSizeStyle.resolve(size),
        ),
      DSBadgeVariant.primary => DSBadgeStyle(
          backgroundColor: colors.primary,
          foregroundColor: colors.onPrimary,
          borderColor: colors.primary,
          sizeStyle: DSBadgeSizeStyle.resolve(size),
        ),
      DSBadgeVariant.secondary => DSBadgeStyle(
          backgroundColor: colors.secondary,
          foregroundColor: colors.onSecondary,
          borderColor: colors.secondary,
          sizeStyle: DSBadgeSizeStyle.resolve(size),
        ),
      DSBadgeVariant.error => DSBadgeStyle(
          backgroundColor: colors.error,
          foregroundColor: colors.onError,
          borderColor: colors.error,
          sizeStyle: DSBadgeSizeStyle.resolve(size),
        ),
    };
  }

  BoxDecoration toDecoration() {
    return BoxDecoration(
      color: backgroundColor,
      border: Border.all(
        color: borderColor,
        width: DSBorderWidth.thin,
      ),
      borderRadius: BorderRadius.circular(DSRadius.pill),
    );
  }

  TextStyle get textStyle {
    return sizeStyle.textStyle.copyWith(color: foregroundColor);
  }
}
