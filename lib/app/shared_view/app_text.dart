import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../resources/resources.dart';

enum TextType { header, title, description, content }

class AppText extends ConsumerWidget {
  const AppText(
    this.value, {
    super.key,
    this.lineHeight,
    this.type,
    this.maxLines,
    this.fontStyle,
    this.textStyle,
    this.overflow,
    this.softWrap,
    this.textAlign,
    this.color,
    this.isBold,
    this.decoration,
  });
  final String? value;
  final TextType? type;
  final TextStyle? textStyle;
  final FontStyle? fontStyle;
  final TextOverflow? overflow;
  final bool? softWrap;
  final TextAlign? textAlign;
  final Color? color;
  final bool? isBold;
  final TextDecoration? decoration;
  final int? maxLines;
  final double? lineHeight;

  TextStyle bold() {
    return textStyle!.bold();
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var result = textStyle;
    var _isBold = false;
    switch (type) {
      case TextType.header:
        result = AppTextStyles.h20;
        _isBold = isBold ?? true;
        break;
      case TextType.title:
        result = AppTextStyles.h16;
        _isBold = isBold ?? true;
        break;
      case TextType.content:
        result = AppTextStyles.h14;
        _isBold = isBold ?? false;
        break;
      default:
        result = AppTextStyles.h12;
    }
    final style = _isBold ? result.bold() : result;
    return Text(
      value ?? '',
      style: textStyle ?? style.copyWith(color: color ?? AppColors.current.primaryTextColor, decoration: decoration, fontStyle: fontStyle, height: lineHeight),
      textAlign: textAlign,
      overflow: overflow,
      softWrap: softWrap,
      maxLines: maxLines,
    );
  }
}
