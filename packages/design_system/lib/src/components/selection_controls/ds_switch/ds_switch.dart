import 'package:design_system/src/components/selection_controls/styles/ds_switch_size.dart';
import 'package:design_system/src/components/selection_controls/styles/ds_switch_style.dart';
import 'package:design_system/src/foundations/ds_radius.dart';
import 'package:design_system/src/foundations/ds_size.dart';
import 'package:design_system/src/foundations/ds_spacing.dart';
import 'package:design_system/src/theme/ds_theme_data.dart';
import 'package:flutter/material.dart';

/// Switch component that follows Design System form patterns.
class DSSwitch extends StatelessWidget {
  /// Creates a Design System switch.
  const DSSwitch({
    required this.value,
    required this.onChanged,
    super.key,
    this.label,
    this.helperText,
    this.errorText,
    this.semanticLabel,
    this.size = DSSwitchSize.md,
    this.enabled = true,
    this.autofocus = false,
  });

  /// Whether the switch is on.
  final bool value;

  /// Called when the switch value changes.
  final ValueChanged<bool>? onChanged;

  /// Label shown next to the switch.
  final String? label;

  /// Supporting text shown below the label.
  final String? helperText;

  /// Error message shown below the label.
  final String? errorText;

  /// Accessibility label used when the visible label is not descriptive enough.
  final String? semanticLabel;

  /// Dimensional treatment used by the switch.
  final DSSwitchSize size;

  /// Whether the switch accepts interaction.
  final bool enabled;

  /// Whether this switch should focus itself when the route opens.
  final bool autofocus;

  bool get _isEnabled => enabled && onChanged != null;

  bool get _hasContent =>
      label != null || helperText != null || errorText != null;

  bool get _hasError => errorText != null;

  @override
  Widget build(BuildContext context) {
    final style = DSSwitchStyle.resolve(
      colors: context.dsTheme.colors,
      size: size,
    );
    final sizeStyle = style.sizeStyle;
    final content = _buildContent(style);

    final switchControl = Semantics(
      label: _hasContent ? null : semanticLabel,
      child: SizedBox.square(
        dimension: DSSize.minTouchTarget,
        child: Center(
          child: Transform.scale(
            scale: sizeStyle.scale,
            child: Switch(
              value: value,
              autofocus: autofocus,
              onChanged: _isEnabled ? onChanged : null,
              thumbColor: style.thumbColor(hasError: _hasError),
              trackColor: style.trackColor(hasError: _hasError),
              trackOutlineColor: style.trackOutlineColor(hasError: _hasError),
              trackOutlineWidth: style.trackOutlineWidth,
              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            ),
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
              onTap: _isEnabled ? () => onChanged?.call(!value) : null,
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
              switchControl,
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

  Widget _buildContent(DSSwitchStyle style) {
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
}
