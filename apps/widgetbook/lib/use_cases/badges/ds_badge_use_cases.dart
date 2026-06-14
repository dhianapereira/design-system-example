import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(
  name: 'Playground',
  type: DSBadge,
  path: '[Components]/Badges',
)
Widget dsBadgePlaygroundUseCase(BuildContext context) {
  final label = context.knobs.string(
    label: 'Label',
    initialValue: 'New',
  );
  final variant = context.knobs.object.dropdown<DSBadgeVariant>(
    label: 'Variant',
    options: DSBadgeVariant.values,
    labelBuilder: (variant) => variant.name,
  );
  final size = context.knobs.object.dropdown<DSBadgeSize>(
    label: 'Size',
    options: DSBadgeSize.values,
    initialOption: DSBadgeSize.md,
    labelBuilder: (size) => size.name,
  );
  final icon = context.knobs.object.dropdown<_BadgeIcon>(
    label: 'Icon',
    options: _BadgeIcon.values,
    labelBuilder: (icon) => icon.label,
  );

  return Center(
    child: DSBadge(
      label: label,
      variant: variant,
      size: size,
      icon: icon.widget,
    ),
  );
}

enum _BadgeIcon {
  none,
  check,
  info,
  warning,
}

extension on _BadgeIcon {
  String get label {
    return switch (this) {
      _BadgeIcon.none => 'None',
      _BadgeIcon.check => 'Check',
      _BadgeIcon.info => 'Info',
      _BadgeIcon.warning => 'Warning',
    };
  }

  Widget? get widget {
    return switch (this) {
      _BadgeIcon.none => null,
      _BadgeIcon.check => const Icon(Icons.check),
      _BadgeIcon.info => const Icon(Icons.info_outline),
      _BadgeIcon.warning => const Icon(Icons.warning_amber),
    };
  }
}
