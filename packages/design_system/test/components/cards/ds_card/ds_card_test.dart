import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../utils/ds_widget_tester.dart';

void main() {
  testWidgets('should render child when card is provided', (tester) async {
    await tester.pumpDSWidget(
      const DSCard(child: Text('Content')),
    );

    expect(find.text('Content'), findsOneWidget);
  });

  testWidgets('should use outlined variant when variant is omitted', (
    tester,
  ) async {
    await tester.pumpDSWidget(
      const DSCard(child: Text('Content')),
    );

    final material = tester.widget<Material>(find.byType(Material).last);
    final shape = material.shape as RoundedRectangleBorder;

    expect(material.color, DSColorScheme.light.surface);
    expect(material.elevation, DSElevation.none);
    expect(shape.side.color, DSColorScheme.light.border);
  });

  testWidgets('should use selected variant when variant is provided', (
    tester,
  ) async {
    await tester.pumpDSWidget(
      const DSCard(
        variant: DSCardVariant.filled,
        child: Text('Content'),
      ),
    );

    final material = tester.widget<Material>(find.byType(Material).last);

    expect(material.color, DSColorScheme.light.secondary);
  });

  testWidgets('should use medium padding when padding is omitted', (
    tester,
  ) async {
    await tester.pumpDSWidget(
      const DSCard(child: Text('Content')),
    );

    final padding = tester.widget<Padding>(
      find
          .ancestor(
            of: find.text('Content'),
            matching: find.byType(Padding),
          )
          .first,
    );

    expect(padding.padding, const EdgeInsets.all(DSSpacing.lg));
  });

  testWidgets('should use selected padding when padding is provided', (
    tester,
  ) async {
    await tester.pumpDSWidget(
      const DSCard(
        padding: DSCardPadding.none,
        child: Text('Content'),
      ),
    );

    final padding = tester.widget<Padding>(
      find
          .ancestor(
            of: find.text('Content'),
            matching: find.byType(Padding),
          )
          .first,
    );

    expect(padding.padding, EdgeInsets.zero);
  });

  testWidgets('should call onTap when card is tapped', (tester) async {
    var tapped = false;

    await tester.pumpDSWidget(
      DSCard(
        onTap: () => tapped = true,
        child: const Text('Content'),
      ),
    );

    await tester.tap(find.byType(DSCard));

    expect(tapped, isTrue);
  });

  testWidgets('should not call onTap when card is disabled', (tester) async {
    var tapped = false;

    await tester.pumpDSWidget(
      DSCard(
        enabled: false,
        onTap: () => tapped = true,
        child: const Text('Content'),
      ),
    );

    await tester.tap(find.byType(DSCard));

    expect(tapped, isFalse);
  });

  testWidgets('should expose button semantics when card is interactive', (
    tester,
  ) async {
    await tester.pumpDSWidget(
      DSCard(
        semanticLabel: 'Open billing summary',
        onTap: () {},
        child: const Text('Billing'),
      ),
    );

    expect(
      tester.getSemantics(find.byType(DSCard)),
      matchesSemantics(
        label: 'Open billing summary',
        isButton: true,
        hasEnabledState: true,
        isEnabled: true,
      ),
    );
  });

  testWidgets('should expose disabled semantics when interactive card is off', (
    tester,
  ) async {
    await tester.pumpDSWidget(
      DSCard(
        enabled: false,
        semanticLabel: 'Open billing summary',
        onTap: () {},
        child: const Text('Billing'),
      ),
    );

    expect(
      tester.getSemantics(find.byType(DSCard)),
      matchesSemantics(
        label: 'Open billing summary',
        isButton: true,
        hasEnabledState: true,
        isEnabled: false,
      ),
    );
  });

  testWidgets('should not expose button semantics when card is static', (
    tester,
  ) async {
    await tester.pumpDSWidget(
      const DSCard(child: Text('Content')),
    );

    expect(
      tester.getSemantics(find.byType(DSCard)),
      isNot(matchesSemantics(isButton: true)),
    );
  });

  testWidgets('should render inside constrained layouts', (tester) async {
    await tester.pumpDSWidget(
      const SizedBox(
        width: 160,
        child: DSCard(
          child: Text('Long content rendered inside a narrow card'),
        ),
      ),
    );

    expect(tester.takeException(), isNull);
    expect(
      find.text('Long content rendered inside a narrow card'),
      findsOneWidget,
    );
  });

  testWidgets('should render inside unbounded horizontal layouts', (
    tester,
  ) async {
    await tester.pumpDSWidget(
      const SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: DSCard(child: Text('Scrollable card content')),
      ),
    );

    expect(tester.takeException(), isNull);
    expect(find.text('Scrollable card content'), findsOneWidget);
  });
}
