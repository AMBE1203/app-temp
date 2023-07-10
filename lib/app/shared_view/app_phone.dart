import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:form_builder_phone_field/form_builder_phone_field.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../resources/resources.dart';
import '../app.dart';

class AppPhone extends BaseComponent {
  const AppPhone({
    required super.field,
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
  final Future<void> Function(BaseComponent)? onFocus;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _controller = useTextEditingController(text: value);
    final _focusNode = useFocusNode();
    debugPrint('build: $field');

    Future<void> callback() async {
      debugPrint('onFocus: $field - ${_focusNode.hasFocus} - ${_controller.text}');
      if (_focusNode.hasFocus == false) {
        //   final val = _controller.text.toHalfWidth();  // convert fullsize to halfsize
        //   _controller.text = val;

        await onFocus?.call(this);
      }
    }

    useEffect(() {
      debugPrint('focusNodes: ${field} - ${_focusNode.hasFocus}');
      _focusNode.addListener(callback);
      return;
    }, [_focusNode]);

    Widget _buildContent() {
      // https://github.com/flutter-form-builder-ecosystem/form_builder_phone_field
      return FormBuilderPhoneField(
        name: field.name,
        focusNode: _focusNode,
        // isCupertinoPicker: true,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(vertical: Dimens.d2.responsive()),
          border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(Dimens.d5.responsive()))),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(Dimens.d5.responsive())),
            borderSide: BorderSide(width: 0, color: AppColors.current.borderInput),
          ),
          // labelText: hintText ?? labelText,
          // hintText: hintText ?? labelText,
        ),
        isSearchable: true,
        iconSelector: const SizedBox.shrink(),
        // onChanged: _onChanged,
        priorityListByIsoCode: const ['US'],
        validator: validator ?? checkValidator(field),
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        labelText != null ? AppText(labelText, type: TextType.content) : const SizedBox.shrink(),
        const SizedBox(height: 5),
        _buildContent(),
      ],
    );
  }
}
