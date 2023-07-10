import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';

import '../../../resources/resources.dart';
import '../../../shared/shared.dart';
import '../../app.dart';

@LazySingleton(as: BasePopupInfoMapper)
class AppPopupInfoMapper extends BasePopupInfoMapper {
  @override
  Widget map(AppPopupInfo appPopupInfo, AppNavigator navigator) {
    return appPopupInfo.when(
      confirmDialog: (message, onPressed) {
        return CommonDialog(
          actions: [
            PopupButton(
              text: S.current.ok,
              onPressed: onPressed ?? Func0(() => navigator.pop()),
            ),
          ],
          message: message,
        );
      },
      errorWithRetryDialog: (message, onRetryPressed) {
        return CommonDialog(
          actions: [
            PopupButton(
              text: S.current.cancel,
              onPressed: Func0(() => navigator.pop()),
            ),
            PopupButton(
              text: S.current.retry,
              onPressed: onRetryPressed ?? Func0(() => navigator.pop()),
              isDefault: true,
            ),
          ],
          message: message,
        );
      },
      requiredLoginDialog: () => CommonDialog.adaptive(
        title: S.current.login,
        message: S.current.login,
        actions: [
          PopupButton(
            text: S.current.cancel,
            onPressed: Func0(() => navigator.pop()),
          ),
          PopupButton(
            text: S.current.login,
            onPressed: Func0(() async {
              await navigator.pop();
              await navigator.push(const LoginRoute());
            }),
          ),
        ],
      ),
    );
  }
}
