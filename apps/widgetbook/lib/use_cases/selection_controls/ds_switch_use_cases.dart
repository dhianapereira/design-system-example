import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(
  name: 'Playground',
  type: DSSwitch,
  path: '[Components]/Selection Controls',
)
Widget dsSwitchPlaygroundUseCase(BuildContext context) {
  final label = context.knobs.string(
    label: 'Label',
    initialValue: 'Notifications',
  );
  final helperText = context.knobs.string(
    label: 'Helper text',
    initialValue: 'Receive product updates.',
  );
  final errorText = context.knobs.string(
    label: 'Error text',
    initialValue: '',
  );
  final value = context.knobs.boolean(label: 'On');
  final enabled = context.knobs.boolean(label: 'Enabled', initialValue: true);
  final size = context.knobs.object.dropdown<DSSwitchSize>(
    label: 'Size',
    options: DSSwitchSize.values,
    initialOption: DSSwitchSize.md,
    labelBuilder: (size) => size.name,
  );

  return Center(
    child: ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 320),
      child: DSSwitch(
        value: value,
        label: label,
        helperText: helperText.isEmpty ? null : helperText,
        errorText: errorText.isEmpty ? null : errorText,
        enabled: enabled,
        size: size,
        onChanged: enabled ? (_) {} : null,
      ),
    ),
  );
}
