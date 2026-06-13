import 'package:design_system/src/components/buttons/styles/ds_button_icon_position.dart';
import 'package:design_system/src/foundations/ds_size.dart';
import 'package:design_system/src/foundations/ds_spacing.dart';
import 'package:flutter/material.dart';

class DSButtonContent extends StatelessWidget {
  const DSButtonContent({
    required this.label,
    required this.icon,
    required this.iconPosition,
    this.iconSize = DSSize.iconMd,
    this.gap = DSSpacing.sm,
    super.key,
  });

  final String label;
  final Widget? icon;
  final DSButtonIconPosition iconPosition;
  final double iconSize;
  final double gap;

  @override
  Widget build(BuildContext context) {
    final icon = this.icon == null
        ? null
        : IconTheme.merge(
            data: IconThemeData(size: iconSize),
            child: this.icon!,
          );
    final label = Text(this.label);

    if (icon == null) {
      return label;
    }

    return switch (iconPosition) {
      DSButtonIconPosition.start => Row(
          mainAxisSize: MainAxisSize.min,
          children: [icon, SizedBox(width: gap), label],
        ),
      DSButtonIconPosition.end => Row(
          mainAxisSize: MainAxisSize.min,
          children: [label, SizedBox(width: gap), icon],
        ),
      DSButtonIconPosition.top => Column(
          mainAxisSize: MainAxisSize.min,
          children: [icon, SizedBox(height: gap), label],
        ),
      DSButtonIconPosition.bottom => Column(
          mainAxisSize: MainAxisSize.min,
          children: [label, SizedBox(height: gap), icon],
        ),
    };
  }
}
