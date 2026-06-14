import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import '../../../utils/ds_widget_tester.dart';

void main() {
  testWidgets('should render data when text is provided', (tester) async {
    await tester.pumpDSWidget(const DSText('Hello'));

    expect(find.text('Hello'), findsOneWidget);
  });

  testWidgets('should use bodyMedium when variant is not provided', (
    tester,
  ) async {
    await tester.pumpDSWidget(const DSText('Hello'));

    final text = tester.widget<Text>(find.text('Hello'));

    expect(text.style?.fontSize, DSTypography.bodyMedium.fontSize);
  });

  testWidgets('should use selected typography when variant is provided', (
    tester,
  ) async {
    await tester.pumpDSWidget(
      const DSText('Hello', variant: DSTextVariant.headlineLarge),
    );

    final text = tester.widget<Text>(find.text('Hello'));

    expect(text.style?.fontSize, DSTypography.headlineLarge.fontSize);
  });

  testWidgets('should use primary color when color is not provided', (
    tester,
  ) async {
    await tester.pumpDSWidget(const DSText('Hello'));

    final text = tester.widget<Text>(find.text('Hello'));

    expect(text.style?.color, DSColorScheme.light.textPrimary);
  });

  testWidgets('should use selected semantic color when color is provided', (
    tester,
  ) async {
    await tester.pumpDSWidget(
      const DSText('Hello', color: DSTextColor.action),
    );

    final text = tester.widget<Text>(find.text('Hello'));

    expect(text.style?.color, DSColorScheme.light.primary);
  });

  testWidgets('should merge custom style when style is provided', (
    tester,
  ) async {
    await tester.pumpDSWidget(
      const DSText('Hello', style: TextStyle(fontWeight: FontWeight.w700)),
    );

    final text = tester.widget<Text>(find.text('Hello'));

    expect(text.style?.fontWeight, FontWeight.w700);
  });

  testWidgets('should override semantic color when style color is provided', (
    tester,
  ) async {
    await tester.pumpDSWidget(
      const DSText('Hello', style: TextStyle(color: Colors.purple)),
    );

    final text = tester.widget<Text>(find.text('Hello'));

    expect(text.style?.color, Colors.purple);
  });

  testWidgets('should use textAlign when textAlign is provided', (
    tester,
  ) async {
    await tester.pumpDSWidget(
      const DSText('Hello', textAlign: TextAlign.center),
    );

    final text = tester.widget<Text>(find.text('Hello'));

    expect(text.textAlign, TextAlign.center);
  });

  testWidgets('should use maxLines when maxLines is provided', (
    tester,
  ) async {
    await tester.pumpDSWidget(const DSText('Hello', maxLines: 1));

    final text = tester.widget<Text>(find.text('Hello'));

    expect(text.maxLines, 1);
  });

  testWidgets('should use overflow when overflow is provided', (
    tester,
  ) async {
    await tester.pumpDSWidget(
      const DSText('Hello', overflow: TextOverflow.ellipsis),
    );

    final text = tester.widget<Text>(find.text('Hello'));

    expect(text.overflow, TextOverflow.ellipsis);
  });

  testWidgets('should use softWrap when softWrap is provided', (
    tester,
  ) async {
    await tester.pumpDSWidget(const DSText('Hello', softWrap: false));

    final text = tester.widget<Text>(find.text('Hello'));

    expect(text.softWrap, isFalse);
  });

  testWidgets('should use semanticsLabel when semanticsLabel is provided', (
    tester,
  ) async {
    await tester.pumpDSWidget(
      const DSText('10%', semanticsLabel: 'Ten percent'),
    );

    expect(
      tester.getSemantics(find.text('10%')),
      matchesSemantics(label: 'Ten percent'),
    );
  });

  testWidgets('should scale text when textScaler changes', (tester) async {
    await tester.pumpDSWidget(
      const DSText('Hello'),
      textScaler: TextScaler.noScaling,
    );

    final defaultHeight = tester.getSize(find.text('Hello')).height;

    await tester.pumpDSWidget(
      const DSText('Hello'),
      textScaler: const TextScaler.linear(2),
    );

    final scaledHeight = tester.getSize(find.text('Hello')).height;

    expect(scaledHeight, greaterThan(defaultHeight));
  });
}
