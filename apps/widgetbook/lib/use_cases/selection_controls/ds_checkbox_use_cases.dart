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
  final valueState = context.knobs.object.dropdown<_CheckboxValueState>(
    label: 'State',
    options: tristate ? _CheckboxValueState.values : _nonTristateValueStates,
    initialOption: _CheckboxValueState.unchecked,
    labelBuilder: (state) => state.label,
  );
  final enabled = context.knobs.boolean(label: 'Enabled', initialValue: true);
  final size = context.knobs.object.dropdown<DSCheckboxSize>(
    label: 'Size',
    options: DSCheckboxSize.values,
    initialOption: DSCheckboxSize.md,
    labelBuilder: (size) => size.name,
  );

  return Center(
    child: ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 320),
      child: DSCheckbox(
        value: valueState.resolveValue(tristate: tristate),
        label: label,
        helperText: helperText.isEmpty ? null : helperText,
        errorText: errorText.isEmpty ? null : errorText,
        enabled: enabled,
        tristate: tristate,
        size: size,
        onChanged: enabled ? (_) {} : null,
      ),
    ),
  );
}

enum _CheckboxValueState {
  unchecked,
  checked,
  indeterminate,
}

const _nonTristateValueStates = [
  _CheckboxValueState.unchecked,
  _CheckboxValueState.checked,
];

extension on _CheckboxValueState {
  String get label {
    return switch (this) {
      _CheckboxValueState.unchecked => 'Unchecked',
      _CheckboxValueState.checked => 'Checked',
      _CheckboxValueState.indeterminate => 'Indeterminate',
    };
  }

  bool? get value {
    return switch (this) {
      _CheckboxValueState.unchecked => false,
      _CheckboxValueState.checked => true,
      _CheckboxValueState.indeterminate => null,
    };
  }

  bool? resolveValue({required bool tristate}) {
    return tristate ? value : value ?? false;
  }
}
