import 'package:dartx/dartx.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../resources/resources.dart';
import '../shared/shared.dart';
import 'app.dart';

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _appRouter = getIt.get<AppRouter>();
    final _isDarkMode = ref.watch(appProvider.select((value) => value.value?.isDarkMode));
    final _languageCode = ref.watch(appProvider.select((value) => value.value?.languageCode));
    Log.d('MyApp > build: ${_isDarkMode} - ${_languageCode}');

    return ScreenUtilInit(
      designSize: const Size(UiConstants.designDeviceWidth, UiConstants.designDeviceHeight),
      builder: (context, _) => MaterialApp.router(
        routerConfig: _appRouter.config(
          navigatorObservers: () => [AppNavigatorObserver()],
        ),
        debugShowCheckedModeBanner: false,
        builder: (context, child) {
          AppDimen.of(context);
          AppColors.of(context);
          final statusBarStyle = SystemUiOverlayStyle(statusBarBrightness: _isDarkMode == true ? Brightness.dark : Brightness.light, statusBarColor: AppColors.current.primaryColor);
          ViewUtils.setSystemUIOverlayStyle(statusBarStyle);
          final MediaQueryData data = MediaQuery.of(context);
          return MediaQuery(data: data.copyWith(textScaleFactor: 1.0), child: child != null ? FlutterEasyLoading(child: child) : const SizedBox.shrink());
        },
        // routerDelegate: AutoRouterDelegate(_appRouter, navigatorObservers: () => [AppNavigatorObserver()]),
        // routerDelegate: _appRouter.delegate(
        //   initialRoutes: [const MainRoute()].toList(growable: false),
        //   navigatorObservers: () => [AppNavigatorObserver()],
        // ),
        // routeInformationParser: _appRouter.defaultRouteParser(),
        title: UiConstants.materialAppTitle,
        color: UiConstants.taskMenuMaterialAppColor,
        themeMode: _isDarkMode == true ? ThemeMode.dark : ThemeMode.light,
        theme: lightTheme,
        darkTheme: darkTheme,
        localeResolutionCallback: (Locale? locale, Iterable<Locale> supportedLocales) => supportedLocales.contains(locale) ? locale : const Locale(LocaleConstants.defaultLocale),
        locale: _languageCode.isNotNullOrEmpty ? Locale(_languageCode!) : const Locale(LocaleConstants.defaultLocale),
        supportedLocales: S.delegate.supportedLocales,
        localizationsDelegates: const [
          S.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
      ),
    );
  }
}
