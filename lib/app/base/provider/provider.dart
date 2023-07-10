// import 'dart:async';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../shared/shared.dart';
import '../../../data/data.dart';
import '../../app.dart';

part 'provider.g.dart';

@Riverpod(keepAlive: true)
class App extends _$App with Base {
  @override
  Future<AppData> build() async {
    final model = AppData(isDarkMode: repository.isDarkMode, languageCode: repository.languageCode);
    Log.d('AppProvider > build: ${model}');
    return Future.value(model);
  }

  Future<dynamic> addOrUpdate(AppData data) async {
    await update((previous) async {
      if (previous.languageCode != data.languageCode) {
        await repository.saveLanguageCode(data.languageCode ?? LocaleConstants.defaultLocale);
      }
      if (previous.isDarkMode != data.isDarkMode) {
        await repository.saveIsDarkMode(data.isDarkMode ?? UiConstants.defaultDarkMode);
      }
      return data;
    });
  }

  Future<dynamic> setDarkMode(bool val) async {
    if (!state.hasValue) return;
    await addOrUpdate(state.value!.copyWith(isDarkMode: val));
  }

  Future<dynamic> setLanguage(String val) async {
    if (!state.hasValue) return;
    // await S.load(Locale(val));
    await addOrUpdate(state.value!.copyWith(languageCode: val));
  }
}
