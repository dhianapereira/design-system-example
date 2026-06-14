import 'package:design_system/src/components/selection_controls/styles/ds_checkbox_size.dart';
import 'package:design_system/src/components/selection_controls/styles/ds_checkbox_size_style.dart';
import 'package:design_system/src/foundations/ds_border_width.dart';
import 'package:design_system/src/theme/ds_color_scheme.dart';
import 'package:flutter/material.dart';

class DSCheckboxStyle {
  const DSCheckboxStyle({
    required this.activeColor,
    required this.checkColor,
    required this.errorColor,
    required this.errorCheckColor,
    required this.borderColor,
    required this.disabledBorderColor,
    required this.disabledFillColor,
    required this.labelColor,
    required this.supportingColor,
    required this.disabledTextColor,
    required this.sizeStyle,
  });

  final Color activeColor;
  final Color checkColor;
  final Color errorColor;
  final Color errorCheckColor;
  final Color borderColor;
  final Color disabledBorderColor;
  final Color disabledFillColor;
  final Color labelColor;
  final Color supportingColor;
  final Color disabledTextColor;
  final DSCheckboxSizeStyle sizeStyle;

  static DSCheckboxStyle resolve({
    required DSColorScheme colors,
    DSCheckboxSize size = DSCheckboxSize.md,
  }) {
    return DSCheckboxStyle(
      activeColor: colors.primary,
      checkColor: colors.onPrimary,
      errorColor: colors.error,
      errorCheckColor: colors.onError,
      borderColor: colors.border,
      disabledBorderColor: colors.border,
      disabledFillColor: colors.border,
      labelColor: colors.textPrimary,
      supportingColor: colors.textDisabled,
      disabledTextColor: colors.textDisabled,
      sizeStyle: DSCheckboxSizeStyle.resolve(size),
    );
  }

  WidgetStateProperty<Color?> fillColor({required bool hasError}) {
    return WidgetStateProperty.resolveWith((states) {
      if (states.contains(WidgetState.disabled)) {
        return states.contains(WidgetState.selected)
            ? disabledFillColor
            : Colors.transparent;
      }

      if (states.contains(WidgetState.selected)) {
        return hasError ? errorColor : activeColor;
      }

      return Colors.transparent;
    });
  }

  BorderSide side({
    required bool enabled,
    required bool hasError,
  }) {
    return BorderSide(
      color: !enabled
          ? disabledBorderColor
          : hasError
              ? errorColor
              : borderColor,
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
