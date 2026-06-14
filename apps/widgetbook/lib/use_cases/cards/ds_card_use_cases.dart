import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(
  name: 'Playground',
  type: DSCard,
  path: '[Components]/Cards',
)
Widget dsCardPlaygroundUseCase(BuildContext context) {
  final title = context.knobs.string(
    label: 'Title',
    initialValue: 'Billing summary',
  );
  final description = context.knobs.string(
    label: 'Description',
    initialValue: 'Your next invoice will be generated on July 1.',
  );
  final variant = context.knobs.object.dropdown<DSCardVariant>(
    label: 'Variant',
    options: DSCardVariant.values,
    initialOption: DSCardVariant.outlined,
    labelBuilder: (variant) => variant.name,
  );
  final padding = context.knobs.object.dropdown<DSCardPadding>(
    label: 'Padding',
    options: DSCardPadding.values,
    initialOption: DSCardPadding.md,
    labelBuilder: (padding) => padding.name,
  );
  final interactive = context.knobs.boolean(label: 'Interactive');
  final enabled = context.knobs.boolean(label: 'Enabled', initialValue: true);

  return Center(
    child: ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 360),
      child: DSCard(
        variant: variant,
        padding: padding,
        enabled: enabled,
        semanticLabel: interactive ? title : null,
        onTap: interactive ? () {} : null,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: DSSpacing.xs),
            Text(
              description,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ],
        ),
      ),
    ),
  );
}
