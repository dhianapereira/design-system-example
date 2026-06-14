import 'package:design_system/src/components/badges/styles/ds_badge_size.dart';
import 'package:design_system/src/foundations/ds_size.dart';
import 'package:design_system/src/foundations/ds_spacing.dart';
import 'package:design_system/src/foundations/ds_typography.dart';
import 'package:flutter/widgets.dart';

class DSBadgeSizeStyle {
  const DSBadgeSizeStyle({
    required this.minHeight,
    required this.horizontalPadding,
    required this.verticalPadding,
    required this.iconSize,
    required this.gap,
    required this.textStyle,
  });

  final double minHeight;
  final double horizontalPadding;
  final double verticalPadding;
  final double iconSize;
  final double gap;
  final TextStyle textStyle;

  static DSBadgeSizeStyle resolve(DSBadgeSize size) {
    return switch (size) {
      DSBadgeSize.sm => const DSBadgeSizeStyle(
          minHeight: 20,
          horizontalPadding: DSSpacing.sm,
          verticalPadding: DSSpacing.xxs,
          iconSize: DSSize.iconXs,
          gap: DSSpacing.xs,
          textStyle: DSTypography.labelSmall,
        ),
      DSBadgeSize.md => const DSBadgeSizeStyle(
          minHeight: 24,
          horizontalPadding: DSSpacing.md,
          verticalPadding: DSSpacing.xs,
          iconSize: DSSize.iconSm,
          gap: DSSpacing.xs,
          textStyle: DSTypography.labelSmall,
        ),
      DSBadgeSize.lg => const DSBadgeSizeStyle(
          minHeight: 28,
          horizontalPadding: DSSpacing.md,
          verticalPadding: DSSpacing.xs,
          iconSize: DSSize.iconSm,
          gap: DSSpacing.sm,
          textStyle: DSTypography.labelMedium,
        ),
    };
  }
}
