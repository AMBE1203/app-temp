import 'dart:async';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../shared/shared.dart';
import '../../../app.dart';

part 'provider.g.dart';

@Riverpod()
class Auth extends _$Auth with Base {
  @override
  Future<void> build() async {
    Log.d('LoginProvider > build');
  }

  Future<dynamic> login(String email, String password) async {
    return await runSafe(action: () async {
      if (!ValidationUtils.isValidEmail(email)) {
        throw const ValidationException(ValidationExceptionKind.invalidEmail);
      }
      if (!ValidationUtils.isValidPassword(password)) {
        throw const ValidationException(ValidationExceptionKind.invalidPassword);
      }
      await repository.login(email, password);
    });
  }

  Future<dynamic> register(String email, String password) async {
    return await runSafe(action: () async {
      await repository.register(email, password);
    });
  }

  Future<bool?> checkEmail(String email) async {
    return await runSafe<bool?>(
      action: () async {
        return await repository.checkEmail(email);
      },
      handleLoading: false,
    );
  }
}
