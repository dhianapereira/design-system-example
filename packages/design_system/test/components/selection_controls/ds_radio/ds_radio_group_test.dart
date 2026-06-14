import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../utils/ds_widget_tester.dart';

void main() {
  const items = [
    DSRadioGroupItem(value: 'email', label: 'Email'),
    DSRadioGroupItem(value: 'sms', label: 'SMS'),
    DSRadioGroupItem(
      value: 'push',
      label: 'Push',
      helperText: 'Mobile notifications',
    ),
  ];
  const compactItems = [
    DSRadioGroupItem(value: 'email', label: 'Email'),
    DSRadioGroupItem(value: 'sms', label: 'SMS'),
    DSRadioGroupItem(value: 'push', label: 'Push'),
  ];

  testWidgets('should render label when label is provided', (tester) async {
    await tester.pumpDSWidget(
      const DSRadioGroup<String>(
        items: items,
        value: 'email',
        onChanged: null,
        label: 'Contact method',
      ),
    );

    expect(find.text('Contact method'), findsOneWidget);
  });

  testWidgets('should render all item labels', (tester) async {
    await tester.pumpDSWidget(
      const DSRadioGroup<String>(
        items: items,
        value: 'email',
        onChanged: null,
      ),
    );

    expect(find.text('Email'), findsOneWidget);
    expect(find.text('SMS'), findsOneWidget);
    expect(find.text('Push'), findsOneWidget);
  });

  testWidgets('should render options in a Column by default', (tester) async {
    await tester.pumpDSWidget(
      const DSRadioGroup<String>(
        items: items,
        value: 'email',
        onChanged: null,
      ),
    );

    expect(find.byType(Column), findsWidgets);
    expect(find.byType(Wrap), findsNothing);
  });

  testWidgets('should render options in a Wrap when axis is horizontal', (
    tester,
  ) async {
    await tester.pumpDSWidget(
      const DSRadioGroup<String>(
        items: items,
        value: 'email',
        onChanged: null,
        axis: DSRadioGroupAxis.horizontal,
      ),
    );

    expect(find.byType(Wrap), findsOneWidget);
  });

  testWidgets('should place horizontal options on the same row when they fit', (
    tester,
  ) async {
    await tester.pumpDSWidget(
      const SizedBox(
        width: 360,
        child: DSRadioGroup<String>(
          items: compactItems,
          value: 'email',
          onChanged: null,
          axis: DSRadioGroupAxis.horizontal,
        ),
      ),
    );

    expect(tester.getTopLeft(find.text('Email')).dy,
        tester.getTopLeft(find.text('SMS')).dy);
  });

  testWidgets('should render horizontal options in constrained layouts', (
    tester,
  ) async {
    await tester.pumpDSWidget(
      const SizedBox(
        width: 160,
        child: DSRadioGroup<String>(
          items: items,
          value: 'email',
          onChanged: null,
          axis: DSRadioGroupAxis.horizontal,
        ),
      ),
    );

    expect(tester.takeException(), isNull);
    expect(find.text('Email'), findsOneWidget);
    expect(find.text('SMS'), findsOneWidget);
    expect(find.text('Push'), findsOneWidget);
  });

  testWidgets('should render item helperText', (tester) async {
    await tester.pumpDSWidget(
      const DSRadioGroup<String>(
        items: items,
        value: 'email',
        onChanged: null,
      ),
    );

    expect(find.text('Mobile notifications'), findsOneWidget);
  });

  testWidgets('should render helperText when helperText is provided', (
    tester,
  ) async {
    await tester.pumpDSWidget(
      const DSRadioGroup<String>(
        items: items,
        value: 'email',
        onChanged: null,
        helperText: 'Choose one option',
      ),
    );

    expect(find.text('Choose one option'), findsOneWidget);
  });

  testWidgets('should render errorText instead of helperText when provided', (
    tester,
  ) async {
    await tester.pumpDSWidget(
      const DSRadioGroup<String>(
        items: items,
        value: null,
        onChanged: null,
        helperText: 'Choose one option',
        errorText: 'Selection is required',
      ),
    );

    expect(find.text('Selection is required'), findsOneWidget);
    expect(find.text('Choose one option'), findsNothing);
  });

  testWidgets('should call onChanged with selected item value', (
    tester,
  ) async {
    String? value;

    await tester.pumpDSWidget(
      DSRadioGroup<String>(
        items: items,
        value: 'email',
        onChanged: (newValue) => value = newValue,
      ),
    );

    await tester.tap(find.text('SMS'));

    expect(value, 'sms');
  });

  testWidgets('should not call onChanged when onChanged is null', (
    tester,
  ) async {
    var changed = false;

    await tester.pumpDSWidget(
      DSRadioGroup<String>(
        items: items,
        value: 'email',
        onChanged: null,
        helperText: changed.toString(),
      ),
    );

    await tester.tap(find.text('SMS'));

    expect(changed, isFalse);
  });

  testWidgets('should not call onChanged when group is disabled', (
    tester,
  ) async {
    String? value;

    await tester.pumpDSWidget(
      DSRadioGroup<String>(
        items: items,
        value: 'email',
        enabled: false,
        onChanged: (newValue) => value = newValue,
      ),
    );

    await tester.tap(find.text('SMS'));

    expect(value, isNull);
  });

  testWidgets('should not call onChanged when item is disabled', (
    tester,
  ) async {
    String? value;

    await tester.pumpDSWidget(
      DSRadioGroup<String>(
        items: const [
          DSRadioGroupItem(value: 'email', label: 'Email'),
          DSRadioGroupItem(value: 'sms', label: 'SMS', enabled: false),
        ],
        value: 'email',
        onChanged: (newValue) => value = newValue,
      ),
    );

    await tester.tap(find.text('SMS'));

    expect(value, isNull);
  });

  testWidgets('should pass null when selected item is toggleable', (
    tester,
  ) async {
    String? value = 'email';

    await tester.pumpDSWidget(
      DSRadioGroup<String>(
        items: items,
        value: 'email',
        toggleable: true,
        onChanged: (newValue) => value = newValue,
      ),
    );

    await tester.tap(find.text('Email'));

    expect(value, isNull);
  });

  testWidgets('should mark selected option as checked', (tester) async {
    await tester.pumpDSWidget(
      const DSRadioGroup<String>(
        items: items,
        value: 'sms',
        onChanged: null,
      ),
    );

    expect(
      tester.getSemantics(find.text('SMS')),
      matchesSemantics(
        label: 'SMS',
        hasCheckedState: true,
        isChecked: true,
        hasEnabledState: true,
        isEnabled: false,
        isInMutuallyExclusiveGroup: true,
      ),
    );
  });

  testWidgets('should use semanticLabel when semanticLabel is provided', (
    tester,
  ) async {
    await tester.pumpDSWidget(
      const DSRadioGroup<String>(
        items: items,
        value: 'email',
        onChanged: null,
        semanticLabel: 'Preferred contact method',
      ),
    );

    expect(
      tester.getSemantics(find.byType(DSRadioGroup<String>)),
      matchesSemantics(label: 'Preferred contact method'),
    );
  });

  testWidgets('should pass error visual state to items', (tester) async {
    await tester.pumpDSWidget(
      const DSRadioGroup<String>(
        items: items,
        value: 'email',
        onChanged: null,
        errorText: 'Selection is required',
      ),
    );

    final radio =
        tester.widget<Radio<String>>(find.byType(Radio<String>).first);

    expect(
      radio.fillColor?.resolve({WidgetState.selected}),
      DSColorScheme.light.error,
    );
  });

  testWidgets('should use selected size on items', (tester) async {
    await tester.pumpDSWidget(
      const DSRadioGroup<String>(
        items: items,
        value: 'email',
        onChanged: null,
        size: DSRadioSize.lg,
      ),
    );

    expect(
      find.byWidgetPredicate(
        (widget) =>
            widget is Transform &&
            widget.transform.storage[0] == DSSize.iconLg / 20,
      ),
      findsNWidgets(items.length),
    );
  });

  testWidgets('should scale group text when textScaler changes', (
    tester,
  ) async {
    await tester.pumpDSWidget(
      const DSRadioGroup<String>(
        items: items,
        value: 'email',
        onChanged: null,
        label: 'Contact method',
      ),
      textScaler: TextScaler.noScaling,
    );

    final defaultHeight = tester.getSize(find.text('Contact method')).height;

    await tester.pumpDSWidget(
      const DSRadioGroup<String>(
        items: items,
        value: 'email',
        onChanged: null,
        label: 'Contact method',
      ),
      textScaler: const TextScaler.linear(2),
    );

    final scaledHeight = tester.getSize(find.text('Contact method')).height;

    expect(scaledHeight, greaterThan(defaultHeight));
  });
}
