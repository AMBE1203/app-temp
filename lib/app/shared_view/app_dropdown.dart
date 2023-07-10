import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../resources/resources.dart';
import '../app.dart';

enum DropdownType { form, bottom }

class DataDropdown {
  int? index;
  String? title;
  DataDropdown(this.index, this.title);
}

class AppDropdown extends HookConsumerWidget {
  const AppDropdown({
    required this.items,
    required this.field,
    super.key,
    this.type = DropdownType.form,
    this.item,
    this.labelText,
    this.hintText,
    this.onChanged,
    this.validator,
    this.value,
    this.errorText,
  });
  final DropdownType type;
  final List<String> items;
  final String? item;
  final ValueChanged<String>? onChanged;
  final String? labelText;
  final String? hintText;
  final String? errorText;

  final FieldType field;
  final String? value;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _focusNode = useFocusNode();

    Widget _buildContent() {
      switch (type) {
        case DropdownType.bottom:
          return DropdownButton2(
            isExpanded: true,
            hint: AppText(hintText, type: TextType.content),
            items: items.map((x) => DropdownMenuItem<String>(value: x, child: AppText(x))).toList(),
            value: item,
            onChanged: (String? val) => onChanged?.call(val ?? ''),
            // buttonHeight: 40,
            // itemHeight: 40,
            // icon: Assets.svgs.arrow.svg(),
            // buttonPadding: const EdgeInsets.all(10.0),
            // dropdownPadding: const EdgeInsets.all(0.0),
            // itemPadding: const EdgeInsets.all(10.0),
            // selectedItemHighlightColor: AppColors.current.primaryColor,
            // focusColor: Colors.red,
            // selectedItemBuilder: (context) {
            //   return [textTitle(item)];
            // },
            // ),
          );

        default:
          return FormBuilderDropdown(
            name: field.name,
            initialValue: value == '' ? null : value,
            items: items.map((x) => DropdownMenuItem(alignment: AlignmentDirectional.centerStart, value: x, child: AppText(x, type: TextType.content))).toList(),
            focusNode: _focusNode,
            style: AppTextStyles.h14, // AppTextStyles.h14.copyWith(color: theme.appColors.black),
            validator: validator ?? checkValidator(field),
            icon: SizedBox(width: Dimens.d8.responsive()),
            // hint: AppText(hintText, type: TextType.content),
            onChanged: (val) {
              // formKey?.currentState?.fields[name]?.didChange(null);
            },
            decoration: InputDecoration(
              contentPadding: EdgeInsets.fromLTRB(Dimens.d8.responsive(), Dimens.d5.responsive(), Dimens.d8.responsive(), Dimens.d5.responsive()),
              border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(Dimens.d5.responsive()))),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(Dimens.d5.responsive())),
                borderSide: BorderSide(width: 0.0, color: AppColors.current.borderInput),
              ),
              hintText: hintText,
              floatingLabelBehavior: FloatingLabelBehavior.never,
              isDense: true,
              suffixIcon: const Icon(Icons.arrow_drop_down, size: 30),
              suffixIconConstraints: BoxConstraints.expand(width: Dimens.d45.responsive(), height: Dimens.d45.responsive()),
              errorStyle: AppTextStyles.h12.copyWith(color: AppColors.current.errorTextColor),
              errorMaxLines: 3,
              errorText: errorText,
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(Dimens.d5.responsive()),
                borderSide: const BorderSide(width: 0.5, color: Colors.redAccent),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(Dimens.d5.responsive())),
                borderSide: const BorderSide(width: 0.5, color: Colors.redAccent),
              ),
              focusColor: Colors.redAccent,
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(Dimens.d5.responsive())),
                borderSide: BorderSide(width: 0.0, color: AppColors.current.borderInput),
              ),
            ),
            autovalidateMode: AutovalidateMode.onUserInteraction,
          );
      }
    }

    return Column(
      children: [
        Align(alignment: Alignment.centerLeft, child: AppText(labelText, type: TextType.content)),
        SizedBox(height: Dimens.d5.responsive()),
        // SizedBox(
        //   height: 50,
        // decoration: BoxDecoration(border: Border.all(color: AppColors.current.border), borderRadius: BorderRadius.all(Radius.circular(Dimens.d5.responsive()))),
        // child:
        DropdownButtonHideUnderline(child: _buildContent()),
        // ),
      ],
    );
  }
}
