import 'package:design_system/src/components/selection_controls/styles/ds_radio_size.dart';
import 'package:design_system/src/foundations/ds_size.dart';
import 'package:design_system/src/foundations/ds_spacing.dart';
import 'package:design_system/src/foundations/ds_typography.dart';
import 'package:flutter/widgets.dart';

class DSRadioSizeStyle {
  const DSRadioSizeStyle({
    required this.controlSize,
    required this.gap,
    required this.contentPadding,
    required this.labelTextStyle,
    required this.supportingTextStyle,
  });

  final double controlSize;
  final double gap;
  final EdgeInsetsGeometry contentPadding;
  final TextStyle labelTextStyle;
  final TextStyle supportingTextStyle;

  double get scale => controlSize / 20;

  static DSRadioSizeStyle resolve(DSRadioSize size) {
    return switch (size) {
      DSRadioSize.sm => const DSRadioSizeStyle(
          controlSize: DSSize.iconSm,
          gap: DSSpacing.sm,
          contentPadding: EdgeInsets.only(top: DSSpacing.sm),
          labelTextStyle: DSTypography.bodySmall,
          supportingTextStyle: DSTypography.bodySmall,
        ),
      DSRadioSize.md => const DSRadioSizeStyle(
          controlSize: DSSize.iconMd,
          gap: DSSpacing.md,
          contentPadding: EdgeInsets.only(top: DSSpacing.sm),
          labelTextStyle: DSTypography.bodyMedium,
          supportingTextStyle: DSTypography.bodySmall,
        ),
      DSRadioSize.lg => const DSRadioSizeStyle(
          controlSize: DSSize.iconLg,
          gap: DSSpacing.md,
          contentPadding: EdgeInsets.only(top: DSSpacing.sm),
          labelTextStyle: DSTypography.bodyLarge,
          supportingTextStyle: DSTypography.bodyMedium,
        ),
    };
  }
}
