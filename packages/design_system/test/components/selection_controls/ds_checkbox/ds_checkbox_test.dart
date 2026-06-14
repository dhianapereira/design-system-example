import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../utils/ds_widget_tester.dart';

void main() {
  testWidgets('should render label when label is provided', (tester) async {
    await tester.pumpDSWidget(
      const DSCheckbox(value: false, onChanged: null, label: 'Accept terms'),
    );

    expect(find.text('Accept terms'), findsOneWidget);
  });

  testWidgets('should render helperText when helperText is provided', (
    tester,
  ) async {
    await tester.pumpDSWidget(
      const DSCheckbox(
        value: false,
        onChanged: null,
        helperText: 'Required to continue',
      ),
    );

    expect(find.text('Required to continue'), findsOneWidget);
  });

  testWidgets('should render errorText when errorText is provided', (
    tester,
  ) async {
    await tester.pumpDSWidget(
      const DSCheckbox(
        value: false,
        onChanged: null,
        errorText: 'This field is required',
      ),
    );

    expect(find.text('This field is required'), findsOneWidget);
  });

  testWidgets('should call onChanged when checkbox is tapped', (
    tester,
  ) async {
    bool? value;

    await tester.pumpDSWidget(
      DSCheckbox(
        value: false,
        label: 'Accept terms',
        onChanged: (newValue) => value = newValue,
      ),
    );

    await tester.tap(find.byType(Checkbox));

    expect(value, isTrue);
  });

  testWidgets('should call onChanged when label is tapped', (tester) async {
    bool? value;

    await tester.pumpDSWidget(
      DSCheckbox(
        value: false,
        label: 'Accept terms',
        onChanged: (newValue) => value = newValue,
      ),
    );

    await tester.tap(find.text('Accept terms'));

    expect(value, isTrue);
  });

  testWidgets('should not call onChanged when onChanged is null', (
    tester,
  ) async {
    var changed = false;

    await tester.pumpDSWidget(
      DSCheckbox(
        value: false,
        label: 'Accept terms',
        onChanged: null,
        helperText: changed.toString(),
      ),
    );

    await tester.tap(find.text('Accept terms'));

    expect(changed, isFalse);
  });

  testWidgets('should not call onChanged when enabled is false', (
    tester,
  ) async {
    bool? value;

    await tester.pumpDSWidget(
      DSCheckbox(
        value: false,
        label: 'Accept terms',
        enabled: false,
        onChanged: (newValue) => value = newValue,
      ),
    );

    await tester.tap(find.byType(Checkbox));
    await tester.tap(find.text('Accept terms'));

    expect(value, isNull);
  });

  testWidgets('should pass null when tristate cycles from true', (
    tester,
  ) async {
    bool? value = false;

    await tester.pumpDSWidget(
      DSCheckbox(
        value: true,
        tristate: true,
        label: 'Select all',
        onChanged: (newValue) => value = newValue,
      ),
    );

    await tester.tap(find.text('Select all'));

    expect(value, isNull);
  });

  testWidgets('should set tristate on underlying checkbox', (tester) async {
    await tester.pumpDSWidget(
      const DSCheckbox(
        value: null,
        tristate: true,
        label: 'Select all',
        onChanged: null,
      ),
    );

    final checkbox = tester.widget<Checkbox>(find.byType(Checkbox));

    expect(checkbox.tristate, isTrue);
  });

  testWidgets('should use semanticLabel when semanticLabel is provided', (
    tester,
  ) async {
    await tester.pumpDSWidget(
      const DSCheckbox(
        value: false,
        onChanged: null,
        label: 'TOS',
        semanticLabel: 'Accept terms of service',
      ),
    );

    expect(
      tester.getSemantics(find.text('TOS')),
      matchesSemantics(
        label: 'Accept terms of service',
        hasCheckedState: true,
        isChecked: false,
        hasEnabledState: true,
        isEnabled: false,
      ),
    );
  });

  testWidgets('should expose checked semantics when value is true', (
    tester,
  ) async {
    await tester.pumpDSWidget(
      const DSCheckbox(value: true, onChanged: null, label: 'Accept terms'),
    );

    expect(
      tester.getSemantics(find.byType(Checkbox)),
      matchesSemantics(
        hasCheckedState: true,
        isChecked: true,
        hasEnabledState: true,
        isEnabled: false,
      ),
    );
  });

  testWidgets('should use error colors when errorText is provided', (
    tester,
  ) async {
    await tester.pumpDSWidget(
      const DSCheckbox(
        value: true,
        onChanged: null,
        errorText: 'This field is required',
      ),
    );

    final checkbox = tester.widget<Checkbox>(find.byType(Checkbox));

    expect(checkbox.isError, isTrue);
    expect(checkbox.checkColor, DSColorScheme.light.onError);
  });

  testWidgets('should use selected size when size is provided', (
    tester,
  ) async {
    await tester.pumpDSWidget(
      const DSCheckbox(
        value: false,
        onChanged: null,
        label: 'Accept terms',
        size: DSCheckboxSize.lg,
      ),
    );

    expect(
      find.byWidgetPredicate(
        (widget) =>
            widget is Transform &&
            widget.transform.storage[0] == DSSize.iconLg / 18,
      ),
      findsOneWidget,
    );
  });

  testWidgets('should keep checkbox touch target accessible', (
    tester,
  ) async {
    await tester.pumpDSWidget(
      const DSCheckbox(value: false, onChanged: null),
    );

    final size = tester.getSize(find.byType(SizedBox).first);

    expect(size, const Size.square(DSSize.minTouchTarget));
  });

  testWidgets('should wrap long labels inside constrained layouts', (
    tester,
  ) async {
    await tester.pumpDSWidget(
      const SizedBox(
        width: 160,
        child: DSCheckbox(
          value: false,
          onChanged: null,
          label: 'Accept all terms and marketing preferences',
        ),
      ),
    );

    expect(tester.takeException(), isNull);
    expect(
      find.text('Accept all terms and marketing preferences'),
      findsOneWidget,
    );
  });

  testWidgets('should render inside unbounded horizontal layouts', (
    tester,
  ) async {
    await tester.pumpDSWidget(
      const SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: DSCheckbox(
          value: false,
          onChanged: null,
          label: 'Accept all terms and marketing preferences',
        ),
      ),
    );

    expect(tester.takeException(), isNull);
    expect(
      find.text('Accept all terms and marketing preferences'),
      findsOneWidget,
    );
  });

  testWidgets('should scale label text when textScaler changes', (
    tester,
  ) async {
    await tester.pumpDSWidget(
      const DSCheckbox(value: false, onChanged: null, label: 'Accept terms'),
      textScaler: TextScaler.noScaling,
    );

    final defaultHeight = tester.getSize(find.text('Accept terms')).height;

    await tester.pumpDSWidget(
      const DSCheckbox(value: false, onChanged: null, label: 'Accept terms'),
      textScaler: const TextScaler.linear(2),
    );

    final scaledHeight = tester.getSize(find.text('Accept terms')).height;

    expect(scaledHeight, greaterThan(defaultHeight));
  });

  test('should throw assertion when value is null and tristate is false', () {
    expect(
      () => DSCheckbox(value: null, onChanged: (_) {}),
      throwsAssertionError,
    );
  });
}
