import 'package:design_system/src/components/text_fields/styles/ds_text_field_size.dart';
import 'package:design_system/src/components/text_fields/styles/ds_text_field_style.dart';
import 'package:design_system/src/components/text_fields/styles/ds_text_field_variant.dart';
import 'package:design_system/src/theme/ds_theme_data.dart';
import 'package:flutter/material.dart';

/// Text input component that follows Design System visual and accessibility rules.
class DSTextField extends StatelessWidget {
  /// Creates a Design System text field.
  const DSTextField({
    super.key,
    this.controller,
    this.initialValue,
    this.label,
    this.hintText,
    this.helperText,
    this.errorText,
    this.semanticLabel,
    this.variant = DSTextFieldVariant.outline,
    this.size = DSTextFieldSize.md,
    this.enabled = true,
    this.readOnly = false,
    this.obscureText = false,
    this.keyboardType,
    this.textInputAction,
    this.textCapitalization = TextCapitalization.none,
    this.minLines,
    this.maxLines = 1,
    this.maxLength,
    this.prefixIcon,
    this.suffixIcon,
    this.autofillHints,
    this.onChanged,
    this.onSubmitted,
  }) : assert(
          controller == null || initialValue == null,
          'controller and initialValue cannot be used together.',
        );

  /// Controls the text being edited.
  final TextEditingController? controller;

  /// Initial text used when [controller] is not provided.
  final String? initialValue;

  /// Label shown above the input value when focused or filled.
  final String? label;

  /// Placeholder text shown when the field is empty.
  final String? hintText;

  /// Supporting text shown below the field.
  final String? helperText;

  /// Error message shown below the field.
  final String? errorText;

  /// Accessibility label used when the visible label is not descriptive enough.
  final String? semanticLabel;

  /// Visual treatment used by the field.
  final DSTextFieldVariant variant;

  /// Dimensional treatment used by the field.
  final DSTextFieldSize size;

  /// Whether the field accepts input.
  final bool enabled;

  /// Whether the field shows a value without allowing edits.
  final bool readOnly;

  /// Whether the text should be hidden, commonly used for passwords.
  final bool obscureText;

  /// Keyboard type requested by the field.
  final TextInputType? keyboardType;

  /// Input action requested by the field.
  final TextInputAction? textInputAction;

  /// Capitalization behavior requested by the field.
  final TextCapitalization textCapitalization;

  /// Minimum number of visible lines.
  final int? minLines;

  /// Maximum number of visible lines.
  final int? maxLines;

  /// Maximum number of characters accepted by the field.
  final int? maxLength;

  /// Icon rendered before the editable text.
  final Widget? prefixIcon;

  /// Icon rendered after the editable text.
  final Widget? suffixIcon;

  /// Autofill hints used by the platform.
  final Iterable<String>? autofillHints;

  /// Called when the input value changes.
  final ValueChanged<String>? onChanged;

  /// Called when the input value is submitted.
  final ValueChanged<String>? onSubmitted;

  @override
  Widget build(BuildContext context) {
    final style = DSTextFieldStyle.resolve(
      variant: variant,
      size: size,
      colors: context.dsTheme.colors,
    );
    final textField = TextFormField(
      controller: controller,
      initialValue: initialValue,
      enabled: enabled,
      readOnly: readOnly,
      obscureText: obscureText,
      keyboardType: keyboardType,
      textInputAction: textInputAction,
      textCapitalization: textCapitalization,
      minLines: obscureText ? 1 : minLines,
      maxLines: obscureText ? 1 : maxLines,
      maxLength: maxLength,
      autofillHints: autofillHints,
      style: style.textStyle,
      cursorColor: style.focusColor,
      decoration: style.toInputDecoration(
        label: label,
        hintText: hintText,
        helperText: helperText,
        errorText: errorText,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
      ),
      onChanged: onChanged,
      onFieldSubmitted: onSubmitted,
    );

    return Semantics(
      enabled: enabled,
      label: semanticLabel,
      textField: true,
      child: textField,
    );
  }
}
