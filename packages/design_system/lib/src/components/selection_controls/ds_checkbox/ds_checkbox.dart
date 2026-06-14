import 'package:design_system/src/components/selection_controls/styles/ds_checkbox_size.dart';
import 'package:design_system/src/components/selection_controls/styles/ds_checkbox_style.dart';
import 'package:design_system/src/foundations/ds_radius.dart';
import 'package:design_system/src/foundations/ds_size.dart';
import 'package:design_system/src/foundations/ds_spacing.dart';
import 'package:design_system/src/theme/ds_theme_data.dart';
import 'package:flutter/material.dart';

/// Checkbox component that follows Design System form patterns.
class DSCheckbox extends StatelessWidget {
  /// Creates a Design System checkbox.
  const DSCheckbox({
    required this.value,
    required this.onChanged,
    super.key,
    this.label,
    this.helperText,
    this.errorText,
    this.semanticLabel,
    this.size = DSCheckboxSize.md,
    this.enabled = true,
    this.tristate = false,
    this.autofocus = false,
  }) : assert(
          tristate || value != null,
          'value cannot be null when tristate is false.',
        );

  /// Whether the checkbox is checked.
  final bool? value;

  /// Called when the checkbox value changes.
  final ValueChanged<bool?>? onChanged;

  /// Label shown next to the checkbox.
  final String? label;

  /// Supporting text shown below the label.
  final String? helperText;

  /// Error message shown below the label.
  final String? errorText;

  /// Accessibility label used when the visible label is not descriptive enough.
  final String? semanticLabel;

  /// Dimensional treatment used by the checkbox.
  final DSCheckboxSize size;

  /// Whether the checkbox accepts interaction.
  final bool enabled;

  /// Whether the checkbox supports true, false, and null values.
  final bool tristate;

  /// Whether this checkbox should focus itself when the route opens.
  final bool autofocus;

  bool get _isEnabled => enabled && onChanged != null;

  bool get _hasContent =>
      label != null || helperText != null || errorText != null;

  bool get _hasError => errorText != null;

  @override
  Widget build(BuildContext context) {
    final style = DSCheckboxStyle.resolve(
      colors: context.dsTheme.colors,
      size: size,
    );
    final sizeStyle = style.sizeStyle;
    final content = _buildContent(style);

    final checkbox = SizedBox.square(
      dimension: DSSize.minTouchTarget,
      child: Center(
        child: Transform.scale(
          scale: sizeStyle.scale,
          child: Checkbox(
            value: value,
            tristate: tristate,
            autofocus: autofocus,
            isError: _hasError,
            onChanged: _isEnabled ? onChanged : null,
            fillColor: style.fillColor(hasError: _hasError),
            checkColor: _hasError ? style.errorCheckColor : style.checkColor,
            side: style.side(enabled: _isEnabled, hasError: _hasError),
            semanticLabel: _hasContent ? null : semanticLabel,
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            visualDensity: VisualDensity.compact,
          ),
        ),
      ),
    );

    return MergeSemantics(
      child: LayoutBuilder(
        builder: (context, constraints) {
          final contentWrapper = Padding(
            padding: sizeStyle.contentPadding,
            child: InkWell(
              onTap: _isEnabled ? () => onChanged?.call(_nextValue()) : null,
              borderRadius: BorderRadius.circular(DSRadius.sm),
              child: Padding(
                padding: const EdgeInsets.only(
                  bottom: DSSpacing.sm,
                  right: DSSpacing.sm,
                ),
                child: content,
              ),
            ),
          );

          return Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              checkbox,
              if (_hasContent) ...[
                SizedBox(width: sizeStyle.gap),
                if (constraints.maxWidth.isFinite)
                  Flexible(child: contentWrapper)
                else
                  contentWrapper,
              ],
            ],
          );
        },
      ),
    );
  }

  Widget _buildContent(DSCheckboxStyle style) {
    final helperOrError = errorText ?? helperText;

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (label != null)
          Text(
            label!,
            semanticsLabel: semanticLabel,
            style: style.labelTextStyle(enabled: _isEnabled),
          ),
        if (helperOrError != null) ...[
          const SizedBox(height: DSSpacing.xs),
          Text(
            helperOrError,
            style: style.supportingTextStyle(
              enabled: _isEnabled,
              hasError: _hasError,
            ),
          ),
        ],
      ],
    );
  }

  bool? _nextValue() {
    if (!tristate) return !(value ?? false);

    return switch (value) {
      false => true,
      true => null,
      null => false,
    };
  }
}
