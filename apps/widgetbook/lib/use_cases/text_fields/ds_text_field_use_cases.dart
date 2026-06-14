import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(
  name: 'Playground',
  type: DSTextField,
  path: '[Components]/Text Fields',
)
Widget dsTextFieldPlaygroundUseCase(BuildContext context) {
  final initialValue = context.knobs.string(
    label: 'Initial value',
    initialValue: '',
  );
  final label = context.knobs.string(
    label: 'Label',
    initialValue: 'Email',
  );
  final hintText = context.knobs.string(
    label: 'Hint text',
    initialValue: 'name@example.com',
  );
  final helperText = context.knobs.string(
    label: 'Helper text',
    initialValue: 'Use the email linked to your account.',
  );
  final errorText = context.knobs.string(
    label: 'Error text',
    initialValue: '',
  );
  final variant = context.knobs.object.dropdown<DSTextFieldVariant>(
    label: 'Variant',
    options: DSTextFieldVariant.values,
    labelBuilder: (variant) => variant.name,
  );
  final size = context.knobs.object.dropdown<DSTextFieldSize>(
    label: 'Size',
    options: DSTextFieldSize.values,
    initialOption: DSTextFieldSize.md,
    labelBuilder: (size) => size.name,
  );
  final prefixIcon = context.knobs.object.dropdown<_TextFieldIcon>(
    label: 'Prefix icon',
    options: _TextFieldIcon.values,
    labelBuilder: (icon) => icon.label,
  );
  final suffixIcon = context.knobs.object.dropdown<_TextFieldIcon>(
    label: 'Suffix icon',
    options: _TextFieldIcon.values,
    labelBuilder: (icon) => icon.label,
  );
  final keyboardType = context.knobs.object.dropdown<_KeyboardTypeOption>(
    label: 'Keyboard type',
    options: _KeyboardTypeOption.values,
    labelBuilder: (option) => option.label,
  );
  final enabled = context.knobs.boolean(
    label: 'Enabled',
    initialValue: true,
  );
  final readOnly = context.knobs.boolean(label: 'Read only');
  final obscureText = context.knobs.boolean(label: 'Obscure text');

  return _TextFieldPreview(
    child: DSTextField(
      initialValue: initialValue,
      label: label,
      hintText: hintText,
      helperText: helperText.isEmpty ? null : helperText,
      errorText: errorText.isEmpty ? null : errorText,
      variant: variant,
      size: size,
      prefixIcon: prefixIcon.widget,
      suffixIcon: suffixIcon.widget,
      keyboardType: keyboardType.value,
      enabled: enabled,
      readOnly: readOnly,
      obscureText: obscureText,
      semanticLabel: label,
    ),
  );
}

class _TextFieldPreview extends StatelessWidget {
  const _TextFieldPreview({required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 360),
        child: child,
      ),
    );
  }
}

enum _TextFieldIcon {
  none,
  search,
  mail,
  visibility,
  close,
}

extension on _TextFieldIcon {
  String get label {
    return switch (this) {
      _TextFieldIcon.none => 'None',
      _TextFieldIcon.search => 'Search',
      _TextFieldIcon.mail => 'Mail',
      _TextFieldIcon.visibility => 'Visibility',
      _TextFieldIcon.close => 'Close',
    };
  }

  Widget? get widget {
    return switch (this) {
      _TextFieldIcon.none => null,
      _TextFieldIcon.search => const Icon(Icons.search),
      _TextFieldIcon.mail => const Icon(Icons.mail),
      _TextFieldIcon.visibility => const Icon(Icons.visibility),
      _TextFieldIcon.close => const Icon(Icons.close),
    };
  }
}

enum _KeyboardTypeOption {
  text,
  email,
  number,
  phone,
  multiline,
}

extension on _KeyboardTypeOption {
  String get label {
    return switch (this) {
      _KeyboardTypeOption.text => 'Text',
      _KeyboardTypeOption.email => 'Email',
      _KeyboardTypeOption.number => 'Number',
      _KeyboardTypeOption.phone => 'Phone',
      _KeyboardTypeOption.multiline => 'Multiline',
    };
  }

  TextInputType get value {
    return switch (this) {
      _KeyboardTypeOption.text => TextInputType.text,
      _KeyboardTypeOption.email => TextInputType.emailAddress,
      _KeyboardTypeOption.number => TextInputType.number,
      _KeyboardTypeOption.phone => TextInputType.phone,
      _KeyboardTypeOption.multiline => TextInputType.multiline,
    };
  }
}
