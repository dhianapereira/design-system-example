import 'package:design_system/src/components/selection_controls/styles/ds_radio_size.dart';
import 'package:design_system/src/components/selection_controls/styles/ds_radio_size_style.dart';
import 'package:design_system/src/foundations/ds_border_width.dart';
import 'package:design_system/src/theme/ds_color_scheme.dart';
import 'package:flutter/material.dart';

class DSRadioStyle {
  const DSRadioStyle({
    required this.activeColor,
    required this.inactiveColor,
    required this.errorColor,
    required this.disabledColor,
    required this.labelColor,
    required this.supportingColor,
    required this.disabledTextColor,
    required this.sizeStyle,
  });

  final Color activeColor;
  final Color inactiveColor;
  final Color errorColor;
  final Color disabledColor;
  final Color labelColor;
  final Color supportingColor;
  final Color disabledTextColor;
  final DSRadioSizeStyle sizeStyle;

  static DSRadioStyle resolve({
    required DSColorScheme colors,
    DSRadioSize size = DSRadioSize.md,
  }) {
    return DSRadioStyle(
      activeColor: colors.primary,
      inactiveColor: colors.border,
      errorColor: colors.error,
      disabledColor: colors.border,
      labelColor: colors.textPrimary,
      supportingColor: colors.textDisabled,
      disabledTextColor: colors.textDisabled,
      sizeStyle: DSRadioSizeStyle.resolve(size),
    );
  }

  WidgetStateProperty<Color?> fillColor({required bool hasError}) {
    return WidgetStateProperty.resolveWith((states) {
      if (states.contains(WidgetState.disabled)) {
        return disabledColor;
      }

      if (hasError) {
        return errorColor;
      }

      if (states.contains(WidgetState.selected)) {
        return activeColor;
      }

      return inactiveColor;
    });
  }

  BorderSide side({
    required bool enabled,
    required bool hasError,
  }) {
    return BorderSide(
      color: !enabled
          ? disabledColor
          : hasError
              ? errorColor
              : inactiveColor,
      width: DSBorderWidth.thin,
    );
  }

  TextStyle labelTextStyle({required bool enabled}) {
    return sizeStyle.labelTextStyle.copyWith(
      color: enabled ? labelColor : disabledTextColor,
    );
  }

  TextStyle supportingTextStyle({
    required bool enabled,
    required bool hasError,
  }) {
    return sizeStyle.supportingTextStyle.copyWith(
      color: !enabled
          ? disabledTextColor
          : hasError
              ? errorColor
              : supportingColor,
    );
  }
}
