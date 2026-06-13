# Design System Widgetbook

Widgetbook app for visualizing the example Flutter Design System components.

## Running locally

```sh
flutter run -d web-server --web-hostname 127.0.0.1 --web-port 8080
```

Then open:

```txt
http://127.0.0.1:8080
```

The current setup includes initial use cases for:

- `DSButton`;
- `DSIconButton`.

## Build

```sh
flutter build web
```

The generated files are written to `build/web`.
