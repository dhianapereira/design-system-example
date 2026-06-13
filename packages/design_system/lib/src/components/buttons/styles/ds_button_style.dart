import 'package:design_system/src/components/buttons/styles/ds_button_size.dart';
import 'package:design_system/src/components/buttons/styles/ds_button_size_style.dart';
import 'package:design_system/src/components/buttons/styles/ds_button_variant.dart';
import 'package:design_system/src/foundations/ds_border_width.dart';
import 'package:design_system/src/foundations/ds_radius.dart';
import 'package:design_system/src/foundations/ds_typography.dart';
import 'package:design_system/src/theme/ds_color_scheme.dart';
import 'package:flutter/material.dart';

class DSButtonStyle {
  const DSButtonStyle({
    required this.backgroundColor,
    required this.foregroundColor,
    required this.disabledBackgroundColor,
    required this.disabledForegroundColor,
    required this.sizeStyle,
    this.borderColor,
  });

  final Color backgroundColor;
  final Color foregroundColor;
  final Color disabledBackgroundColor;
  final Color disabledForegroundColor;
  final DSButtonSizeStyle sizeStyle;
  final Color? borderColor;

  static DSButtonStyle resolve({
    required DSButtonVariant variant,
    required DSColorScheme colors,
    DSButtonSize size = DSButtonSize.md,
  }) {
    return switch (variant) {
      DSButtonVariant.primary => DSButtonStyle(
          backgroundColor: colors.primary,
          foregroundColor: colors.onPrimary,
          disabledBackgroundColor: colors.border,
          disabledForegroundColor: colors.textDisabled,
          sizeStyle: DSButtonSizeStyle.resolve(size),
        ),
      DSButtonVariant.secondary => DSButtonStyle(
          backgroundColor: colors.secondary,
          foregroundColor: colors.onSecondary,
          disabledBackgroundColor: colors.border,
          disabledForegroundColor: colors.textDisabled,
          sizeStyle: DSButtonSizeStyle.resolve(size),
        ),
      DSButtonVariant.outline => DSButtonStyle(
          backgroundColor: Colors.transparent,
          foregroundColor: colors.primary,
          disabledBackgroundColor: Colors.transparent,
          disabledForegroundColor: colors.textDisabled,
          sizeStyle: DSButtonSizeStyle.resolve(size),
          borderColor: colors.primary,
        ),
    };
  }

  ButtonStyle toFilledButtonStyle() {
    return FilledButton.styleFrom(
      backgroundColor: backgroundColor,
      foregroundColor: foregroundColor,
      disabledBackgroundColor: disabledBackgroundColor,
      disabledForegroundColor: disabledForegroundColor,
      minimumSize: Size(
        sizeStyle.minHeight,
        sizeStyle.minHeight,
      ),
      padding: EdgeInsets.symmetric(
        horizontal: sizeStyle.horizontalPadding,
        vertical: sizeStyle.verticalPadding,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(DSRadius.md),
      ),
      textStyle: DSTypography.labelLarge,
    );
  }

  ButtonStyle toOutlinedButtonStyle() {
    return OutlinedButton.styleFrom(
      backgroundColor: backgroundColor,
      foregroundColor: foregroundColor,
      disabledForegroundColor: disabledForegroundColor,
      minimumSize: Size(
        sizeStyle.minHeight,
        sizeStyle.minHeight,
      ),
      padding: EdgeInsets.symmetric(
        horizontal: sizeStyle.horizontalPadding,
        vertical: sizeStyle.verticalPadding,
      ),
      side: BorderSide(
        color: borderColor ?? foregroundColor,
        width: DSBorderWidth.thin,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(DSRadius.md),
      ),
      textStyle: DSTypography.labelLarge,
    );
  }

  ButtonStyle toIconButtonStyle() {
    return IconButton.styleFrom(
      backgroundColor: backgroundColor,
      foregroundColor: foregroundColor,
      disabledBackgroundColor: disabledBackgroundColor,
      disabledForegroundColor: disabledForegroundColor,
      fixedSize: Size.square(sizeStyle.iconButtonSize),
      minimumSize: Size.square(sizeStyle.iconButtonSize),
      side: borderColor == null
          ? null
          : BorderSide(
              color: borderColor!,
              width: DSBorderWidth.thin,
            ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(DSRadius.md),
      ),
    );
  }
}
