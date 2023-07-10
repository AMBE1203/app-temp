import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../resources/resources.dart';
import '../app.dart';

class AppCheckBox extends HookConsumerWidget {
  const AppCheckBox({
    required this.field,
    this.hintText,
    this.suffixIcon,
    this.controller,
    this.onChanged,
    this.keyboardType,
    this.validator,
    this.onSubmitted,
    this.maxLines,
    this.errorText,
    this.value,
    this.labelText,
    this.onFocus,
    this.nextField,
    this.enableLoading = false,
    this.enableNextFocus = true,
    super.key,
  });

  final FieldType field;
  final FieldType? nextField;
  final bool enableLoading;
  final bool enableNextFocus;
  final String? Function(String?)? validator;
  final Function(String?)? onSubmitted;
  final Function(String?)? onChanged;
  final TextInputType? keyboardType;
  final TextEditingController? controller;
  final int? maxLines;
  final String? errorText;
  final String? value;
  final Widget? suffixIcon;
  final String? hintText;
  final String? labelText;
  final Future<void> Function(AppInput)? onFocus;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    debugPrint('build: $field');

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        labelText != null ? AppText(labelText, type: TextType.content) : const SizedBox.shrink(),
        const SizedBox(height: 5),
        FormBuilderCheckbox(
          name: field.name,
          initialValue: false,
          // onChanged: _onChanged,
          title: RichText(
            text: TextSpan(
              children: [
                TextSpan(text: 'I have read and agree to the ', style: AppTextStyles.h14),
                TextSpan(
                  text: 'Terms and Conditions',
                  style: AppTextStyles.h14.copyWith(color: Colors.blue),
                  // Flutter doesn't allow a button inside a button
                  // https://github.com/flutter/flutter/issues/31437#issuecomment-492411086
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      debugPrint('launch url');
                    },
                ),
              ],
            ),
          ),
          validator: checkValidatorBool(field),
        ),
      ],
    );
  }
}
