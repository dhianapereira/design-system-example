import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

import 'main.directories.g.dart';

void main() {
  runApp(const DesignSystemWidgetbook());
}

@widgetbook.App()
class DesignSystemWidgetbook extends StatelessWidget {
  const DesignSystemWidgetbook({super.key});

  @override
  Widget build(BuildContext context) {
    return Widgetbook.material(
      addons: [
        MaterialThemeAddon(
          themes: [
            WidgetbookTheme(name: 'Light', data: DSTheme.light()),
            WidgetbookTheme(name: 'Dark', data: DSTheme.dark()),
          ],
        ),
      ],
      directories: directories,
    );
  }
}
