import 'package:design_system/src/components/dropdowns/styles/ds_dropdown_style.dart';
import 'package:flutter/material.dart';

/// Option displayed by a [DSDropdown].
class DSDropdownItem<T> {
  /// Creates a dropdown item.
  const DSDropdownItem({
    required this.value,
    required this.label,
    this.child,
    this.enabled = true,
  });

  /// Value emitted when the item is selected.
  final T value;

  /// Text used by default to render the item.
  final String label;

  /// Custom item content used when the label is not enough.
  final Widget? child;

  /// Whether this item can be selected.
  final bool enabled;

  DropdownMenuItem<T> toDropdownMenuItem(DSDropdownStyle style) {
    return DropdownMenuItem<T>(
      value: value,
      enabled: enabled,
      child: DefaultTextStyle.merge(
        style: enabled
            ? style.textStyle
            : style.textStyle.copyWith(color: style.disabledTextColor),
        child: child ?? Text(label),
      ),
    );
  }
}
