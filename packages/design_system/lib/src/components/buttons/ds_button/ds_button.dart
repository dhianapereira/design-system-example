import 'package:design_system/src/components/buttons/ds_button/ds_button_content.dart';
import 'package:design_system/src/components/buttons/styles/ds_button_icon_position.dart';
import 'package:design_system/src/components/buttons/styles/ds_button_size.dart';
import 'package:design_system/src/components/buttons/styles/ds_button_style.dart';
import 'package:design_system/src/components/buttons/styles/ds_button_variant.dart';
import 'package:design_system/src/foundations/ds_motion.dart';
import 'package:design_system/src/foundations/ds_size.dart';
import 'package:design_system/src/theme/ds_theme_data.dart';
import 'package:flutter/material.dart';

/// Builds the loading content rendered inside a [DSButton].
typedef DSButtonLoadingBuilder = Widget Function(
  BuildContext context,
  Color foregroundColor,
);

/// Button component that follows the Design System theme and accessibility rules.
class DSButton extends StatelessWidget {
  /// Creates a Design System button.
  const DSButton({
    required this.label,
    required this.onPressed,
    this.variant = DSButtonVariant.primary,
    this.size = DSButtonSize.md,
    this.icon,
    this.iconPosition = DSButtonIconPosition.start,
    this.isLoading = false,
    this.loadingBuilder,
    this.animationBuilder,
    this.semanticLabel,
    super.key,
  });

  /// Text rendered inside the button.
  final String label;

  /// Callback triggered when the button is enabled and tapped.
  final VoidCallback? onPressed;

  /// Visual treatment used by the button.
  final DSButtonVariant variant;

  /// Dimensional treatment used by the button.
  final DSButtonSize size;

  /// Optional icon rendered next to the label.
  final Widget? icon;

  /// Position used when [icon] is provided.
  final DSButtonIconPosition iconPosition;

  /// Replaces the content with a progress indicator and disables interaction.
  final bool isLoading;

  /// Custom loading content rendered when [isLoading] is true.
  final DSButtonLoadingBuilder? loadingBuilder;

  /// Custom transition used when the button switches between content states.
  final AnimatedSwitcherTransitionBuilder? animationBuilder;

  /// Accessible label used when the visible label is not descriptive enough.
  final String? semanticLabel;

  bool get _isEnabled => onPressed != null && !isLoading;

  @override
  Widget build(BuildContext context) {
    final colors = context.dsTheme.colors;
    final style = DSButtonStyle.resolve(
      variant: variant,
      size: size,
      colors: colors,
    );
    final child = AnimatedSwitcher(
      duration: DSMotion.fast,
      transitionBuilder:
          animationBuilder ?? AnimatedSwitcher.defaultTransitionBuilder,
      child: isLoading
          ? KeyedSubtree(
              key: const ValueKey('loading'),
              child: loadingBuilder?.call(context, style.foregroundColor) ??
                  _DefaultDSButtonLoadingIndicator(
                    color: style.foregroundColor,
                  ),
            )
          : DSButtonContent(
              key: const ValueKey('content'),
              label: label,
              icon: icon,
              iconPosition: iconPosition,
              iconSize: style.sizeStyle.iconSize,
              gap: style.sizeStyle.gap,
            ),
    );

    return Semantics(
      button: true,
      enabled: _isEnabled,
      label: semanticLabel ?? label,
      child: ConstrainedBox(
        constraints: const BoxConstraints(
          minHeight: DSSize.minTouchTarget,
          minWidth: DSSize.minTouchTarget,
        ),
        child: switch (variant) {
          DSButtonVariant.primary || DSButtonVariant.secondary => FilledButton(
              onPressed: _isEnabled ? onPressed : null,
              style: style.toFilledButtonStyle(),
              child: child,
            ),
          DSButtonVariant.outline => OutlinedButton(
              onPressed: _isEnabled ? onPressed : null,
              style: style.toOutlinedButtonStyle(),
              child: child,
            ),
        },
      ),
    );
  }
}

class _DefaultDSButtonLoadingIndicator extends StatelessWidget {
  const _DefaultDSButtonLoadingIndicator({required this.color});

  final Color color;

  @override
  Widget build(BuildContext context) {
    return SizedBox.square(
      dimension: DSSize.iconMd,
      child: CircularProgressIndicator(
        strokeWidth: 2,
        color: color,
      ),
    );
  }
}
