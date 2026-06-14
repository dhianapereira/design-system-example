import 'package:design_system/src/components/selection_controls/styles/ds_radio_size.dart';
import 'package:design_system/src/components/selection_controls/styles/ds_radio_style.dart';
import 'package:design_system/src/foundations/ds_radius.dart';
import 'package:design_system/src/foundations/ds_size.dart';
import 'package:design_system/src/foundations/ds_spacing.dart';
import 'package:design_system/src/theme/ds_theme_data.dart';
import 'package:flutter/material.dart';

/// Radio component that follows Design System form patterns.
class DSRadio<T> extends StatelessWidget {
  /// Creates a Design System radio.
  const DSRadio({
    required this.value,
    required this.groupValue,
    required this.onChanged,
    super.key,
    this.label,
    this.helperText,
    this.errorText,
    this.semanticLabel,
    this.size = DSRadioSize.md,
    this.enabled = true,
    this.isError = false,
    this.toggleable = false,
    this.expandContent = true,
    this.autofocus = false,
  });

  /// Value represented by this radio option.
  final T value;

  /// Currently selected value in the radio group.
  final T? groupValue;

  /// Called when this radio option is selected.
  final ValueChanged<T?>? onChanged;

  /// Label shown next to the radio.
  final String? label;

  /// Supporting text shown below the label.
  final String? helperText;

  /// Error message shown below the label.
  final String? errorText;

  /// Accessibility label used when the visible label is not descriptive enough.
  final String? semanticLabel;

  /// Dimensional treatment used by the radio.
  final DSRadioSize size;

  /// Whether the radio accepts interaction.
  final bool enabled;

  /// Whether the radio should use the error visual state.
  final bool isError;

  /// Whether selecting the already selected radio clears the group value.
  final bool toggleable;

  /// Whether label content should take the available horizontal space.
  final bool expandContent;

  /// Whether this radio should focus itself when the route opens.
  final bool autofocus;

  bool get _isEnabled => enabled && onChanged != null;

  bool get _isSelected => value == groupValue;

  bool get _hasContent =>
      label != null || helperText != null || errorText != null;

  bool get _hasError => isError || errorText != null;

  @override
  Widget build(BuildContext context) {
    final style = DSRadioStyle.resolve(
      colors: context.dsTheme.colors,
      size: size,
    );
    final sizeStyle = style.sizeStyle;
    final content = _buildContent(style);
    final effectiveOnChanged = _isEnabled ? onChanged! : (T? value) {};

    final radioControl = Semantics(
      label: _hasContent ? null : semanticLabel,
      child: SizedBox.square(
        dimension: DSSize.minTouchTarget,
        child: Center(
          child: Transform.scale(
            scale: sizeStyle.scale,
            child: RadioGroup<T>(
              groupValue: groupValue,
              onChanged: effectiveOnChanged,
              child: Radio<T>(
                value: value,
                enabled: _isEnabled,
                toggleable: toggleable,
                autofocus: autofocus,
                fillColor: style.fillColor(hasError: _hasError),
                side: style.side(enabled: _isEnabled, hasError: _hasError),
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                visualDensity: VisualDensity.compact,
              ),
            ),
          ),
        ),
      ),
    );

    return MergeSemantics(
      child: expandContent
          ? LayoutBuilder(
              builder: (context, constraints) {
                final contentWrapper = _ContentWrapper(
                  onTap:
                      _isEnabled ? () => onChanged?.call(_nextValue()) : null,
                  padding: sizeStyle.contentPadding,
                  child: content,
                );

                return Row(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    radioControl,
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
            )
          : Row(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                radioControl,
                if (_hasContent) ...[
                  SizedBox(width: sizeStyle.gap),
                  _ContentWrapper(
                    onTap:
                        _isEnabled ? () => onChanged?.call(_nextValue()) : null,
                    padding: sizeStyle.contentPadding,
                    child: content,
                  ),
                ],
              ],
            ),
    );
  }

  Widget _buildContent(DSRadioStyle style) {
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

  T? _nextValue() {
    if (toggleable && _isSelected) return null;
    return value;
  }
}

class _ContentWrapper extends StatelessWidget {
  const _ContentWrapper({
    required this.padding,
    required this.child,
    this.onTap,
  });

  final EdgeInsetsGeometry padding;
  final VoidCallback? onTap;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(DSRadius.sm),
        child: Padding(
          padding: const EdgeInsets.only(
            bottom: DSSpacing.sm,
            right: DSSpacing.sm,
          ),
          child: child,
        ),
      ),
    );
  }
}
