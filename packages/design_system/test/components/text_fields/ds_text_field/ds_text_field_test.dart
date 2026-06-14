import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../utils/ds_widget_tester.dart';

void main() {
  testWidgets('should render initialValue when initialValue is provided', (
    tester,
  ) async {
    await tester.pumpDSWidget(
      const DSTextField(initialValue: 'Dhiana'),
    );

    expect(find.text('Dhiana'), findsOneWidget);
  });

  testWidgets('should render label when label is provided', (tester) async {
    await tester.pumpDSWidget(
      const DSTextField(label: 'Name'),
    );

    expect(find.text('Name'), findsOneWidget);
  });

  testWidgets('should render hintText when hintText is provided', (
    tester,
  ) async {
    await tester.pumpDSWidget(
      const DSTextField(hintText: 'Type your name'),
    );

    expect(find.text('Type your name'), findsOneWidget);
  });

  testWidgets('should render helperText when helperText is provided', (
    tester,
  ) async {
    await tester.pumpDSWidget(
      const DSTextField(helperText: 'Use your full name'),
    );

    expect(find.text('Use your full name'), findsOneWidget);
  });

  testWidgets('should render errorText when errorText is provided', (
    tester,
  ) async {
    await tester.pumpDSWidget(
      const DSTextField(errorText: 'Name is required'),
    );

    expect(find.text('Name is required'), findsOneWidget);
  });

  testWidgets('should render prefixIcon when prefixIcon is provided', (
    tester,
  ) async {
    await tester.pumpDSWidget(
      const DSTextField(prefixIcon: Icon(Icons.search)),
    );

    expect(find.byIcon(Icons.search), findsOneWidget);
  });

  testWidgets('should render suffixIcon when suffixIcon is provided', (
    tester,
  ) async {
    await tester.pumpDSWidget(
      const DSTextField(suffixIcon: Icon(Icons.close)),
    );

    expect(find.byIcon(Icons.close), findsOneWidget);
  });

  testWidgets('should call onChanged when value changes', (tester) async {
    String? value;

    await tester.pumpDSWidget(
      DSTextField(onChanged: (text) => value = text),
    );

    await tester.enterText(find.byType(TextFormField), 'Hello');

    expect(value, 'Hello');
  });

  testWidgets('should call onSubmitted when value is submitted', (
    tester,
  ) async {
    String? value;

    await tester.pumpDSWidget(
      DSTextField(onSubmitted: (text) => value = text),
    );

    await tester.enterText(find.byType(TextFormField), 'Hello');
    await tester.testTextInput.receiveAction(TextInputAction.done);

    expect(value, 'Hello');
  });

  testWidgets('should disable editable text when enabled is false', (
    tester,
  ) async {
    await tester.pumpDSWidget(
      const DSTextField(enabled: false),
    );

    final editableText = tester.widget<EditableText>(
      find.byType(EditableText),
    );

    expect(editableText.readOnly, isTrue);
  });

  testWidgets('should set readOnly when readOnly is true', (tester) async {
    await tester.pumpDSWidget(
      const DSTextField(readOnly: true),
    );

    final editableText = tester.widget<EditableText>(
      find.byType(EditableText),
    );

    expect(editableText.readOnly, isTrue);
  });

  testWidgets('should obscure text when obscureText is true', (tester) async {
    await tester.pumpDSWidget(
      const DSTextField(obscureText: true),
    );

    final editableText = tester.widget<EditableText>(
      find.byType(EditableText),
    );

    expect(editableText.obscureText, isTrue);
  });

  testWidgets('should use maxLines when maxLines is provided', (
    tester,
  ) async {
    await tester.pumpDSWidget(
      const DSTextField(maxLines: 3),
    );

    final editableText = tester.widget<EditableText>(
      find.byType(EditableText),
    );

    expect(editableText.maxLines, 3);
  });

  testWidgets('should force maxLines to one when obscureText is true', (
    tester,
  ) async {
    await tester.pumpDSWidget(
      const DSTextField(obscureText: true, maxLines: 3),
    );

    final editableText = tester.widget<EditableText>(
      find.byType(EditableText),
    );

    expect(editableText.maxLines, 1);
  });

  testWidgets('should use semanticLabel when semanticLabel is provided', (
    tester,
  ) async {
    await tester.pumpDSWidget(
      const DSTextField(semanticLabel: 'Search products'),
    );

    expect(
      tester.getSemantics(find.byType(DSTextField)),
      matchesSemantics(
        label: 'Search products',
        isTextField: true,
        hasEnabledState: true,
        isEnabled: true,
      ),
    );
  });

  testWidgets('should scale input text when textScaler changes', (
    tester,
  ) async {
    await tester.pumpDSWidget(
      const DSTextField(initialValue: 'Hello'),
      textScaler: TextScaler.noScaling,
    );

    final defaultHeight = tester.getSize(find.text('Hello')).height;

    await tester.pumpDSWidget(
      const DSTextField(initialValue: 'Hello'),
      textScaler: const TextScaler.linear(2),
    );

    final scaledHeight = tester.getSize(find.text('Hello')).height;

    expect(scaledHeight, greaterThan(defaultHeight));
  });

  test('should throw assertion when controller and initialValue are provided',
      () {
    expect(
      () => DSTextField(
        controller: TextEditingController(),
        initialValue: 'Hello',
      ),
      throwsAssertionError,
    );
  });
}
