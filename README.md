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

## Requirements

- Flutter 3.44.0
- Dart >=3.6.0 <4.0.0
- Melos 7.8.2 or newer

## Structure

```txt
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
```

## Widgetbook deployment

Widgetbook deployments are handled by GitHub Actions and GitHub Pages.

The workflow runs when a tag matching `widgetbook-v*` is pushed, or when it is
started manually from the Actions tab:

```sh
git tag widgetbook-v1.0.0
git push origin widgetbook-v1.0.0
```

## License

This project is licensed under the terms described in [LICENSE](./LICENSE).
