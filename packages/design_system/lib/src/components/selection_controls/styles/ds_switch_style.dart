import 'package:design_system/src/components/selection_controls/styles/ds_switch_size.dart';
import 'package:design_system/src/components/selection_controls/styles/ds_switch_size_style.dart';
import 'package:design_system/src/foundations/ds_border_width.dart';
import 'package:design_system/src/theme/ds_color_scheme.dart';
import 'package:flutter/material.dart';

class DSSwitchStyle {
  const DSSwitchStyle({
    required this.activeTrackColor,
    required this.activeThumbColor,
    required this.inactiveTrackColor,
    required this.inactiveThumbColor,
    required this.errorTrackColor,
    required this.errorThumbColor,
    required this.outlineColor,
    required this.disabledTrackColor,
    required this.disabledThumbColor,
    required this.labelColor,
    required this.supportingColor,
    required this.disabledTextColor,
    required this.sizeStyle,
  });

  final Color activeTrackColor;
  final Color activeThumbColor;
  final Color inactiveTrackColor;
  final Color inactiveThumbColor;
  final Color errorTrackColor;
  final Color errorThumbColor;
  final Color outlineColor;
  final Color disabledTrackColor;
  final Color disabledThumbColor;
  final Color labelColor;
  final Color supportingColor;
  final Color disabledTextColor;
  final DSSwitchSizeStyle sizeStyle;

  static DSSwitchStyle resolve({
    required DSColorScheme colors,
    DSSwitchSize size = DSSwitchSize.md,
  }) {
    return DSSwitchStyle(
      activeTrackColor: colors.primary,
      activeThumbColor: colors.onPrimary,
      inactiveTrackColor: colors.surface,
      inactiveThumbColor: colors.textDisabled,
      errorTrackColor: colors.error,
      errorThumbColor: colors.onError,
      outlineColor: colors.border,
      disabledTrackColor: colors.border,
      disabledThumbColor: colors.textDisabled,
      labelColor: colors.textPrimary,
      supportingColor: colors.textDisabled,
      disabledTextColor: colors.textDisabled,
      sizeStyle: DSSwitchSizeStyle.resolve(size),
    );
  }

  WidgetStateProperty<Color?> trackColor({required bool hasError}) {
    return WidgetStateProperty.resolveWith((states) {
      if (states.contains(WidgetState.disabled)) {
        return disabledTrackColor;
      }

      if (states.contains(WidgetState.selected)) {
        return hasError ? errorTrackColor : activeTrackColor;
      }

      return inactiveTrackColor;
    });
  }

  WidgetStateProperty<Color?> thumbColor({required bool hasError}) {
    return WidgetStateProperty.resolveWith((states) {
      if (states.contains(WidgetState.disabled)) {
        return disabledThumbColor;
      }

      if (states.contains(WidgetState.selected)) {
        return hasError ? errorThumbColor : activeThumbColor;
      }

      return inactiveThumbColor;
    });
  }

  WidgetStateProperty<Color?> trackOutlineColor({required bool hasError}) {
    return WidgetStateProperty.resolveWith((states) {
      if (states.contains(WidgetState.disabled)) {
        return disabledTrackColor;
      }

      if (hasError) {
        return errorTrackColor;
      }

      return outlineColor;
    });
  }

  WidgetStateProperty<double?> get trackOutlineWidth {
    return WidgetStateProperty.all(DSBorderWidth.thin);
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
              ? errorTrackColor
              : supportingColor,
    );
  }
}
