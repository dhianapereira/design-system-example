import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../utils/ds_widget_tester.dart';

void main() {
  testWidgets('should render selected item when value is provided', (
    tester,
  ) async {
    await tester.pumpDSWidget(
      DSDropdown<String>(
        value: 'br',
        items: _items,
        onChanged: (_) {},
      ),
    );

    expect(find.text('Brazil'), findsOneWidget);
  });

  testWidgets('should render hintText when value is null', (tester) async {
    await tester.pumpDSWidget(
      DSDropdown<String>(
        hintText: 'Select country',
        items: _items,
        onChanged: (_) {},
      ),
    );

    expect(find.text('Select country'), findsOneWidget);
  });

  testWidgets('should render label when label is provided', (tester) async {
    await tester.pumpDSWidget(
      DSDropdown<String>(
        label: 'Country',
        items: _items,
        onChanged: (_) {},
      ),
    );

    expect(find.text('Country'), findsOneWidget);
  });

  testWidgets('should render helperText when helperText is provided', (
    tester,
  ) async {
    await tester.pumpDSWidget(
      DSDropdown<String>(
        helperText: 'Choose your country',
        items: _items,
        onChanged: (_) {},
      ),
    );

    expect(find.text('Choose your country'), findsOneWidget);
  });

  testWidgets('should render errorText when errorText is provided', (
    tester,
  ) async {
    await tester.pumpDSWidget(
      DSDropdown<String>(
        errorText: 'Country is required',
        items: _items,
        onChanged: (_) {},
      ),
    );

    expect(find.text('Country is required'), findsOneWidget);
  });

  testWidgets('should render prefixIcon when prefixIcon is provided', (
    tester,
  ) async {
    await tester.pumpDSWidget(
      DSDropdown<String>(
        prefixIcon: const Icon(Icons.public),
        items: _items,
        onChanged: (_) {},
      ),
    );

    expect(find.byIcon(Icons.public), findsOneWidget);
  });

  testWidgets('should open menu when dropdown is tapped', (tester) async {
    await tester.pumpDSWidget(
      DSDropdown<String>(
        items: _items,
        onChanged: (_) {},
      ),
    );

    await tester.tap(find.byType(DSDropdown<String>));
    await tester.pumpAndSettle();

    expect(find.text('Canada'), findsOneWidget);
  });

  testWidgets('should call onChanged when item is selected', (tester) async {
    String? selected;

    await tester.pumpDSWidget(
      DSDropdown<String>(
        items: _items,
        onChanged: (value) => selected = value,
      ),
    );

    await tester.tap(find.byType(DSDropdown<String>));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Canada').last);
    await tester.pumpAndSettle();

    expect(selected, 'ca');
  });

  testWidgets('should not call onChanged when dropdown is disabled', (
    tester,
  ) async {
    String? selected;

    await tester.pumpDSWidget(
      DSDropdown<String>(
        enabled: false,
        items: _items,
        onChanged: (value) => selected = value,
      ),
    );

    await tester.tap(find.byType(DSDropdown<String>));
    await tester.pumpAndSettle();

    expect(selected, isNull);
  });

  testWidgets('should not call onChanged when onChanged is null', (
    tester,
  ) async {
    await tester.pumpDSWidget(
      const DSDropdown<String>(
        items: _items,
        onChanged: null,
      ),
    );

    await tester.tap(find.byType(DSDropdown<String>));
    await tester.pumpAndSettle();

    expect(find.text('Canada'), findsNothing);
  });

  testWidgets('should not open menu when items are empty', (tester) async {
    await tester.pumpDSWidget(
      DSDropdown<String>(
        items: const [],
        onChanged: (_) {},
      ),
    );

    await tester.tap(find.byType(DSDropdown<String>));
    await tester.pumpAndSettle();

    expect(find.byType(DropdownMenuItem<String>), findsNothing);
  });

  testWidgets('should not select disabled item when disabled item is tapped', (
    tester,
  ) async {
    String? selected;

    await tester.pumpDSWidget(
      DSDropdown<String>(
        items: const [
          DSDropdownItem(value: 'br', label: 'Brazil'),
          DSDropdownItem(value: 'ca', label: 'Canada', enabled: false),
        ],
        onChanged: (value) => selected = value,
      ),
    );

    await tester.tap(find.byType(DSDropdown<String>));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Canada').last);
    await tester.pumpAndSettle();

    expect(selected, isNull);
  });

  testWidgets('should use semanticLabel when semanticLabel is provided', (
    tester,
  ) async {
    await tester.pumpDSWidget(
      DSDropdown<String>(
        semanticLabel: 'Select country',
        items: _items,
        onChanged: (_) {},
      ),
    );

    expect(
      tester.getSemantics(find.byType(DSDropdown<String>)),
      matchesSemantics(
        label: 'Select country',
        isButton: true,
        hasEnabledState: true,
        isEnabled: true,
      ),
    );
  });

  testWidgets('should scale selected item when textScaler changes', (
    tester,
  ) async {
    await tester.pumpDSWidget(
      DSDropdown<String>(
        value: 'br',
        items: _items,
        onChanged: (_) {},
      ),
      textScaler: TextScaler.noScaling,
    );

    final defaultHeight = tester.getSize(find.text('Brazil')).height;

    await tester.pumpDSWidget(
      DSDropdown<String>(
        value: 'br',
        items: _items,
        onChanged: (_) {},
      ),
      textScaler: const TextScaler.linear(2),
    );

    final scaledHeight = tester.getSize(find.text('Brazil')).height;

    expect(scaledHeight, greaterThan(defaultHeight));
  });
}

const _items = [
  DSDropdownItem(value: 'br', label: 'Brazil'),
  DSDropdownItem(value: 'ca', label: 'Canada'),
];
