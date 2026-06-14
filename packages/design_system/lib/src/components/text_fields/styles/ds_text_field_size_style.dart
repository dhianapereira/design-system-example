import 'package:design_system/src/components/text_fields/styles/ds_text_field_size.dart';
import 'package:design_system/src/foundations/ds_size.dart';
import 'package:design_system/src/foundations/ds_spacing.dart';

/// Spacing and sizing values resolved from a [DSTextFieldSize].
class DSTextFieldSizeStyle {
  const DSTextFieldSizeStyle({
    required this.minHeight,
    required this.horizontalPadding,
    required this.verticalPadding,
    required this.iconSize,
  });

  final double minHeight;
  final double horizontalPadding;
  final double verticalPadding;
  final double iconSize;

  static DSTextFieldSizeStyle resolve(DSTextFieldSize size) {
    return switch (size) {
      DSTextFieldSize.sm => const DSTextFieldSizeStyle(
          minHeight: DSSize.controlSm,
          horizontalPadding: DSSpacing.md,
          verticalPadding: DSSpacing.xs,
          iconSize: DSSize.iconSm,
        ),
      DSTextFieldSize.md => const DSTextFieldSizeStyle(
          minHeight: DSSize.controlMd,
          horizontalPadding: DSSpacing.lg,
          verticalPadding: DSSpacing.sm,
          iconSize: DSSize.iconMd,
        ),
      DSTextFieldSize.lg => const DSTextFieldSizeStyle(
          minHeight: DSSize.controlLg,
          horizontalPadding: DSSpacing.xl,
          verticalPadding: DSSpacing.md,
          iconSize: DSSize.iconLg,
        ),
    };
  }
}
