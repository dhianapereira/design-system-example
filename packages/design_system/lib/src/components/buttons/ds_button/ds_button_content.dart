import 'package:design_system/src/components/buttons/styles/ds_button_icon_position.dart';
import 'package:design_system/src/foundations/ds_spacing.dart';
import 'package:flutter/material.dart';

class DSButtonContent extends StatelessWidget {
  const DSButtonContent({
    required this.label,
    required this.icon,
    required this.iconPosition,
    super.key,
  });

  final String label;
  final Widget? icon;
  final DSButtonIconPosition iconPosition;

  @override
  Widget build(BuildContext context) {
    final icon = this.icon;
    final label = Text(this.label);

    if (icon == null) {
      return label;
    }

    return switch (iconPosition) {
      DSButtonIconPosition.start => Row(
          mainAxisSize: MainAxisSize.min,
          children: [icon, const SizedBox(width: DSSpacing.sm), label],
        ),
      DSButtonIconPosition.end => Row(
          mainAxisSize: MainAxisSize.min,
          children: [label, const SizedBox(width: DSSpacing.sm), icon],
        ),
      DSButtonIconPosition.top => Column(
          mainAxisSize: MainAxisSize.min,
          children: [icon, const SizedBox(height: DSSpacing.xs), label],
        ),
      DSButtonIconPosition.bottom => Column(
          mainAxisSize: MainAxisSize.min,
          children: [label, const SizedBox(height: DSSpacing.xs), icon],
        ),
    };
  }
}
