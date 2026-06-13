import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('DSButton', () {
    testWidgets('should render label when button is idle', (tester) async {
      await tester.pumpComponent(
        const DSButton(label: 'Continue', onPressed: null),
      );

      expect(find.text('Continue'), findsOneWidget);
    });

    testWidgets('should use semanticLabel when semanticLabel is provided', (
      tester,
    ) async {
      await tester.pumpComponent(
        const DSButton(
          label: 'Continue',
          semanticLabel: 'Continue to payment',
          onPressed: null,
        ),
      );

      expect(
        tester.getSemantics(find.byType(DSButton)),
        matchesSemantics(
          label: 'Continue to payment',
          isButton: true,
          hasEnabledState: true,
          isEnabled: false,
        ),
      );
    });

    testWidgets('should call onPressed when button is enabled', (tester) async {
      var pressed = false;

      await tester.pumpComponent(
        DSButton(label: 'Continue', onPressed: () => pressed = true),
      );

      await tester.tap(find.byType(DSButton));

      expect(pressed, isTrue);
    });

    testWidgets('should not call onPressed when button is disabled', (
      tester,
    ) async {
      var pressed = false;

      await tester.pumpComponent(
        const DSButton(label: 'Continue', onPressed: null),
      );

      await tester.tap(find.byType(DSButton));

      expect(pressed, isFalse);
    });

    testWidgets('should not call onPressed when button is loading', (
      tester,
    ) async {
      var pressed = false;

      await tester.pumpComponent(
        DSButton(
          label: 'Save',
          isLoading: true,
          onPressed: () => pressed = true,
        ),
      );

      await tester.tap(find.byType(DSButton));

      expect(pressed, isFalse);
    });

    testWidgets('should hide label when button is loading', (tester) async {
      await tester.pumpComponent(
        const DSButton(
          label: 'Save',
          isLoading: true,
          onPressed: null,
        ),
      );

      expect(find.text('Save'), findsNothing);
    });

    testWidgets('should show progress indicator when button is loading', (
      tester,
    ) async {
      await tester.pumpComponent(
        const DSButton(
          label: 'Save',
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
        DSButton(
          label: 'Save',
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
        DSButton(
          label: 'Save',
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
        DSButton(
          label: 'Save',
          isLoading: true,
          onPressed: null,
          animationBuilder: (child, animation) {
            return ScaleTransition(scale: animation, child: child);
          },
        ),
      );

      expect(find.byType(ScaleTransition), findsWidgets);
    });

    testWidgets('should render FilledButton when variant is primary', (
      tester,
    ) async {
      await tester.pumpComponent(
        const DSButton(label: 'Continue', onPressed: null),
      );

      expect(find.byType(FilledButton), findsOneWidget);
    });

    testWidgets('should render FilledButton when variant is secondary', (
      tester,
    ) async {
      await tester.pumpComponent(
        const DSButton(
          label: 'Continue',
          variant: DSButtonVariant.secondary,
          onPressed: null,
        ),
      );

      expect(find.byType(FilledButton), findsOneWidget);
    });

    testWidgets('should render OutlinedButton when variant is outline', (
      tester,
    ) async {
      await tester.pumpComponent(
        const DSButton(
          label: 'Continue',
          variant: DSButtonVariant.outline,
          onPressed: null,
        ),
      );

      expect(find.byType(OutlinedButton), findsOneWidget);
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
