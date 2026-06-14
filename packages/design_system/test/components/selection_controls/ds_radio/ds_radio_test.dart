import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../utils/ds_widget_tester.dart';

void main() {
  testWidgets('should render label when label is provided', (tester) async {
    await tester.pumpDSWidget(
      const DSRadio<String>(
        value: 'email',
        groupValue: 'sms',
        onChanged: null,
        label: 'Email',
      ),
    );

    expect(find.text('Email'), findsOneWidget);
  });

  testWidgets('should render helperText when helperText is provided', (
    tester,
  ) async {
    await tester.pumpDSWidget(
      const DSRadio<String>(
        value: 'email',
        groupValue: 'sms',
        onChanged: null,
        helperText: 'Receive updates by email',
      ),
    );

    expect(find.text('Receive updates by email'), findsOneWidget);
  });

  testWidgets('should render errorText when errorText is provided', (
    tester,
  ) async {
    await tester.pumpDSWidget(
      const DSRadio<String>(
        value: 'email',
        groupValue: 'sms',
        onChanged: null,
        errorText: 'Choose an option',
      ),
    );

    expect(find.text('Choose an option'), findsOneWidget);
  });

  testWidgets('should call onChanged when radio is tapped', (tester) async {
    String? value;

    await tester.pumpDSWidget(
      DSRadio<String>(
        value: 'email',
        groupValue: 'sms',
        label: 'Email',
        onChanged: (newValue) => value = newValue,
      ),
    );

    await tester.tap(find.byType(Radio<String>));

    expect(value, 'email');
  });

  testWidgets('should call onChanged when label is tapped', (tester) async {
    String? value;

    await tester.pumpDSWidget(
      DSRadio<String>(
        value: 'email',
        groupValue: 'sms',
        label: 'Email',
        onChanged: (newValue) => value = newValue,
      ),
    );

    await tester.tap(find.text('Email'));

    expect(value, 'email');
  });

  testWidgets('should pass null when selected radio is toggleable', (
    tester,
  ) async {
    String? value = 'email';

    await tester.pumpDSWidget(
      DSRadio<String>(
        value: 'email',
        groupValue: 'email',
        label: 'Email',
        toggleable: true,
        onChanged: (newValue) => value = newValue,
      ),
    );

    await tester.tap(find.text('Email'));

    expect(value, isNull);
  });

  testWidgets('should not call onChanged when onChanged is null', (
    tester,
  ) async {
    var changed = false;

    await tester.pumpDSWidget(
      DSRadio<String>(
        value: 'email',
        groupValue: 'sms',
        label: 'Email',
        onChanged: null,
        helperText: changed.toString(),
      ),
    );

    await tester.tap(find.text('Email'));

    expect(changed, isFalse);
  });

  testWidgets('should not call onChanged when enabled is false', (
    tester,
  ) async {
    String? value;

    await tester.pumpDSWidget(
      DSRadio<String>(
        value: 'email',
        groupValue: 'sms',
        label: 'Email',
        enabled: false,
        onChanged: (newValue) => value = newValue,
      ),
    );

    await tester.tap(find.byType(Radio<String>));
    await tester.tap(find.text('Email'));

    expect(value, isNull);
  });

  testWidgets('should set toggleable on underlying radio', (tester) async {
    await tester.pumpDSWidget(
      const DSRadio<String>(
        value: 'email',
        groupValue: 'email',
        label: 'Email',
        toggleable: true,
        onChanged: null,
      ),
    );

    final radio = tester.widget<Radio<String>>(find.byType(Radio<String>));

    expect(radio.toggleable, isTrue);
  });

  testWidgets('should use semanticLabel when semanticLabel is provided', (
    tester,
  ) async {
    await tester.pumpDSWidget(
      const DSRadio<String>(
        value: 'email',
        groupValue: 'sms',
        onChanged: null,
        label: 'Mail',
        semanticLabel: 'Receive updates by email',
      ),
    );

    expect(
      tester.getSemantics(find.text('Mail')),
      matchesSemantics(
        label: 'Receive updates by email',
        hasCheckedState: true,
        isChecked: false,
        hasEnabledState: true,
        isEnabled: false,
        isInMutuallyExclusiveGroup: true,
      ),
    );
  });

  testWidgets('should expose checked semantics when value is selected', (
    tester,
  ) async {
    await tester.pumpDSWidget(
      const DSRadio<String>(
        value: 'email',
        groupValue: 'email',
        onChanged: null,
        label: 'Email',
      ),
    );

    expect(
      tester.getSemantics(find.byType(Radio<String>)),
      matchesSemantics(
        hasCheckedState: true,
        isChecked: true,
        hasEnabledState: true,
        isEnabled: false,
        isInMutuallyExclusiveGroup: true,
      ),
    );
  });

  testWidgets('should use error colors when errorText is provided', (
    tester,
  ) async {
    await tester.pumpDSWidget(
      const DSRadio<String>(
        value: 'email',
        groupValue: 'email',
        onChanged: null,
        errorText: 'Choose an option',
      ),
    );

    final radio = tester.widget<Radio<String>>(find.byType(Radio<String>));

    expect(
      radio.fillColor?.resolve({WidgetState.selected}),
      DSColorScheme.light.error,
    );
  });

  testWidgets('should use selected size when size is provided', (
    tester,
  ) async {
    await tester.pumpDSWidget(
      const DSRadio<String>(
        value: 'email',
        groupValue: 'sms',
        onChanged: null,
        label: 'Email',
        size: DSRadioSize.lg,
      ),
    );

    expect(
      find.byWidgetPredicate(
        (widget) =>
            widget is Transform &&
            widget.transform.storage[0] == DSSize.iconLg / 20,
      ),
      findsOneWidget,
    );
  });

  testWidgets('should keep radio touch target accessible', (tester) async {
    await tester.pumpDSWidget(
      const DSRadio<String>(
        value: 'email',
        groupValue: 'sms',
        onChanged: null,
      ),
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
        child: DSRadio<String>(
          value: 'email',
          groupValue: 'sms',
          onChanged: null,
          label: 'Receive all product updates by email',
        ),
      ),
    );

    expect(tester.takeException(), isNull);
    expect(find.text('Receive all product updates by email'), findsOneWidget);
  });

  testWidgets('should render inside unbounded horizontal layouts', (
    tester,
  ) async {
    await tester.pumpDSWidget(
      const SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: DSRadio<String>(
          value: 'email',
          groupValue: 'sms',
          onChanged: null,
          label: 'Receive all product updates by email',
        ),
      ),
    );

    expect(tester.takeException(), isNull);
    expect(find.text('Receive all product updates by email'), findsOneWidget);
  });

  testWidgets('should scale label text when textScaler changes', (
    tester,
  ) async {
    await tester.pumpDSWidget(
      const DSRadio<String>(
        value: 'email',
        groupValue: 'sms',
        onChanged: null,
        label: 'Email',
      ),
      textScaler: TextScaler.noScaling,
    );

    final defaultHeight = tester.getSize(find.text('Email')).height;

    await tester.pumpDSWidget(
      const DSRadio<String>(
        value: 'email',
        groupValue: 'sms',
        onChanged: null,
        label: 'Email',
      ),
      textScaler: const TextScaler.linear(2),
    );

    final scaledHeight = tester.getSize(find.text('Email')).height;

    expect(scaledHeight, greaterThan(defaultHeight));
  });
}
