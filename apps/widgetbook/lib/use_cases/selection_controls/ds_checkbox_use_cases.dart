import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(
  name: 'Playground',
  type: DSCheckbox,
  path: '[Components]/Selection Controls',
)
Widget dsCheckboxPlaygroundUseCase(BuildContext context) {
  final label = context.knobs.string(
    label: 'Label',
    initialValue: 'Accept terms',
  );
  final helperText = context.knobs.string(
    label: 'Helper text',
    initialValue: 'You can change this later.',
  );
  final errorText = context.knobs.string(
    label: 'Error text',
    initialValue: '',
  );
  final tristate = context.knobs.boolean(label: 'Tristate');
  final enabled = context.knobs.boolean(label: 'Enabled', initialValue: true);
  final size = context.knobs.object.dropdown<DSCheckboxSize>(
    label: 'Size',
    options: DSCheckboxSize.values,
    initialOption: DSCheckboxSize.md,
    labelBuilder: (size) => size.name,
  );

  return _CheckboxPlayground(
    label: label,
    helperText: helperText.isEmpty ? null : helperText,
    errorText: errorText.isEmpty ? null : errorText,
    tristate: tristate,
    enabled: enabled,
    size: size,
  );
}

class _CheckboxPlayground extends StatefulWidget {
  const _CheckboxPlayground({
    required this.label,
    required this.tristate,
    required this.enabled,
    required this.size,
    this.helperText,
    this.errorText,
  });

  final String label;
  final String? helperText;
  final String? errorText;
  final bool tristate;
  final bool enabled;
  final DSCheckboxSize size;

  @override
  State<_CheckboxPlayground> createState() => _CheckboxPlaygroundState();
}

class _CheckboxPlaygroundState extends State<_CheckboxPlayground> {
  bool? value = false;

  @override
  void didUpdateWidget(covariant _CheckboxPlayground oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (!widget.tristate && value == null) {
      value = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 320),
        child: DSCheckbox(
          value: value,
          label: widget.label,
          helperText: widget.helperText,
          errorText: widget.errorText,
          enabled: widget.enabled,
          tristate: widget.tristate,
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
