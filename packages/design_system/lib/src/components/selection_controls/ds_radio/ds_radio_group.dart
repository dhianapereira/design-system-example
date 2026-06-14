import 'package:design_system/src/components/selection_controls/ds_radio/ds_radio.dart';
import 'package:design_system/src/components/selection_controls/styles/ds_radio_size.dart';
import 'package:design_system/src/components/selection_controls/styles/ds_radio_style.dart';
import 'package:design_system/src/foundations/ds_spacing.dart';
import 'package:design_system/src/theme/ds_theme_data.dart';
import 'package:flutter/material.dart';

/// Describes one option rendered by a [DSRadioGroup].
@immutable
class DSRadioGroupItem<T> {
  /// Creates a radio group option.
  const DSRadioGroupItem({
    required this.value,
    required this.label,
    this.helperText,
    this.semanticLabel,
    this.enabled = true,
  });

  /// Value represented by this option.
  final T value;

  /// Label shown next to this option.
  final String label;

  /// Supporting text shown below this option.
  final String? helperText;

  /// Accessibility label used when [label] is not descriptive enough.
  final String? semanticLabel;

  /// Whether this option accepts interaction.
  final bool enabled;
}

/// Layout directions supported by [DSRadioGroup].
enum DSRadioGroupAxis {
  /// Stacks options vertically.
  vertical,

  /// Places options horizontally and wraps when needed.
  horizontal,
}

/// Radio group component that renders a mutually exclusive set of options.
class DSRadioGroup<T> extends StatelessWidget {
  /// Creates a Design System radio group.
  const DSRadioGroup({
    required this.items,
    required this.value,
    required this.onChanged,
    super.key,
    this.label,
    this.helperText,
    this.errorText,
    this.semanticLabel,
    this.size = DSRadioSize.md,
    this.enabled = true,
    this.toggleable = false,
    this.axis = DSRadioGroupAxis.vertical,
    this.spacing = DSSpacing.xs,
  });

  /// Options rendered inside this group.
  final List<DSRadioGroupItem<T>> items;

  /// Currently selected value.
  final T? value;

  /// Called when an option is selected.
  final ValueChanged<T?>? onChanged;

  /// Label shown above the group.
  final String? label;

  /// Supporting text shown below the group.
  final String? helperText;

  /// Error message shown below the group.
  final String? errorText;

  /// Accessibility label used when the visible label is not descriptive enough.
  final String? semanticLabel;

  /// Dimensional treatment used by the group options.
  final DSRadioSize size;

  /// Whether the group accepts interaction.
  final bool enabled;

  /// Whether selecting the already selected option clears the group value.
  final bool toggleable;

  /// Direction used to lay out options.
  final DSRadioGroupAxis axis;

  /// Spacing between options.
  final double spacing;

  bool get _isEnabled => enabled && onChanged != null;

  bool get _hasError => errorText != null;

  @override
  Widget build(BuildContext context) {
    final style = DSRadioStyle.resolve(
      colors: context.dsTheme.colors,
      size: size,
    );
    final supportingText = errorText ?? helperText;
    final options = [
      for (final item in items)
        DSRadio<T>(
          value: item.value,
          groupValue: value,
          onChanged: _isEnabled && item.enabled ? onChanged : null,
          label: item.label,
          helperText: item.helperText,
          semanticLabel: item.semanticLabel,
          size: size,
          enabled: enabled && item.enabled,
          isError: _hasError,
          toggleable: toggleable,
          expandContent:
              axis == DSRadioGroupAxis.vertical || item.helperText != null,
        ),
    ];

    return Semantics(
      container: true,
      label: semanticLabel,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (label != null) ...[
            Text(
              label!,
              style: style.labelTextStyle(enabled: _isEnabled),
            ),
            const SizedBox(height: DSSpacing.xs),
          ],
          _OptionsLayout(
            axis: axis,
            spacing: spacing,
            children: options,
          ),
          if (supportingText != null) ...[
            const SizedBox(height: DSSpacing.xs),
            Text(
              supportingText,
              style: style.supportingTextStyle(
                enabled: _isEnabled,
                hasError: _hasError,
              ),
            ),
          ],
        ],
      ),
    );
  }
}

class _OptionsLayout extends StatelessWidget {
  const _OptionsLayout({
    required this.axis,
    required this.spacing,
    required this.children,
  });

  final DSRadioGroupAxis axis;
  final double spacing;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return switch (axis) {
      DSRadioGroupAxis.vertical => Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            for (final (index, child) in children.indexed) ...[
              child,
              if (index < children.length - 1) SizedBox(height: spacing),
            ],
          ],
        ),
      DSRadioGroupAxis.horizontal => Wrap(
          spacing: spacing,
          runSpacing: spacing,
          crossAxisAlignment: WrapCrossAlignment.start,
          children: children,
        ),
    };
  }
}
