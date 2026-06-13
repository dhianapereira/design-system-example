import 'package:design_system/design_system.dart';
import 'package:design_system/src/components/buttons/ds_button/ds_button_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('DSButtonContent', () {
    testWidgets('should render label when icon is null', (tester) async {
      await tester.pumpContent(
        const DSButtonContent(
          label: 'Continue',
          icon: null,
          iconPosition: DSButtonIconPosition.start,
        ),
      );

      expect(find.text('Continue'), findsOneWidget);
    });

    testWidgets('should render Row when icon position is start',
        (tester) async {
      await tester.pumpContent(
        const DSButtonContent(
          label: 'Continue',
          icon: Icon(Icons.add),
          iconPosition: DSButtonIconPosition.start,
        ),
      );

      expect(find.byType(Row), findsOneWidget);
    });

    testWidgets('should place icon first when icon position is start', (
      tester,
    ) async {
      await tester.pumpContent(
        const DSButtonContent(
          label: 'Continue',
          icon: Icon(Icons.add),
          iconPosition: DSButtonIconPosition.start,
        ),
      );

      final row = tester.widget<Row>(find.byType(Row));

      expect(
        find.descendant(
          of: find.byWidget(row.children.first),
          matching: find.byIcon(Icons.add),
        ),
        findsOneWidget,
      );
    });

    testWidgets('should place icon last when icon position is end', (
      tester,
    ) async {
      await tester.pumpContent(
        const DSButtonContent(
          label: 'Continue',
          icon: Icon(Icons.add),
          iconPosition: DSButtonIconPosition.end,
        ),
      );

      final row = tester.widget<Row>(find.byType(Row));

      expect(
        find.descendant(
          of: find.byWidget(row.children.last),
          matching: find.byIcon(Icons.add),
        ),
        findsOneWidget,
      );
    });

    testWidgets('should render Column when icon position is top',
        (tester) async {
      await tester.pumpContent(
        const DSButtonContent(
          label: 'Continue',
          icon: Icon(Icons.add),
          iconPosition: DSButtonIconPosition.top,
        ),
      );

      expect(find.byType(Column), findsOneWidget);
    });

    testWidgets('should place icon first when icon position is top', (
      tester,
    ) async {
      await tester.pumpContent(
        const DSButtonContent(
          label: 'Continue',
          icon: Icon(Icons.add),
          iconPosition: DSButtonIconPosition.top,
        ),
      );

      final column = tester.widget<Column>(find.byType(Column));

      expect(
        find.descendant(
          of: find.byWidget(column.children.first),
          matching: find.byIcon(Icons.add),
        ),
        findsOneWidget,
      );
    });

    testWidgets('should place icon last when icon position is bottom', (
      tester,
    ) async {
      await tester.pumpContent(
        const DSButtonContent(
          label: 'Continue',
          icon: Icon(Icons.add),
          iconPosition: DSButtonIconPosition.bottom,
        ),
      );

      final column = tester.widget<Column>(find.byType(Column));

      expect(
        find.descendant(
          of: find.byWidget(column.children.last),
          matching: find.byIcon(Icons.add),
        ),
        findsOneWidget,
      );
    });
  });
}

extension on WidgetTester {
  Future<void> pumpContent(Widget child) {
    return pumpWidget(
      MaterialApp(home: Scaffold(body: Center(child: child))),
    );
  }
}
