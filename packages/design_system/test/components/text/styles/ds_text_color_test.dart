import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import '../../../utils/ds_widget_tester.dart';

void main() {
  testWidgets('should return textPrimary when token is primary', (
    tester,
  ) async {
    final color = await tester.resolveColor(DSTextColor.primary);

    expect(color, DSColorScheme.light.textPrimary);
  });

  testWidgets('should return textDisabled when token is disabled', (
    tester,
  ) async {
    final color = await tester.resolveColor(DSTextColor.disabled);

    expect(color, DSColorScheme.light.textDisabled);
  });

  testWidgets('should return primary when token is action', (
    tester,
  ) async {
    final color = await tester.resolveColor(DSTextColor.action);

    expect(color, DSColorScheme.light.primary);
  });

  testWidgets('should return onPrimary when token is onPrimary', (
    tester,
  ) async {
    final color = await tester.resolveColor(DSTextColor.onPrimary);

    expect(color, DSColorScheme.light.onPrimary);
  });

  testWidgets('should return onSecondary when token is onSecondary', (
    tester,
  ) async {
    final color = await tester.resolveColor(DSTextColor.onSecondary);

    expect(color, DSColorScheme.light.onSecondary);
  });
}

extension on WidgetTester {
  Future<Color> resolveColor(DSTextColor color) {
    return resolveWithDSContext(color.resolve);
  }
}
