import 'package:design_system/src/components/badges/styles/ds_badge_size.dart';
import 'package:design_system/src/components/badges/styles/ds_badge_style.dart';
import 'package:design_system/src/components/badges/styles/ds_badge_variant.dart';
import 'package:design_system/src/theme/ds_theme_data.dart';
import 'package:flutter/material.dart';

/// Badge component used to communicate compact status or metadata.
class DSBadge extends StatelessWidget {
  /// Creates a Design System badge.
  const DSBadge({
    required this.label,
    this.variant = DSBadgeVariant.neutral,
    this.size = DSBadgeSize.md,
    this.icon,
    this.semanticLabel,
    super.key,
  });

  /// Text rendered inside the badge.
  final String label;

  /// Visual treatment used by the badge.
  final DSBadgeVariant variant;

  /// Dimensional treatment used by the badge.
  final DSBadgeSize size;

  /// Optional icon rendered before the label.
  final Widget? icon;

  /// Accessible label used when the visible label is abbreviated.
  final String? semanticLabel;

  @override
  Widget build(BuildContext context) {
    final style = DSBadgeStyle.resolve(
      variant: variant,
      size: size,
      colors: context.dsTheme.colors,
    );
    final sizeStyle = style.sizeStyle;

    return Semantics(
      label: semanticLabel ?? label,
      container: true,
      child: ExcludeSemantics(
        child: Container(
          constraints: BoxConstraints(minHeight: sizeStyle.minHeight),
          padding: EdgeInsets.symmetric(
            horizontal: sizeStyle.horizontalPadding,
            vertical: sizeStyle.verticalPadding,
          ),
          decoration: style.toDecoration(),
          child: LayoutBuilder(
            builder: (context, constraints) {
              final text = Text(
                label,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: style.textStyle,
              );

              return Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (icon != null) ...[
                    IconTheme.merge(
                      data: IconThemeData(
                        color: style.foregroundColor,
                        size: sizeStyle.iconSize,
                      ),
                      child: icon!,
                    ),
                    SizedBox(width: sizeStyle.gap),
                  ],
                  if (constraints.maxWidth.isFinite)
                    Flexible(child: text)
                  else
                    text,
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
