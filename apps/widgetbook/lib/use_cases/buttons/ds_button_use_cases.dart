import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(
  name: 'Playground',
  type: DSButton,
  path: '[Components]/Buttons',
)
Widget dsButtonPlaygroundUseCase(BuildContext context) {
  final label = context.knobs.string(
    label: 'Label',
    initialValue: 'Continue',
  );
  final variant = context.knobs.object.dropdown<DSButtonVariant>(
    label: 'Variant',
    options: DSButtonVariant.values,
    labelBuilder: (variant) => variant.name,
  );
  final size = context.knobs.object.dropdown<DSButtonSize>(
    label: 'Size',
    options: DSButtonSize.values,
    initialOption: DSButtonSize.md,
    labelBuilder: (size) => size.name,
  );
  final icon = context.knobs.object.dropdown<_ButtonIcon>(
    label: 'Icon',
    options: _ButtonIcon.values,
    labelBuilder: (icon) => icon.label,
  );
  final iconPosition = context.knobs.object.dropdown<DSButtonIconPosition>(
    label: 'Icon position',
    options: DSButtonIconPosition.values,
    labelBuilder: (position) => position.name,
  );
  final isLoading = context.knobs.boolean(label: 'Loading');
  final isDisabled = context.knobs.boolean(label: 'Disabled');

  return _ButtonPreview(
    child: DSButton(
      label: label,
      icon: icon.widget,
      iconPosition: iconPosition,
      variant: variant,
      size: size,
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

enum _ButtonIcon {
  none,
  add,
  arrowForward,
  download,
}

extension on _ButtonIcon {
  String get label {
    return switch (this) {
      _ButtonIcon.none => 'None',
      _ButtonIcon.add => 'Add',
      _ButtonIcon.arrowForward => 'Arrow forward',
      _ButtonIcon.download => 'Download',
    };
  }

  Widget? get widget {
    return switch (this) {
      _ButtonIcon.none => null,
      _ButtonIcon.add => const Icon(Icons.add),
      _ButtonIcon.arrowForward => const Icon(Icons.arrow_forward),
      _ButtonIcon.download => const Icon(Icons.download),
    };
  }
}
