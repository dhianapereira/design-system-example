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
  final enabled = context.knobs.boolean(label: 'Enabled', initialValue: true);
  final size = context.knobs.object.dropdown<DSSwitchSize>(
    label: 'Size',
    options: DSSwitchSize.values,
    initialOption: DSSwitchSize.md,
    labelBuilder: (size) => size.name,
  );

  return _SwitchPlayground(
    label: label,
    helperText: helperText.isEmpty ? null : helperText,
    errorText: errorText.isEmpty ? null : errorText,
    enabled: enabled,
    size: size,
  );
}

class _SwitchPlayground extends StatefulWidget {
  const _SwitchPlayground({
    required this.label,
    required this.enabled,
    required this.size,
    this.helperText,
    this.errorText,
  });

  final String label;
  final String? helperText;
  final String? errorText;
  final bool enabled;
  final DSSwitchSize size;

  @override
  State<_SwitchPlayground> createState() => _SwitchPlaygroundState();
}

class _SwitchPlaygroundState extends State<_SwitchPlayground> {
  bool value = false;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 320),
        child: DSSwitch(
          value: value,
          label: widget.label,
          helperText: widget.helperText,
          errorText: widget.errorText,
          enabled: widget.enabled,
          size: widget.size,
          onChanged: widget.enabled
              ? (newValue) {
                  setState(() {
                    value = newValue;
                  });
                }
              : null,
        ),
      ),
    );
  }
}
