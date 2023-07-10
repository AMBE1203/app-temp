import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../resources/resources.dart';
import '../../app.dart';
import '../../shared_view/app_button.dart';
import 'provider/provider.dart';

@RoutePage()
class SignUpPage extends HookConsumerWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return CommonScaffold(
      hideKeyboardWhenTouchOutside: true,
      appBar: CommonAppBar(
        text: S.current.signUp,
        // leadingIcon: LeadingIcon.close,
        leadingIconColor: AppColors.current.secondaryColor,
        backgroundColor: AppColors.current.primaryColor,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(Dimens.d15.responsive()),
        child: _Form(),
      ),
    );
  }
}

class _Form extends AppForm {
  _Form();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // List<String> getGender() {
    //   return [S.current.male, S.current.female, S.current.other];
    // }
    final errorText = useState('');

    Future<void> onSubmit() async {
      final data = getFormData();
      if (data != null) {
        final result = await ref.read(authProvider.notifier).register(data[FieldType.email.name], data[FieldType.password.name]);
        if (result) {
          await getIt.get<AppNavigator>().push(const MainRoute());
        }
      }
    }

    Future<bool?> checkEmail(BaseComponent data) async {
      final result = await super.onFocus(data);
      if (result == true) {
        formKey.currentState!.save();
        final data = formKey.currentState!.value[FieldType.email.name];
        if (data != null) {
          final check = await ref.read(authProvider.notifier).checkEmail(data.toString().trim());
          if (check == true) {
            errorText.value = S.current.emailAlreadyExists;
          }
        }
      }
      return null;
    }

    return FormBuilder(
      key: formKey,
      child: Column(
        children: [
          AppInput(field: FieldType.email, labelText: S.current.email, keyboardType: TextInputType.emailAddress, enableLoading: true, onFocus: checkEmail, errorText: errorText.value),
          SizedBox(height: Dimens.d15.responsive()),
          AppInput(field: FieldType.password, labelText: S.current.password, keyboardType: TextInputType.visiblePassword, onFocus: onFocus),
          SizedBox(height: Dimens.d15.responsive()),
          AppInput(field: FieldType.confirmPassword, labelText: S.current.confirmPassword, keyboardType: TextInputType.visiblePassword, enableNextFocus: false, onFocus: onFocus),
          SizedBox(height: Dimens.d15.responsive()),
          // AppInput(field: FieldType.firstName, labelText: S.current.firstName),
          // SizedBox(height: Dimens.d15.responsive()),
          // AppInput(field: FieldType.lastName, labelText: S.current.lastName),
          // SizedBox(height: Dimens.d15.responsive()),
          // AppDropdown(field: FieldType.gender, labelText: S.current.gender, hintText: '-- Choose --', items: getGender()),
          // SizedBox(height: Dimens.d15.responsive()),
          // AppInput(field: FieldType.phoneNumber, labelText: S.current.phone),
          // SizedBox(height: Dimens.d15.responsive()),
          // AppInput(field: FieldType.dateOfBirth, labelText: S.current.dateOfBirth, hintText: 'YYYY-MM-DD', enableNextFocus: false),
          // SizedBox(height: Dimens.d15.responsive()),
          AppButton(S.current.signUp, onPressed: onSubmit),
        ],
      ),
    );
  }
}
