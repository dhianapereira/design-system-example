# Design System Example

An example Design System project in Flutter.

This repository demonstrates how to structure, build, test, and document a
Flutter Design System with:

- design tokens;
- light and dark themes;
- testable components;
- accessibility considerations;
- responsive foundations;
- Widgetbook documentation.

## Monorepo structure

```txt
design-system-example/
  apps/
    widgetbook/
      lib/
      web/
      pubspec.yaml

  packages/
    design_system/
      lib/
      test/
      pubspec.yaml

  pubspec.yaml
  README.md
```

## Packages

### `packages/design_system`

Flutter package that exposes the Design System public API.

Current structure:

```txt
packages/design_system/
  lib/
    design_system.dart
    src/
      foundations/
      theme/
      components/
        buttons/
          ds_button/
          ds_icon_button/
          styles/

  test/
    foundations/
    theme/
    components/
```

The button components are intentionally split between:

- `DSButton`: text button with optional icon;
- `DSIconButton`: icon-only button with required semantic label;
- shared button styles and enums.

### `apps/widgetbook`

Widgetbook app used to visualize Design System components in isolation.

The component catalog is generated with `widgetbook_generator`, so use cases do
not need to be manually registered in `main.dart`.

Current use cases include:

- `DSButton`;
- `DSIconButton`;
- light and dark themes.

## Commands

Install dependencies:

```sh
flutter pub get
```

Analyze the workspace packages:

```sh
flutter analyze packages/design_system apps/widgetbook
```

Run Design System tests:

```sh
flutter test packages/design_system
```

Generate Widgetbook directories:

```sh
cd apps/widgetbook
dart run build_runner build
```

Run Widgetbook locally:

```sh
cd apps/widgetbook
flutter run -d web-server --web-hostname 127.0.0.1 --web-port 8080
```

Build Widgetbook for web:

```sh
cd apps/widgetbook
flutter build web
```

## Widgetbook workflow

To add a component to Widgetbook, create a use case function inside
`apps/widgetbook/lib/use_cases` and annotate it with `@widgetbook.UseCase`.

```dart
@widgetbook.UseCase(
  name: 'Primary',
  type: DSButton,
  path: '[Components]/Buttons',
)
Widget dsButtonPrimaryUseCase(BuildContext context) {
  return DSButton(
    label: 'Continue',
    onPressed: () {},
  );
}
```

After adding or changing use cases, run:

```sh
cd apps/widgetbook
dart run build_runner build
```

The generated file `apps/widgetbook/lib/main.directories.g.dart` should not be
edited by hand.

## LICENSE

This project is licensed under the terms described in [LICENSE](./LICENSE).
