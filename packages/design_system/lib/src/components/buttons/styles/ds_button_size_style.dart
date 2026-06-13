import 'package:design_system/src/components/buttons/styles/ds_button_size.dart';
import 'package:design_system/src/foundations/ds_size.dart';
import 'package:design_system/src/foundations/ds_spacing.dart';

class DSButtonSizeStyle {
  const DSButtonSizeStyle({
    required this.minHeight,
    required this.horizontalPadding,
    required this.verticalPadding,
    required this.iconSize,
    required this.gap,
  });

  final double minHeight;
  final double horizontalPadding;
  final double verticalPadding;
  final double iconSize;
  final double gap;

  double get iconButtonSize => minHeight;

  static DSButtonSizeStyle resolve(DSButtonSize size) {
    return switch (size) {
      DSButtonSize.sm => const DSButtonSizeStyle(
          minHeight: DSSize.controlSm,
          horizontalPadding: DSSpacing.md,
          verticalPadding: DSSpacing.xs,
          iconSize: DSSize.iconSm,
          gap: DSSpacing.xs,
        ),
      DSButtonSize.md => const DSButtonSizeStyle(
          minHeight: DSSize.controlMd,
          horizontalPadding: DSSpacing.lg,
          verticalPadding: DSSpacing.sm,
          iconSize: DSSize.iconMd,
          gap: DSSpacing.sm,
        ),
      DSButtonSize.lg => const DSButtonSizeStyle(
          minHeight: DSSize.controlLg,
          horizontalPadding: DSSpacing.xl,
          verticalPadding: DSSpacing.md,
          iconSize: DSSize.iconLg,
          gap: DSSpacing.sm,
        ),
    };
  }
}
