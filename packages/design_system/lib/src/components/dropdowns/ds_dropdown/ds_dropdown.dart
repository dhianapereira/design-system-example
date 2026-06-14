import 'package:design_system/src/components/dropdowns/ds_dropdown/ds_dropdown_item.dart';
import 'package:design_system/src/components/dropdowns/styles/ds_dropdown_size.dart';
import 'package:design_system/src/components/dropdowns/styles/ds_dropdown_style.dart';
import 'package:design_system/src/components/dropdowns/styles/ds_dropdown_variant.dart';
import 'package:design_system/src/foundations/ds_size.dart';
import 'package:design_system/src/theme/ds_theme_data.dart';
import 'package:flutter/material.dart';

/// Dropdown field component that follows Design System form patterns.
class DSDropdown<T> extends StatelessWidget {
  /// Creates a Design System dropdown.
  const DSDropdown({
    required this.items,
    required this.onChanged,
    super.key,
    this.value,
    this.label,
    this.hintText,
    this.helperText,
    this.errorText,
    this.semanticLabel,
    this.variant = DSDropdownVariant.outline,
    this.size = DSDropdownSize.md,
    this.enabled = true,
    this.prefixIcon,
    this.menuMaxHeight,
    this.alignment = AlignmentDirectional.centerStart,
  });

  /// Options displayed by the dropdown menu.
  final List<DSDropdownItem<T>> items;

  /// Currently selected value.
  final T? value;

  /// Called when a new option is selected.
  final ValueChanged<T?>? onChanged;

  /// Label shown above the selected value when focused or filled.
  final String? label;

  /// Placeholder text shown when no value is selected.
  final String? hintText;

  /// Supporting text shown below the field.
  final String? helperText;

  /// Error message shown below the field.
  final String? errorText;

  /// Accessibility label used when the visible label is not descriptive enough.
  final String? semanticLabel;

  /// Visual treatment used by the dropdown.
  final DSDropdownVariant variant;

  /// Dimensional treatment used by the dropdown.
  final DSDropdownSize size;

  /// Whether the dropdown accepts interaction.
  final bool enabled;

  /// Icon rendered before the selected value.
  final Widget? prefixIcon;

  /// Maximum height of the opened menu.
  final double? menuMaxHeight;

  /// Alignment used by the selected value and menu entries.
  final AlignmentGeometry alignment;

  bool get _isEnabled => enabled && onChanged != null && items.isNotEmpty;

  @override
  Widget build(BuildContext context) {
    final style = DSDropdownStyle.resolve(
      variant: variant,
      size: size,
      colors: context.dsTheme.colors,
    );

    final dropdown = DropdownButtonFormField<T>(
      initialValue: value,
      items: items.map((item) => item.toDropdownMenuItem(style)).toList(),
      onChanged: _isEnabled ? onChanged : null,
      isExpanded: true,
      menuMaxHeight: menuMaxHeight,
      alignment: alignment,
      style: style.textStyle,
      icon: Icon(
        Icons.keyboard_arrow_down,
        color: _isEnabled ? style.hintColor : style.disabledTextColor,
        size: DSSize.iconMd,
      ),
      decoration: style.toInputDecoration(
        label: label,
        hintText: hintText,
        helperText: helperText,
        errorText: errorText,
        prefixIcon: prefixIcon,
      ),
    );

    return Semantics(
      button: true,
      enabled: _isEnabled,
      label: semanticLabel,
      child: dropdown,
    );
  }
}
