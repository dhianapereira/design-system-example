import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(
  name: 'Playground',
  type: DSDropdown,
  path: '[Components]/Dropdowns',
)
Widget dsDropdownPlaygroundUseCase(BuildContext context) {
  final label = context.knobs.string(
    label: 'Label',
    initialValue: 'Country',
  );
  final hintText = context.knobs.string(
    label: 'Hint text',
    initialValue: 'Select country',
  );
  final helperText = context.knobs.string(
    label: 'Helper text',
    initialValue: 'Choose the country used for billing.',
  );
  final errorText = context.knobs.string(
    label: 'Error text',
    initialValue: '',
  );
  final selected = context.knobs.object.dropdown<_CountryOption>(
    label: 'Selected',
    options: _CountryOption.values,
    labelBuilder: (option) => option.label,
  );
  final variant = context.knobs.object.dropdown<DSDropdownVariant>(
    label: 'Variant',
    options: DSDropdownVariant.values,
    labelBuilder: (variant) => variant.name,
  );
  final size = context.knobs.object.dropdown<DSDropdownSize>(
    label: 'Size',
    options: DSDropdownSize.values,
    initialOption: DSDropdownSize.md,
    labelBuilder: (size) => size.name,
  );
  final prefixIcon = context.knobs.object.dropdown<_DropdownIcon>(
    label: 'Prefix icon',
    options: _DropdownIcon.values,
    labelBuilder: (icon) => icon.label,
  );
  final menuHeight = context.knobs.object.dropdown<_MenuHeight>(
    label: 'Menu height',
    options: _MenuHeight.values,
    labelBuilder: (height) => height.label,
  );
  final enabled = context.knobs.boolean(
    label: 'Enabled',
    initialValue: true,
  );

  return _DropdownPreview(
    child: DSDropdown<String>(
      value: selected.value,
      label: label,
      hintText: hintText,
      helperText: helperText.isEmpty ? null : helperText,
      errorText: errorText.isEmpty ? null : errorText,
      variant: variant,
      size: size,
      prefixIcon: prefixIcon.widget,
      menuMaxHeight: menuHeight.value,
      enabled: enabled,
      semanticLabel: label,
      items: const [
        DSDropdownItem(value: 'br', label: 'Brazil'),
        DSDropdownItem(value: 'ca', label: 'Canada'),
        DSDropdownItem(value: 'pt', label: 'Portugal'),
        DSDropdownItem(value: 'us', label: 'United States'),
        DSDropdownItem(value: 'uk', label: 'United Kingdom'),
      ],
      onChanged: enabled ? (_) {} : null,
    ),
  );
}

class _DropdownPreview extends StatelessWidget {
  const _DropdownPreview({required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 360),
        child: child,
      ),
    );
  }
}

enum _CountryOption {
  none,
  brazil,
  canada,
  portugal,
  unitedStates,
}

extension on _CountryOption {
  String get label {
    return switch (this) {
      _CountryOption.none => 'None',
      _CountryOption.brazil => 'Brazil',
      _CountryOption.canada => 'Canada',
      _CountryOption.portugal => 'Portugal',
      _CountryOption.unitedStates => 'United States',
    };
  }

  String? get value {
    return switch (this) {
      _CountryOption.none => null,
      _CountryOption.brazil => 'br',
      _CountryOption.canada => 'ca',
      _CountryOption.portugal => 'pt',
      _CountryOption.unitedStates => 'us',
    };
  }
}

enum _DropdownIcon {
  none,
  public,
  language,
  location,
}

extension on _DropdownIcon {
  String get label {
    return switch (this) {
      _DropdownIcon.none => 'None',
      _DropdownIcon.public => 'Public',
      _DropdownIcon.language => 'Language',
      _DropdownIcon.location => 'Location',
    };
  }

  Widget? get widget {
    return switch (this) {
      _DropdownIcon.none => null,
      _DropdownIcon.public => const Icon(Icons.public),
      _DropdownIcon.language => const Icon(Icons.language),
      _DropdownIcon.location => const Icon(Icons.location_on),
    };
  }
}

enum _MenuHeight {
  automatic,
  compact,
  tall,
}

extension on _MenuHeight {
  String get label {
    return switch (this) {
      _MenuHeight.automatic => 'Automatic',
      _MenuHeight.compact => 'Compact',
      _MenuHeight.tall => 'Tall',
    };
  }

  double? get value {
    return switch (this) {
      _MenuHeight.automatic => null,
      _MenuHeight.compact => 160,
      _MenuHeight.tall => 320,
    };
  }
}
