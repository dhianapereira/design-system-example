import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import '../../../utils/ds_widget_tester.dart';

void main() {
  testWidgets('should render label when badge is provided', (tester) async {
    await tester.pumpDSWidget(const DSBadge(label: 'New'));

    expect(find.text('New'), findsOneWidget);
  });

  testWidgets('should use semanticLabel when semanticLabel is provided', (
    tester,
  ) async {
    await tester.pumpDSWidget(
      const DSBadge(label: '99+', semanticLabel: 'More than 99 updates'),
    );

    expect(
      tester.getSemantics(find.byType(DSBadge)),
      matchesSemantics(label: 'More than 99 updates'),
    );
  });

  testWidgets('should use label as semantic label by default', (
    tester,
  ) async {
    await tester.pumpDSWidget(const DSBadge(label: 'Draft'));

    expect(
      tester.getSemantics(find.byType(DSBadge)),
      matchesSemantics(label: 'Draft'),
    );
  });

  testWidgets('should not expose button semantics', (tester) async {
    await tester.pumpDSWidget(const DSBadge(label: 'Draft'));

    expect(
      tester.getSemantics(find.byType(DSBadge)),
      isNot(matchesSemantics(isButton: true)),
    );
  });

  testWidgets('should render icon when icon is provided', (tester) async {
    await tester.pumpDSWidget(
      const DSBadge(label: 'Synced', icon: Icon(Icons.check)),
    );

    expect(find.byIcon(Icons.check), findsOneWidget);
  });

  testWidgets('should apply icon color from selected variant', (
    tester,
  ) async {
    await tester.pumpDSWidget(
      const DSBadge(
        label: 'Synced',
        variant: DSBadgeVariant.primary,
        icon: Icon(Icons.check),
      ),
    );

    final iconTheme = tester.widget<IconTheme>(find.byType(IconTheme).last);

    expect(iconTheme.data.color, DSColorScheme.light.onPrimary);
  });

  testWidgets('should use neutral variant when variant is omitted', (
    tester,
  ) async {
    await tester.pumpDSWidget(const DSBadge(label: 'Draft'));

    final container = tester.widget<Container>(find.byType(Container));
    final decoration = container.decoration as BoxDecoration;

    expect(decoration.color, DSColorScheme.light.surface);
  });

  testWidgets('should use selected variant colors when variant is provided', (
    tester,
  ) async {
    await tester.pumpDSWidget(
      const DSBadge(label: 'Error', variant: DSBadgeVariant.error),
    );

    final text = tester.widget<Text>(find.text('Error'));

    expect(text.style?.color, DSColorScheme.light.onError);
  });

  testWidgets('should use medium size when size is omitted', (tester) async {
    await tester.pumpDSWidget(const DSBadge(label: 'New'));

    final container = tester.widget<Container>(find.byType(Container));

    expect(container.constraints?.minHeight, 24);
  });

  testWidgets('should use selected size when size is provided', (
    tester,
  ) async {
    await tester.pumpDSWidget(
      const DSBadge(label: 'New', size: DSBadgeSize.lg),
    );

    final container = tester.widget<Container>(find.byType(Container));

    expect(container.constraints?.minHeight, 28);
  });

  testWidgets('should constrain text to one line with ellipsis', (
    tester,
  ) async {
    await tester.pumpDSWidget(
      const SizedBox(
        width: 80,
        child: DSBadge(label: 'Very long badge label'),
      ),
    );

    final text = tester.widget<Text>(find.text('Very long badge label'));

    expect(text.maxLines, 1);
    expect(text.overflow, TextOverflow.ellipsis);
  });

  testWidgets('should render inside unbounded horizontal layouts', (
    tester,
  ) async {
    await tester.pumpDSWidget(
      const SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: DSBadge(label: 'Long metadata label'),
      ),
    );

    expect(tester.takeException(), isNull);
    expect(find.text('Long metadata label'), findsOneWidget);
  });

  testWidgets('should scale text when textScaler changes', (tester) async {
    await tester.pumpDSWidget(
      const DSBadge(label: 'New'),
      textScaler: TextScaler.noScaling,
    );

    final defaultHeight = tester.getSize(find.text('New')).height;

    await tester.pumpDSWidget(
      const DSBadge(label: 'New'),
      textScaler: const TextScaler.linear(2),
    );

    final scaledHeight = tester.getSize(find.text('New')).height;

    expect(scaledHeight, greaterThan(defaultHeight));
  });
}
