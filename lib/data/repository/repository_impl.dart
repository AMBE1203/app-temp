import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartx/dartx.dart';
import 'package:injectable/injectable.dart';

import '../../domain/domain.dart';
import '../../shared/shared.dart';
import '../data.dart';

@LazySingleton(as: Repository)
class RepositoryImpl implements Repository {
  RepositoryImpl(
    this._appApiService,
    this._appPreferences,
    this._appDatabase,
    // this._preferenceUserDataMapper,
    this._userDataMapper,
    this._genderDataMapper,
    this._localUserDataMapper,
    this._appFirebase,
  );

  final AppApiService _appApiService;
  final AppPreferences _appPreferences;
  final AppDatabase _appDatabase;
  // final PreferenceUserDataMapper _preferenceUserDataMapper;
  final UserDataMapper _userDataMapper;
  final GenderDataMapper _genderDataMapper;
  final LocalUserDataMapper _localUserDataMapper;
  final AppFirebase _appFirebase;

  @override
  bool get isLoggedIn => _appPreferences.isLoggedIn;

  @override
  bool get isFirstLogin => _appPreferences.isFirstLogin;

  @override
  bool get isFirstLaunchApp => _appPreferences.isFirstLaunchApp;

  @override
  Stream<bool> get onConnectivityChanged => Connectivity().onConnectivityChanged.map((event) => event != ConnectivityResult.none);

  @override
  bool get isDarkMode => _appPreferences.isDarkMode;

  @override
  String get languageCode => _appPreferences.languageCode;

  @override
  Future<bool> saveIsFirstLogin(bool isFirstLogin) {
    return _appPreferences.saveIsFirstLogin(isFirstLogin);
  }

  @override
  Future<bool> saveIsFirstLaunchApp(bool isFirstLaunchApp) {
    return _appPreferences.saveIsFirsLaunchApp(isFirstLaunchApp);
  }

  @override
  Future<void> login(String email, String password) async {
    var response;
    if (ServerConstants.usingAPI) {
      response = await _appApiService.login(email, password);
    } else {
      response = await _appFirebase.loginWithEmail(email: email, password: password);
    }
    await _saveTokenAndUser(response.data);
  }

  @override
  Future<void> logout() async {
    await _appApiService.logout();
    await _appPreferences.clearCurrentUserData();
  }

  @override
  Future<void> resetPassword({required String token, required String email, required String password, required String confirmPassword}) async {
    await _appApiService.resetPassword(token: token, email: email, password: password);
  }

  @override
  Future<void> forgotPassword(String email) => _appApiService.forgotPassword(email);

  @override
  Future<void> register(String email, String password) async {
    final response = await _appApiService.register(
      // username: username,
      email: email,
      password: password,
      // gender: _genderDataMapper.mapToData(gender),
    );
    await _saveTokenAndUser(response.data);
  }

  @override
  Future<bool> checkEmail(String email) async {
    final response = await _appApiService.checkEmail(email: email);
    return response.registered ?? false;
  }

  @override
  User getUserPreference() => const User(); // _preferenceUserDataMapper.mapToEntity(_appPreferences.currentUser);

  @override
  Future<void> clearCurrentUserData() => _appPreferences.clearCurrentUserData();

  @override
  Future<bool> saveDeviceToken(String deviceToken) => _appPreferences.saveDeviceToken(deviceToken);

  @override
  Future<PagedList<User>> getUsers({required int page, required int? limit}) async {
    final response = await _appApiService.getUsers(page: page, limit: limit);
    return PagedList(data: _userDataMapper.mapToListEntity(response.results));
  }

  @override
  Future<bool> saveLanguageCode(String languageCode) {
    return _appPreferences.saveLanguageCode(languageCode);
  }

  @override
  Future<bool> saveIsDarkMode(bool isDarkMode) => _appPreferences.saveIsDarkMode(isDarkMode);

  @override
  Future<User> getMe() async {
    final response = await _appApiService.getMe();
    return _userDataMapper.mapToEntity(response.data);
  }

  @override
  int deleteAllUsersAndImageUrls() {
    return _appDatabase.deleteAllUsersAndImageUrls();
  }

  @override
  bool deleteImageUrl(int id) {
    return _appDatabase.deleteImageUrl(id);
  }

  @override
  User? getLocalUser(int id) {
    return _localUserDataMapper.mapToEntity(_appDatabase.getUser(id));
  }

  @override
  List<User> getLocalUsers() {
    return _localUserDataMapper.mapToListEntity(_appDatabase.getUsers());
  }

  @override
  Stream<List<User>> getLocalUsersStream() {
    return _appDatabase.getUsersStream().map((event) => _localUserDataMapper.mapToListEntity(event));
  }

  @override
  int putLocalUser(User user) {
    final userData = _localUserDataMapper.mapToData(user);

    return _appDatabase.putUser(userData);
  }

  Future<List<Object>> _saveTokenAndUser(AuthResponseData? authData) async {
    return Future.wait([
      _appPreferences.saveCurrentUser(PreferenceUserData(
        id: authData?.uid ?? '',
        email: authData?.email ?? '',
      )),
      if (authData != null && !authData.accessToken.isNullOrEmpty) _appPreferences.saveAccessToken(authData.accessToken!),
      if (authData != null && !authData.refreshToken.isNullOrEmpty) _appPreferences.saveRefreshToken(authData.refreshToken!),
    ]);
  }
}
