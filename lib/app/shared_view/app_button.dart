import 'package:flutter/material.dart';

import '../../resources/resources.dart';
import '../../shared/shared.dart';
import '../app.dart';

enum ButtonType { fill, outline, link }

class AppButton extends StatelessWidget {
  const AppButton(
    this.value, {
    super.key,
    this.type = ButtonType.fill,
    this.onPressed,
    this.color,
    this.backgroundColor,
    this.borderRadius,
    this.height,
    this.width,
    this.isBold = true,
    this.isExpand = true,
    this.leftIcon,
    this.paddingButtonLink,
    this.isUnderline,
  });
  final ButtonType type;
  final String? value;
  final Function()? onPressed;
  final Color? color;
  final Color? backgroundColor;
  final bool isBold;
  final bool isExpand;
  final double? height;
  final double? width;
  final double? borderRadius;
  final Widget? leftIcon;
  final EdgeInsetsGeometry? paddingButtonLink;
  final bool? isUnderline;

  @override
  Widget build(BuildContext context) {
    var locked = false;

    void onTap() {
      if (locked) return;
      if (!locked) {
        locked = true;
        Future.delayed(const Duration(milliseconds: 3000), () => locked = false);
      }
      onPressed?.call();
    }

    Widget _buildContent() {
      switch (type) {
        case ButtonType.outline:
          return OutlinedButton(
            style: OutlinedButton.styleFrom(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(Dimens.d5.responsive())),
              side: BorderSide(color: color ?? AppColors.current.primaryColor, width: 1.0, style: BorderStyle.solid),
              minimumSize: isExpand ? Size.fromHeight(height ?? UiConstants.defaultSizeButton.responsive()) : null,
            ),
            onPressed: onTap,
            child: Stack(
              children: <Widget>[
                Align(alignment: Alignment.centerLeft, child: SizedBox(width: 20, child: leftIcon)),
                Align(alignment: Alignment.center, child: AppText(value, isBold: isBold, color: color, type: TextType.content)),
              ],
            ),
          );

        case ButtonType.link:
          return InkWell(
            onTap: onTap,
            child: Padding(
              padding: paddingButtonLink ?? EdgeInsets.symmetric(vertical: Dimens.d12.responsive(), horizontal: 0),
              child: AppText(value, color: color ?? AppColors.current.primaryColor, isBold: isBold, type: TextType.content, decoration: isUnderline == true ? TextDecoration.underline : TextDecoration.none),
            ),
          );

        default:
          return ElevatedButton(
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(Dimens.d5.responsive())),
              backgroundColor: onPressed == null ? AppColors.current.disabled : backgroundColor ?? AppColors.current.primaryColor,
              minimumSize: isExpand ? Size.fromHeight(height ?? UiConstants.defaultSizeButton.responsive()) : null,
            ),
            onPressed: onTap,
            child: AppText(value, isBold: isBold, color: color ?? AppColors.current.secondaryTextColor, type: TextType.content),
          );
      }
    }

    return SizedBox(
      height: height ?? UiConstants.defaultSizeButton.responsive(),
      child: _buildContent(),
    );
  }
}
