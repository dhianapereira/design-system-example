import 'package:design_system/src/components/selection_controls/styles/ds_switch_size.dart';
import 'package:design_system/src/foundations/ds_spacing.dart';
import 'package:design_system/src/foundations/ds_typography.dart';
import 'package:flutter/widgets.dart';

class DSSwitchSizeStyle {
  const DSSwitchSizeStyle({
    required this.controlWidth,
    required this.gap,
    required this.contentPadding,
    required this.labelTextStyle,
    required this.supportingTextStyle,
  });

  final double controlWidth;
  final double gap;
  final EdgeInsetsGeometry contentPadding;
  final TextStyle labelTextStyle;
  final TextStyle supportingTextStyle;

  double get scale => controlWidth / 52;

  static DSSwitchSizeStyle resolve(DSSwitchSize size) {
    return switch (size) {
      DSSwitchSize.sm => const DSSwitchSizeStyle(
          controlWidth: 44,
          gap: DSSpacing.sm,
          contentPadding: EdgeInsets.only(top: DSSpacing.sm),
          labelTextStyle: DSTypography.bodySmall,
          supportingTextStyle: DSTypography.bodySmall,
        ),
      DSSwitchSize.md => const DSSwitchSizeStyle(
          controlWidth: 52,
          gap: DSSpacing.md,
          contentPadding: EdgeInsets.only(top: DSSpacing.sm),
          labelTextStyle: DSTypography.bodyMedium,
          supportingTextStyle: DSTypography.bodySmall,
        ),
      DSSwitchSize.lg => const DSSwitchSizeStyle(
          controlWidth: 60,
          gap: DSSpacing.md,
          contentPadding: EdgeInsets.only(top: DSSpacing.sm),
          labelTextStyle: DSTypography.bodyLarge,
          supportingTextStyle: DSTypography.bodyMedium,
        ),
    };
  }
}
