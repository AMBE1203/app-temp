import 'package:auto_route/annotations.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../resources/resources.dart';
import '../../app.dart';
import '../../shared_view/app_button.dart';
import 'provider/provider.dart';

@RoutePage()
class LoginPage extends HookConsumerWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return CommonScaffold(
      hideKeyboardWhenTouchOutside: true,
      body: SingleChildScrollView(
        padding: EdgeInsets.all(Dimens.d15.responsive()),
        child: _Form(),
      ),
    );
  }
}

class _Form extends AppForm {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Future<void> onSubmit() async {
      final data = getFormData();
      if (data != null) {
        final result = await ref.read(authProvider.notifier).login(data[FieldType.email.name], data[FieldType.password.name]);
        if (result) {
          await getIt.get<AppNavigator>().push(const MainRoute());
        } else {
          formKey.currentState?.fields[FieldType.password.name]?.didChange('');
        }
      }
    }

    return FormBuilder(
      key: formKey,
      child: Column(
        children: [
          AppInput(field: FieldType.email, nextField: FieldType.password, labelText: S.current.email, keyboardType: TextInputType.emailAddress, onFocus: onFocus),
          SizedBox(height: Dimens.d15.responsive()),
          AppInput(field: FieldType.password, labelText: S.current.password, keyboardType: TextInputType.visiblePassword, enableNextFocus: false, onFocus: onFocus),
          SizedBox(height: Dimens.d20.responsive()),
          AppButton(S.current.login, onPressed: onSubmit),
          SizedBox(height: Dimens.d20.responsive()),
          Align(
            alignment: Alignment.center,
            child: RichText(
              text: TextSpan(
                children: [
                  TextSpan(text: 'Don\'t have an account? ', style: AppTextStyles.h14),
                  TextSpan(
                    text: S.current.signUp,
                    style: AppTextStyles.h14.copyWith(color: Colors.blue),
                    recognizer: TapGestureRecognizer()..onTap = () => getIt.get<AppNavigator>().push(const SignUpRoute()),
                  ),
                ],
              ),
            ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   children: [
            //     const AppText('Don\'t have an account?'),
            //     SizedBox(width: Dimens.d5.responsive()),
            //     AppButton(S.current.signUp, type: ButtonType.link, isBold: false, onPressed: () => getIt.get<AppNavigator>().push(const SignUpRoute())),
            //   ],
            // ),
          ),
        ],
      ),
    );
  }
}
