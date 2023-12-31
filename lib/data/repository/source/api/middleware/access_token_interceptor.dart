import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../../../../../shared/shared.dart';
import '../../preference/app_preferences.dart';
import 'base_interceptor.dart';

@Injectable()
class AccessTokenInterceptor extends BaseInterceptor {
  AccessTokenInterceptor(this._appPreferences);

  final AppPreferences _appPreferences;

  @override
  int get priority => BaseInterceptor.accessTokenPriority;

  @override
  Future<void> onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    final token = await _appPreferences.accessToken;
    if (token.isNotEmpty) {
      options.headers[ServerConstants.basicAuthorization] = '${ServerConstants.bearer} $token';
    }

    handler.next(options);
  }
}
