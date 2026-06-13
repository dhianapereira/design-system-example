import 'package:design_system/src/components/buttons/ds_button/ds_button.dart';
import 'package:design_system/src/components/buttons/styles/ds_button_style.dart';
import 'package:design_system/src/components/buttons/styles/ds_button_variant.dart';
import 'package:design_system/src/foundations/ds_motion.dart';
import 'package:design_system/src/theme/ds_theme_data.dart';
import 'package:flutter/material.dart';

/// Icon-only button for compact actions.
class DSIconButton extends StatelessWidget {
  /// Creates an icon-only Design System button.
  const DSIconButton({
    required this.icon,
    required this.semanticLabel,
    required this.onPressed,
    this.variant = DSButtonVariant.primary,
    this.isLoading = false,
    this.loadingBuilder,
    this.animationBuilder,
    super.key,
  });

  /// Icon rendered inside the button.
  final Widget icon;

  /// Accessible label that describes the icon action.
  final String semanticLabel;

  /// Callback triggered when the button is enabled and tapped.
  final VoidCallback? onPressed;

  /// Visual treatment used by the button.
  final DSButtonVariant variant;

  /// Replaces the icon with loading content and disables interaction.
  final bool isLoading;

  /// Custom loading content rendered when [isLoading] is true.
  final DSButtonLoadingBuilder? loadingBuilder;

  /// Custom transition used when the button switches between content states.
  final AnimatedSwitcherTransitionBuilder? animationBuilder;

  bool get _isEnabled => onPressed != null && !isLoading;

  @override
  Widget build(BuildContext context) {
    final colors = context.dsTheme.colors;
    final style = DSButtonStyle.resolve(variant: variant, colors: colors);

    return Semantics(
      button: true,
      enabled: _isEnabled,
      label: semanticLabel,
      child: IconButton(
        tooltip: semanticLabel,
        onPressed: _isEnabled ? onPressed : null,
        style: style.toIconButtonStyle(),
        icon: AnimatedSwitcher(
          duration: DSMotion.fast,
          transitionBuilder:
              animationBuilder ?? AnimatedSwitcher.defaultTransitionBuilder,
          child: isLoading
              ? KeyedSubtree(
                  key: const ValueKey('loading'),
                  child: loadingBuilder?.call(context, style.foregroundColor) ??
                      SizedBox.square(
                        dimension: 20,
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                          color: style.foregroundColor,
                        ),
                      ),
                )
              : IconTheme.merge(
                  key: const ValueKey('icon'),
                  data: IconThemeData(color: style.foregroundColor),
                  child: icon,
                ),
        ),
      ),
    );
  }
}
