import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';

void main() {
  runApp(const DesignSystemWidgetbook());
}

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
      directories: [
        WidgetbookCategory(
          name: 'Components',
          children: [
            WidgetbookFolder(
              name: 'Buttons',
              children: [
                WidgetbookComponent(
                  name: 'DSButton',
                  useCases: [
                    WidgetbookUseCase(
                      name: 'Primary',
                      builder: (_) => _ButtonPreview(
                        child: DSButton(
                          label: 'Continue',
                          onPressed: () {},
                        ),
                      ),
                    ),
                    WidgetbookUseCase(
                      name: 'Secondary',
                      builder: (_) => _ButtonPreview(
                        child: DSButton(
                          label: 'Continue',
                          variant: DSButtonVariant.secondary,
                          onPressed: () {},
                        ),
                      ),
                    ),
                    WidgetbookUseCase(
                      name: 'Outline',
                      builder: (_) => _ButtonPreview(
                        child: DSButton(
                          label: 'Continue',
                          variant: DSButtonVariant.outline,
                          onPressed: () {},
                        ),
                      ),
                    ),
                    WidgetbookUseCase(
                      name: 'With leading icon',
                      builder: (_) => _ButtonPreview(
                        child: DSButton(
                          label: 'Add item',
                          icon: const Icon(Icons.add),
                          onPressed: () {},
                        ),
                      ),
                    ),
                    WidgetbookUseCase(
                      name: 'With trailing icon',
                      builder: (_) => _ButtonPreview(
                        child: DSButton(
                          label: 'Next',
                          icon: const Icon(Icons.arrow_forward),
                          iconPosition: DSButtonIconPosition.end,
                          onPressed: () {},
                        ),
                      ),
                    ),
                    WidgetbookUseCase(
                      name: 'Loading',
                      builder: (_) => const _ButtonPreview(
                        child: DSButton(
                          label: 'Saving',
                          isLoading: true,
                          onPressed: null,
                        ),
                      ),
                    ),
                    WidgetbookUseCase(
                      name: 'Disabled',
                      builder: (_) => const _ButtonPreview(
                        child: DSButton(
                          label: 'Continue',
                          onPressed: null,
                        ),
                      ),
                    ),
                  ],
                ),
                WidgetbookComponent(
                  name: 'DSIconButton',
                  useCases: [
                    WidgetbookUseCase(
                      name: 'Primary',
                      builder: (_) => _ButtonPreview(
                        child: DSIconButton(
                          icon: const Icon(Icons.add),
                          semanticLabel: 'Add',
                          onPressed: () {},
                        ),
                      ),
                    ),
                    WidgetbookUseCase(
                      name: 'Secondary',
                      builder: (_) => _ButtonPreview(
                        child: DSIconButton(
                          icon: const Icon(Icons.add),
                          semanticLabel: 'Add',
                          variant: DSButtonVariant.secondary,
                          onPressed: () {},
                        ),
                      ),
                    ),
                    WidgetbookUseCase(
                      name: 'Outline',
                      builder: (_) => _ButtonPreview(
                        child: DSIconButton(
                          icon: const Icon(Icons.add),
                          semanticLabel: 'Add',
                          variant: DSButtonVariant.outline,
                          onPressed: () {},
                        ),
                      ),
                    ),
                    WidgetbookUseCase(
                      name: 'Loading',
                      builder: (_) => const _ButtonPreview(
                        child: DSIconButton(
                          icon: Icon(Icons.add),
                          semanticLabel: 'Add',
                          isLoading: true,
                          onPressed: null,
                        ),
                      ),
                    ),
                    WidgetbookUseCase(
                      name: 'Disabled',
                      builder: (_) => const _ButtonPreview(
                        child: DSIconButton(
                          icon: Icon(Icons.add),
                          semanticLabel: 'Add',
                          onPressed: null,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}

class _ButtonPreview extends StatelessWidget {
  const _ButtonPreview({required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Center(child: child);
  }
}
