import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(
  name: 'Playground',
  type: DSIconButton,
  path: '[Components]/Buttons',
)
Widget dsIconButtonPlaygroundUseCase(BuildContext context) {
  final semanticLabel = context.knobs.string(
    label: 'Semantic label',
    initialValue: 'Add',
  );
  final variant = context.knobs.object.dropdown<DSButtonVariant>(
    label: 'Variant',
    options: DSButtonVariant.values,
    labelBuilder: (variant) => variant.name,
  );
  final icon = context.knobs.object.dropdown<_IconButtonIcon>(
    label: 'Icon',
    options: _IconButtonIcon.values,
    labelBuilder: (icon) => icon.label,
  );
  final isLoading = context.knobs.boolean(label: 'Loading');
  final isDisabled = context.knobs.boolean(label: 'Disabled');

  return _ButtonPreview(
    child: DSIconButton(
      icon: icon.widget,
      semanticLabel: semanticLabel,
      variant: variant,
      isLoading: isLoading,
      onPressed: isDisabled || isLoading ? null : () {},
    ),
  );
}

class _ButtonPreview extends StatelessWidget {
  const _ButtonPreview({required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Center(child: child);
  }
}

enum _IconButtonIcon {
  add,
  close,
  favorite,
  download,
}

extension on _IconButtonIcon {
  String get label {
    return switch (this) {
      _IconButtonIcon.add => 'Add',
      _IconButtonIcon.close => 'Close',
      _IconButtonIcon.favorite => 'Favorite',
      _IconButtonIcon.download => 'Download',
    };
  }

  Widget get widget {
    return switch (this) {
      _IconButtonIcon.add => const Icon(Icons.add),
      _IconButtonIcon.close => const Icon(Icons.close),
      _IconButtonIcon.favorite => const Icon(Icons.favorite),
      _IconButtonIcon.download => const Icon(Icons.download),
    };
  }
}
