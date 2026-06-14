import 'package:design_system/design_system.dart';
import 'package:design_system/src/components/dropdowns/styles/ds_dropdown_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('should return value when item is converted to DropdownMenuItem', () {
    final menuItem = _menuItem(const DSDropdownItem(value: 1, label: 'One'));

    expect(menuItem.value, 1);
  });

  test('should return enabled true when enabled is omitted', () {
    final menuItem = _menuItem(const DSDropdownItem(value: 1, label: 'One'));

    expect(menuItem.enabled, isTrue);
  });

  test('should return enabled false when item is disabled', () {
    final menuItem = _menuItem(
      const DSDropdownItem(value: 1, label: 'One', enabled: false),
    );

    expect(menuItem.enabled, isFalse);
  });

  testWidgets('should render label when child is omitted', (tester) async {
    final menuItem = _menuItem(const DSDropdownItem(value: 1, label: 'One'));

    await tester.pumpWidget(MaterialApp(home: menuItem));

    expect(find.text('One'), findsOneWidget);
  });

  testWidgets('should render child when child is provided', (tester) async {
    final menuItem = _menuItem(
      const DSDropdownItem(
        value: 1,
        label: 'One',
        child: Text('Custom'),
      ),
    );

    await tester.pumpWidget(MaterialApp(home: menuItem));

    expect(find.text('Custom'), findsOneWidget);
  });
}

DropdownMenuItem<int> _menuItem(DSDropdownItem<int> item) {
  return item.toDropdownMenuItem(
    DSDropdownStyle.resolve(
      variant: DSDropdownVariant.outline,
      colors: DSColorScheme.light,
    ),
  );
}
