import 'package:design_system/src/components/text/styles/ds_text_color.dart';
import 'package:design_system/src/components/text/styles/ds_text_variant.dart';
import 'package:flutter/widgets.dart';

/// Text component that applies Design System typography and semantic colors.
class DSText extends StatelessWidget {
  /// Creates a text widget using Design System tokens.
  const DSText(
    this.data, {
    super.key,
    this.variant = DSTextVariant.bodyMedium,
    this.color = DSTextColor.primary,
    this.style,
    this.textAlign,
    this.maxLines,
    this.overflow,
    this.softWrap,
    this.semanticsLabel,
  });

  /// Text displayed by this widget.
  final String data;

  /// Typography token used as the base text style.
  final DSTextVariant variant;

  /// Semantic color token applied to the text.
  final DSTextColor color;

  /// Additional style merged over the Design System base style.
  final TextStyle? style;

  /// How the text should be aligned horizontally.
  final TextAlign? textAlign;

  /// Maximum number of lines before truncation.
  final int? maxLines;

  /// How visual overflow should be handled.
  final TextOverflow? overflow;

  /// Whether the text should break at soft line breaks.
  final bool? softWrap;

  /// Accessibility label used when the visible copy is not descriptive enough.
  final String? semanticsLabel;

  @override
  Widget build(BuildContext context) {
    final textStyle = variant.style
        .copyWith(
          color: color.resolve(context),
        )
        .merge(style);

    return Text(
      data,
      style: textStyle,
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: overflow,
      softWrap: softWrap,
      semanticsLabel: semanticsLabel,
    );
  }
}
