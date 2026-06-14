import 'package:design_system/src/components/dropdowns/styles/ds_dropdown_size.dart';
import 'package:design_system/src/foundations/ds_size.dart';
import 'package:design_system/src/foundations/ds_spacing.dart';

/// Spacing and sizing values resolved from a [DSDropdownSize].
class DSDropdownSizeStyle {
  const DSDropdownSizeStyle({
    required this.minHeight,
    required this.horizontalPadding,
    required this.verticalPadding,
    required this.iconSize,
  });

  final double minHeight;
  final double horizontalPadding;
  final double verticalPadding;
  final double iconSize;

  static DSDropdownSizeStyle resolve(DSDropdownSize size) {
    return switch (size) {
      DSDropdownSize.sm => const DSDropdownSizeStyle(
          minHeight: DSSize.controlSm,
          horizontalPadding: DSSpacing.md,
          verticalPadding: DSSpacing.xs,
          iconSize: DSSize.iconSm,
        ),
      DSDropdownSize.md => const DSDropdownSizeStyle(
          minHeight: DSSize.controlMd,
          horizontalPadding: DSSpacing.lg,
          verticalPadding: DSSpacing.sm,
          iconSize: DSSize.iconMd,
        ),
      DSDropdownSize.lg => const DSDropdownSizeStyle(
          minHeight: DSSize.controlLg,
          horizontalPadding: DSSpacing.xl,
          verticalPadding: DSSpacing.md,
          iconSize: DSSize.iconLg,
        ),
    };
  }
}
