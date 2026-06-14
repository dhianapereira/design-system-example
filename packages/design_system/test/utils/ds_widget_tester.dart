import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

extension DSWidgetTester on WidgetTester {
  Future<void> pumpDSWidget(
    Widget child, {
    ThemeData? theme,
    TextScaler? textScaler,
  }) {
    final body = Scaffold(
      body: Center(
        child: textScaler == null
            ? child
            : MediaQuery(
                data: MediaQueryData(textScaler: textScaler),
                child: child,
              ),
      ),
    );

    return pumpWidget(MaterialApp(theme: theme ?? DSTheme.light(), home: body));
  }

  Future<T> resolveWithDSContext<T>(
    T Function(BuildContext context) resolve, {
    ThemeData? theme,
  }) async {
    late T value;

    await pumpWidget(
      MaterialApp(
        theme: theme ?? DSTheme.light(),
        home: Builder(
          builder: (context) {
            value = resolve(context);
            return const SizedBox.shrink();
          },
        ),
      ),
    );

    return value;
  }
}
