import 'package:injectable/injectable.dart';

import '../../../../shared/shared.dart';
import '../../../data.dart';

@LazySingleton()
class AppApiService {
  AppApiService(this._noneAuthAppServerApiClient, this._authAppServerApiClient, this._randomUserApiClient);

  final NoneAuthAppServerApiClient _noneAuthAppServerApiClient;
  final AuthAppServerApiClient _authAppServerApiClient;
  final RandomUserApiClient _randomUserApiClient;

  Future<DataResponse<AuthResponseData>> login(String email, String password) async {
    return _noneAuthAppServerApiClient.request(
      method: RestMethod.post,
      path: 'accounts:signInWithPassword?key=${FirebaseConstants.apiKey}',
      body: {'email': email, 'password': password, 'returnSecureToken': true},
      decoder: AuthResponseData.fromJson,
    );
  }

  Future<void> logout() async {
    await _authAppServerApiClient.request(
      method: RestMethod.post,
      path: '/v1/auth/logout',
    );
  }

  Future<DataResponse<AuthResponseData>> register({required String email, required String password}) async {
    return _noneAuthAppServerApiClient.request(
      method: RestMethod.post,
      // path: '/v1/auth/register',
      path: 'accounts:signUp?key=${FirebaseConstants.apiKey}',
      body: {
        // 'username': username,
        // 'gender': gender,
        'email': email,
        'password': password,
        // 'password_confirmation': password,
        'returnSecureToken': true,
      },
      decoder: AuthResponseData.fromJson,
    );
  }

  Future<AuthResponseData> checkEmail({required String email}) async {
    return _noneAuthAppServerApiClient.request(
      method: RestMethod.post,
      path: 'accounts:createAuthUri?key=${FirebaseConstants.apiKey}',
      body: {'identifier': email, 'continueUri': 'http://localhost'},
      decoder: AuthResponseData.fromJson,
      successResponseMapperType: SuccessResponseMapperType.jsonObject,
    );
  }

  Future<void> forgotPassword(String email) async {
    await _noneAuthAppServerApiClient.request(
      method: RestMethod.post,
      path: '/v1/auth/forgot-password',
      body: {'email': email},
    );
  }

  Future<void> resetPassword({required String token, required String email, required String password}) async {
    await _noneAuthAppServerApiClient.request(
      method: RestMethod.post,
      path: '/v1/auth/reset-password',
      body: {
        'token': token,
        'email': email,
        'password': password,
        'password_confirmation': password,
      },
    );
  }

  Future<DataResponse<UserData>> getMe() async {
    return _noneAuthAppServerApiClient.request(
      method: RestMethod.get,
      path: '/v1/me',
      decoder: AuthResponseData.fromJson,
    );
  }

  Future<ResultsListResponse<UserData>> getUsers({required int page, required int? limit}) {
    return _randomUserApiClient.request(
      method: RestMethod.get,
      path: '',
      queryParameters: {'page': page, 'results': limit},
      successResponseMapperType: SuccessResponseMapperType.resultsJsonArray,
      decoder: UserData.fromJson,
    );
  }
}
