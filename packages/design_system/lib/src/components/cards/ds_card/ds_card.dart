import 'package:design_system/src/components/cards/styles/ds_card_padding.dart';
import 'package:design_system/src/components/cards/styles/ds_card_style.dart';
import 'package:design_system/src/components/cards/styles/ds_card_variant.dart';
import 'package:design_system/src/theme/ds_theme_data.dart';
import 'package:flutter/material.dart';

/// Card component that groups related content on a Design System surface.
class DSCard extends StatelessWidget {
  /// Creates a Design System card.
  const DSCard({
    required this.child,
    super.key,
    this.variant = DSCardVariant.outlined,
    this.padding = DSCardPadding.md,
    this.onTap,
    this.enabled = true,
    this.semanticLabel,
    this.clipBehavior = Clip.antiAlias,
  });

  /// Content rendered inside the card.
  final Widget child;

  /// Visual treatment used by the card.
  final DSCardVariant variant;

  /// Inner spacing around [child].
  final DSCardPadding padding;

  /// Called when the card is tapped.
  final VoidCallback? onTap;

  /// Whether the card accepts interaction.
  final bool enabled;

  /// Accessibility label used when the card is interactive.
  final String? semanticLabel;

  /// How content is clipped to the card shape.
  final Clip clipBehavior;

  bool get _isInteractive => onTap != null;

  bool get _isEnabled => enabled && onTap != null;

  @override
  Widget build(BuildContext context) {
    final style = DSCardStyle.resolve(
      variant: variant,
      colors: context.dsTheme.colors,
      padding: padding,
    );

    final content = Padding(
      padding: style.padding,
      child: child,
    );

    return Semantics(
      label: semanticLabel,
      excludeSemantics: semanticLabel != null,
      button: _isInteractive,
      enabled: _isInteractive ? _isEnabled : null,
      child: Material(
        color: style.backgroundColor,
        elevation: style.elevation,
        shape: style.shape,
        clipBehavior: clipBehavior,
        child: _isInteractive
            ? InkWell(
                onTap: _isEnabled ? onTap : null,
                child: content,
              )
            : content,
      ),
    );
  }
}
