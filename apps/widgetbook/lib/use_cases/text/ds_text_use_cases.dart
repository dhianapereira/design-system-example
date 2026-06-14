import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(
  name: 'Playground',
  type: DSText,
  path: '[Components]/Text',
)
Widget dsTextPlaygroundUseCase(BuildContext context) {
  final data = context.knobs.string(
    label: 'Text',
    initialValue: 'Build consistent Flutter interfaces with DSText.',
  );
  final variant = context.knobs.object.dropdown<DSTextVariant>(
    label: 'Variant',
    options: DSTextVariant.values,
    initialOption: DSTextVariant.bodyMedium,
    labelBuilder: (variant) => variant.name,
  );
  final color = context.knobs.object.dropdown<DSTextColor>(
    label: 'Color',
    options: DSTextColor.values,
    initialOption: DSTextColor.primary,
    labelBuilder: (color) => color.name,
  );
  final textAlign = context.knobs.object.dropdown<_TextAlignOption>(
    label: 'Text align',
    options: _TextAlignOption.values,
    labelBuilder: (option) => option.label,
  );
  final maxLines = context.knobs.object.dropdown<_TextMaxLines>(
    label: 'Max lines',
    options: _TextMaxLines.values,
    labelBuilder: (option) => option.label,
  );
  final overflow = context.knobs.object.dropdown<TextOverflow>(
    label: 'Overflow',
    options: TextOverflow.values,
    initialOption: TextOverflow.clip,
    labelBuilder: (overflow) => overflow.name,
  );

  return _TextPreview(
    child: DSText(
      data,
      variant: variant,
      color: color,
      textAlign: textAlign.value,
      maxLines: maxLines.value,
      overflow: overflow,
    ),
  );
}

class _TextPreview extends StatelessWidget {
  const _TextPreview({required this.child});

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

enum _TextAlignOption {
  start,
  center,
  end,
  justify,
}

extension on _TextAlignOption {
  String get label {
    return switch (this) {
      _TextAlignOption.start => 'Start',
      _TextAlignOption.center => 'Center',
      _TextAlignOption.end => 'End',
      _TextAlignOption.justify => 'Justify',
    };
  }

  TextAlign get value {
    return switch (this) {
      _TextAlignOption.start => TextAlign.start,
      _TextAlignOption.center => TextAlign.center,
      _TextAlignOption.end => TextAlign.end,
      _TextAlignOption.justify => TextAlign.justify,
    };
  }
}

enum _TextMaxLines {
  unlimited,
  one,
  two,
  three,
}

extension on _TextMaxLines {
  String get label {
    return switch (this) {
      _TextMaxLines.unlimited => 'Unlimited',
      _TextMaxLines.one => '1',
      _TextMaxLines.two => '2',
      _TextMaxLines.three => '3',
    };
  }

  int? get value {
    return switch (this) {
      _TextMaxLines.unlimited => null,
      _TextMaxLines.one => 1,
      _TextMaxLines.two => 2,
      _TextMaxLines.three => 3,
    };
  }
}
