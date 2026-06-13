import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('DSIconButton', () {
    testWidgets('should render icon when button is idle', (tester) async {
      await tester.pumpComponent(
        const DSIconButton(
          icon: Icon(Icons.add),
          semanticLabel: 'Add',
          onPressed: null,
        ),
      );

      expect(find.byIcon(Icons.add), findsOneWidget);
    });

    testWidgets('should use semanticLabel when semanticLabel is provided', (
      tester,
    ) async {
      await tester.pumpComponent(
        const DSIconButton(
          icon: Icon(Icons.add),
          semanticLabel: 'Add item',
          onPressed: null,
        ),
      );

      expect(
        tester.getSemantics(find.byType(DSIconButton)),
        matchesSemantics(
          label: 'Add item',
          isButton: true,
          hasEnabledState: true,
          isEnabled: false,
        ),
      );
    });

    testWidgets('should set tooltip when semanticLabel is provided', (
      tester,
    ) async {
      await tester.pumpComponent(
        const DSIconButton(
          icon: Icon(Icons.add),
          semanticLabel: 'Add item',
          onPressed: null,
        ),
      );

      expect(find.byTooltip('Add item'), findsOneWidget);
    });

    testWidgets('should call onPressed when button is enabled', (tester) async {
      var pressed = false;

      await tester.pumpComponent(
        DSIconButton(
          icon: const Icon(Icons.add),
          semanticLabel: 'Add',
          onPressed: () => pressed = true,
        ),
      );

      await tester.tap(find.byType(DSIconButton));

      expect(pressed, isTrue);
    });

    testWidgets('should not call onPressed when button is disabled', (
      tester,
    ) async {
      var pressed = false;

      await tester.pumpComponent(
        const DSIconButton(
          icon: Icon(Icons.add),
          semanticLabel: 'Add',
          onPressed: null,
        ),
      );

      await tester.tap(find.byType(DSIconButton));

      expect(pressed, isFalse);
    });

    testWidgets('should not call onPressed when button is loading', (
      tester,
    ) async {
      var pressed = false;

      await tester.pumpComponent(
        DSIconButton(
          icon: const Icon(Icons.add),
          semanticLabel: 'Add',
          isLoading: true,
          onPressed: () => pressed = true,
        ),
      );

      await tester.tap(find.byType(DSIconButton));

      expect(pressed, isFalse);
    });

    testWidgets('should show progress indicator when button is loading', (
      tester,
    ) async {
      await tester.pumpComponent(
        const DSIconButton(
          icon: Icon(Icons.add),
          semanticLabel: 'Add',
          isLoading: true,
          onPressed: null,
        ),
      );

      expect(find.byType(CircularProgressIndicator), findsOneWidget);
    });

    testWidgets('should render custom loading when loadingBuilder is provided',
        (
      tester,
    ) async {
      await tester.pumpComponent(
        DSIconButton(
          icon: const Icon(Icons.add),
          semanticLabel: 'Add',
          isLoading: true,
          onPressed: null,
          loadingBuilder: (context, foregroundColor) => const Text('Loading'),
        ),
      );

      expect(find.text('Loading'), findsOneWidget);
    });

    testWidgets('should pass foregroundColor when loadingBuilder is provided', (
      tester,
    ) async {
      Color? receivedColor;

      await tester.pumpComponent(
        DSIconButton(
          icon: const Icon(Icons.add),
          semanticLabel: 'Add',
          isLoading: true,
          onPressed: null,
          loadingBuilder: (context, foregroundColor) {
            receivedColor = foregroundColor;
            return const Text('Loading');
          },
        ),
      );

      expect(receivedColor, DSColorScheme.light.onPrimary);
    });

    testWidgets('should use animationBuilder when content changes', (
      tester,
    ) async {
      await tester.pumpComponent(
        DSIconButton(
          icon: const Icon(Icons.add),
          semanticLabel: 'Add',
          isLoading: true,
          onPressed: null,
          animationBuilder: (child, animation) {
            return ScaleTransition(scale: animation, child: child);
          },
        ),
      );

      expect(find.byType(ScaleTransition), findsWidgets);
    });

    testWidgets('should render IconButton when variant is primary', (
      tester,
    ) async {
      await tester.pumpComponent(
        const DSIconButton(
          icon: Icon(Icons.add),
          semanticLabel: 'Add',
          onPressed: null,
        ),
      );

      expect(find.byType(IconButton), findsOneWidget);
    });

    testWidgets('should render IconButton when variant is secondary', (
      tester,
    ) async {
      await tester.pumpComponent(
        const DSIconButton(
          icon: Icon(Icons.add),
          semanticLabel: 'Add',
          variant: DSButtonVariant.secondary,
          onPressed: null,
        ),
      );

      expect(find.byType(IconButton), findsOneWidget);
    });

    testWidgets('should render IconButton when variant is outline', (
      tester,
    ) async {
      await tester.pumpComponent(
        const DSIconButton(
          icon: Icon(Icons.add),
          semanticLabel: 'Add',
          variant: DSButtonVariant.outline,
          onPressed: null,
        ),
      );

      expect(find.byType(IconButton), findsOneWidget);
    });
  });
}

extension on WidgetTester {
  Future<void> pumpComponent(Widget child) {
    return pumpWidget(
      MaterialApp(
        theme: DSTheme.light(),
        home: Scaffold(body: Center(child: child)),
      ),
    );
  }
}
