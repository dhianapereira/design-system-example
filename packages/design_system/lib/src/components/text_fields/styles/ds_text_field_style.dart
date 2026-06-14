import 'package:design_system/src/components/text_fields/styles/ds_text_field_size.dart';
import 'package:design_system/src/components/text_fields/styles/ds_text_field_size_style.dart';
import 'package:design_system/src/components/text_fields/styles/ds_text_field_variant.dart';
import 'package:design_system/src/foundations/ds_border_width.dart';
import 'package:design_system/src/foundations/ds_radius.dart';
import 'package:design_system/src/foundations/ds_typography.dart';
import 'package:design_system/src/theme/ds_color_scheme.dart';
import 'package:flutter/material.dart';

/// Visual values resolved for a [DSTextField].
class DSTextFieldStyle {
  const DSTextFieldStyle({
    required this.backgroundColor,
    required this.borderColor,
    required this.disabledBorderColor,
    required this.focusColor,
    required this.errorColor,
    required this.textColor,
    required this.hintColor,
    required this.disabledTextColor,
    required this.sizeStyle,
  });

  final Color backgroundColor;
  final Color borderColor;
  final Color disabledBorderColor;
  final Color focusColor;
  final Color errorColor;
  final Color textColor;
  final Color hintColor;
  final Color disabledTextColor;
  final DSTextFieldSizeStyle sizeStyle;

  TextStyle get textStyle => DSTypography.bodyMedium.copyWith(
        color: textColor,
      );

  static DSTextFieldStyle resolve({
    required DSTextFieldVariant variant,
    required DSColorScheme colors,
    DSTextFieldSize size = DSTextFieldSize.md,
  }) {
    return DSTextFieldStyle(
      backgroundColor: switch (variant) {
        DSTextFieldVariant.outline => Colors.transparent,
        DSTextFieldVariant.filled => colors.surface,
      },
      borderColor: colors.border,
      disabledBorderColor: colors.border,
      focusColor: colors.focus,
      errorColor: colors.error,
      textColor: colors.textPrimary,
      hintColor: colors.textDisabled,
      disabledTextColor: colors.textDisabled,
      sizeStyle: DSTextFieldSizeStyle.resolve(size),
    );
  }

  InputDecoration toInputDecoration({
    required String? label,
    required String? hintText,
    required String? helperText,
    required String? errorText,
    required Widget? prefixIcon,
    required Widget? suffixIcon,
  }) {
    return InputDecoration(
      labelText: label,
      hintText: hintText,
      helperText: helperText,
      errorText: errorText,
      filled: backgroundColor != Colors.transparent,
      fillColor: backgroundColor,
      labelStyle: DSTypography.bodyMedium.copyWith(color: hintColor),
      floatingLabelStyle: DSTypography.bodyMedium.copyWith(color: focusColor),
      hintStyle: DSTypography.bodyMedium.copyWith(color: hintColor),
      helperStyle: DSTypography.bodySmall.copyWith(color: hintColor),
      errorStyle: DSTypography.bodySmall.copyWith(color: errorColor),
      prefixIcon: prefixIcon == null ? null : _iconTheme(prefixIcon),
      suffixIcon: suffixIcon == null ? null : _iconTheme(suffixIcon),
      prefixIconConstraints: _iconConstraints,
      suffixIconConstraints: _iconConstraints,
      contentPadding: EdgeInsets.symmetric(
        horizontal: sizeStyle.horizontalPadding,
        vertical: sizeStyle.verticalPadding,
      ),
      enabledBorder: _border(borderColor),
      focusedBorder: _border(focusColor),
      errorBorder: _border(errorColor),
      focusedErrorBorder: _border(errorColor),
      disabledBorder: _border(disabledBorderColor),
    );
  }

  BoxConstraints get _iconConstraints {
    return BoxConstraints(
      minWidth: sizeStyle.minHeight,
      minHeight: sizeStyle.minHeight,
    );
  }

  Widget _iconTheme(Widget icon) {
    return IconTheme.merge(
      data: IconThemeData(color: hintColor, size: sizeStyle.iconSize),
      child: icon,
    );
  }

  OutlineInputBorder _border(Color color) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(DSRadius.md),
      borderSide: BorderSide(color: color, width: DSBorderWidth.thin),
    );
  }
}
