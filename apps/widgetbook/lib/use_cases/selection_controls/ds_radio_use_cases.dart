import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(
  name: 'Playground',
  type: DSRadioGroup,
  path: '[Components]/Selection Controls',
)
Widget dsRadioGroupPlaygroundUseCase(BuildContext context) {
  final label = context.knobs.string(
    label: 'Group label',
    initialValue: 'Contact method',
  );
  final helperText = context.knobs.string(
    label: 'Group helper text',
    initialValue: 'Choose how we should reach you.',
  );
  final errorText = context.knobs.string(
    label: 'Group error text',
    initialValue: '',
  );
  final showItemHelperText = context.knobs.boolean(
    label: 'Item helper text',
  );
  final enabled = context.knobs.boolean(label: 'Enabled', initialValue: true);
  final toggleable = context.knobs.boolean(label: 'Toggleable');
  final axis = context.knobs.object.dropdown<DSRadioGroupAxis>(
    label: 'Axis',
    options: DSRadioGroupAxis.values,
    initialOption: DSRadioGroupAxis.vertical,
    labelBuilder: (axis) => axis.name,
  );
  final size = context.knobs.object.dropdown<DSRadioSize>(
    label: 'Size',
    options: DSRadioSize.values,
    initialOption: DSRadioSize.md,
    labelBuilder: (size) => size.name,
  );

  return _RadioGroupPlayground(
    label: label,
    helperText: helperText.isEmpty ? null : helperText,
    errorText: errorText.isEmpty ? null : errorText,
    showItemHelperText: showItemHelperText,
    enabled: enabled,
    toggleable: toggleable,
    axis: axis,
    size: size,
  );
}

class _RadioGroupPlayground extends StatefulWidget {
  const _RadioGroupPlayground({
    required this.label,
    required this.showItemHelperText,
    required this.enabled,
    required this.toggleable,
    required this.axis,
    required this.size,
    this.helperText,
    this.errorText,
  });

  final String label;
  final String? helperText;
  final String? errorText;
  final bool showItemHelperText;
  final bool enabled;
  final bool toggleable;
  final DSRadioGroupAxis axis;
  final DSRadioSize size;

  @override
  State<_RadioGroupPlayground> createState() => _RadioGroupPlaygroundState();
}

class _RadioGroupPlaygroundState extends State<_RadioGroupPlayground> {
  _RadioOption? selectedOption = _RadioOption.email;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 360),
        child: DSRadioGroup<_RadioOption>(
          items: [
            DSRadioGroupItem(
              value: _RadioOption.email,
              label: 'Email',
              helperText: widget.showItemHelperText
                  ? 'Receive updates by email.'
                  : null,
            ),
            DSRadioGroupItem(
              value: _RadioOption.sms,
              label: 'SMS',
              helperText: widget.showItemHelperText
                  ? 'Receive short text alerts.'
                  : null,
            ),
            DSRadioGroupItem(
              value: _RadioOption.push,
              label: 'Push',
              helperText: widget.showItemHelperText
                  ? 'Receive mobile notifications.'
                  : null,
            ),
          ],
          value: selectedOption,
          label: widget.label,
          helperText: widget.helperText,
          errorText: widget.errorText,
          enabled: widget.enabled,
          toggleable: widget.toggleable,
          axis: widget.axis,
          size: widget.size,
          onChanged: widget.enabled
              ? (value) {
                  setState(() {
                    selectedOption = value;
                  });
                }
              : null,
        ),
      ),
    );
  }
}

enum _RadioOption {
  email,
  sms,
  push,
}
