# Design System Widgetbook

Widgetbook app for visualizing the example Flutter Design System components.

The directories are generated with `widgetbook_generator` from
`@widgetbook.UseCase` annotations.

## Running locally

```sh
flutter run -d web-server --web-hostname 127.0.0.1 --web-port 8080
```

Then open:

```txt
http://127.0.0.1:8080
```

## Adding use cases

Create a file under `lib/use_cases` and annotate a public function with
`@widgetbook.UseCase`.

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

Then regenerate the Widgetbook directories:

```sh
dart run build_runner build
```

Do not edit `lib/main.directories.g.dart` manually.

## Build

```sh
flutter build web
```

The generated files are written to `build/web`.
