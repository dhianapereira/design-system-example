import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../utils/ds_widget_tester.dart';

void main() {
  testWidgets('should render label when label is provided', (tester) async {
    await tester.pumpDSWidget(
      const DSSwitch(value: false, onChanged: null, label: 'Notifications'),
    );

    expect(find.text('Notifications'), findsOneWidget);
  });

  testWidgets('should render helperText when helperText is provided', (
    tester,
  ) async {
    await tester.pumpDSWidget(
      const DSSwitch(
        value: false,
        onChanged: null,
        helperText: 'Receive product updates',
      ),
    );

    expect(find.text('Receive product updates'), findsOneWidget);
  });

  testWidgets('should render errorText when errorText is provided', (
    tester,
  ) async {
    await tester.pumpDSWidget(
      const DSSwitch(
        value: false,
        onChanged: null,
        errorText: 'Enable this option to continue',
      ),
    );

    expect(find.text('Enable this option to continue'), findsOneWidget);
  });

  testWidgets('should call onChanged when switch is tapped', (tester) async {
    bool? value;

    await tester.pumpDSWidget(
      DSSwitch(
        value: false,
        label: 'Notifications',
        onChanged: (newValue) => value = newValue,
      ),
    );

    await tester.tap(find.byType(Switch));

    expect(value, isTrue);
  });

  testWidgets('should call onChanged when label is tapped', (tester) async {
    bool? value;

    await tester.pumpDSWidget(
      DSSwitch(
        value: false,
        label: 'Notifications',
        onChanged: (newValue) => value = newValue,
      ),
    );

    await tester.tap(find.text('Notifications'));

    expect(value, isTrue);
  });

  testWidgets('should not call onChanged when onChanged is null', (
    tester,
  ) async {
    var changed = false;

    await tester.pumpDSWidget(
      DSSwitch(
        value: false,
        label: 'Notifications',
        onChanged: null,
        helperText: changed.toString(),
      ),
    );

    await tester.tap(find.text('Notifications'));

    expect(changed, isFalse);
  });

  testWidgets('should not call onChanged when enabled is false', (
    tester,
  ) async {
    bool? value;

    await tester.pumpDSWidget(
      DSSwitch(
        value: false,
        label: 'Notifications',
        enabled: false,
        onChanged: (newValue) => value = newValue,
      ),
    );

    await tester.tap(find.byType(Switch));
    await tester.tap(find.text('Notifications'));

    expect(value, isNull);
  });

  testWidgets('should use semanticLabel when semanticLabel is provided', (
    tester,
  ) async {
    await tester.pumpDSWidget(
      const DSSwitch(
        value: false,
        onChanged: null,
        label: 'Push',
        semanticLabel: 'Enable push notifications',
      ),
    );

    expect(
      tester.getSemantics(find.text('Push')),
      matchesSemantics(
        label: 'Enable push notifications',
        hasToggledState: true,
        isToggled: false,
        hasEnabledState: true,
        isEnabled: false,
      ),
    );
  });

  testWidgets('should expose toggled semantics when value is true', (
    tester,
  ) async {
    await tester.pumpDSWidget(
      const DSSwitch(value: true, onChanged: null, label: 'Notifications'),
    );

    expect(
      tester.getSemantics(find.byType(Switch)),
      matchesSemantics(
        hasToggledState: true,
        isToggled: true,
        hasEnabledState: true,
        isEnabled: false,
      ),
    );
  });

  testWidgets('should use error colors when errorText is provided', (
    tester,
  ) async {
    await tester.pumpDSWidget(
      const DSSwitch(
        value: true,
        onChanged: null,
        errorText: 'Enable this option to continue',
      ),
    );

    final switchWidget = tester.widget<Switch>(find.byType(Switch));

    expect(
      switchWidget.trackColor?.resolve({WidgetState.selected}),
      DSColorScheme.light.error,
    );
    expect(
      switchWidget.thumbColor?.resolve({WidgetState.selected}),
      DSColorScheme.light.onError,
    );
  });

  testWidgets('should use selected size when size is provided', (
    tester,
  ) async {
    await tester.pumpDSWidget(
      const DSSwitch(
        value: false,
        onChanged: null,
        label: 'Notifications',
        size: DSSwitchSize.lg,
      ),
    );

    expect(
      find.byWidgetPredicate(
        (widget) =>
            widget is Transform && widget.transform.storage[0] == 60 / 52,
      ),
      findsOneWidget,
    );
  });

  testWidgets('should keep switch touch target accessible', (tester) async {
    await tester.pumpDSWidget(
      const DSSwitch(value: false, onChanged: null),
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
        child: DSSwitch(
          value: false,
          onChanged: null,
          label: 'Enable all notification preferences',
        ),
      ),
    );

    expect(tester.takeException(), isNull);
    expect(find.text('Enable all notification preferences'), findsOneWidget);
  });

  testWidgets('should render inside unbounded horizontal layouts', (
    tester,
  ) async {
    await tester.pumpDSWidget(
      const SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: DSSwitch(
          value: false,
          onChanged: null,
          label: 'Enable all notification preferences',
        ),
      ),
    );

    expect(tester.takeException(), isNull);
    expect(find.text('Enable all notification preferences'), findsOneWidget);
  });

  testWidgets('should scale label text when textScaler changes', (
    tester,
  ) async {
    await tester.pumpDSWidget(
      const DSSwitch(value: false, onChanged: null, label: 'Notifications'),
      textScaler: TextScaler.noScaling,
    );

    final defaultHeight = tester.getSize(find.text('Notifications')).height;

    await tester.pumpDSWidget(
      const DSSwitch(value: false, onChanged: null, label: 'Notifications'),
      textScaler: const TextScaler.linear(2),
    );

    final scaledHeight = tester.getSize(find.text('Notifications')).height;

    expect(scaledHeight, greaterThan(defaultHeight));
  });
}
