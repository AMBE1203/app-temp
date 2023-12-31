import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart' as m;
import 'package:injectable/injectable.dart';

import '../../shared/shared.dart';
import '../app.dart';

@LazySingleton()
class AppNavigator {
  AppNavigator(this._appRouter, this._appPopupInfoMapper);

  final tabRoutes = const [HomeTab(), SearchTab(), SettingTab()];

  TabsRouter? tabsRouter;

  final AppRouter _appRouter;
  final BasePopupInfoMapper _appPopupInfoMapper;
  final _popups = <AppPopupInfo>{};

  StackRouter? get _currentTabRouter => tabsRouter?.stackRouterOfIndex(currentBottomTab);

  StackRouter get _currentTabRouterOrRootRouter => _currentTabRouter ?? _appRouter;

  m.BuildContext get _rootRouterContext => _appRouter.navigatorKey.currentContext!;

  m.BuildContext? get _currentTabRouterContext => _currentTabRouter?.navigatorKey.currentContext;

  m.BuildContext get _currentTabContextOrRootContext => _currentTabRouterContext ?? _rootRouterContext;

  int get currentBottomTab {
    if (tabsRouter == null) {
      throw 'Not found any TabRouter';
    }

    return tabsRouter?.activeIndex ?? 0;
  }

  bool get canPopSelfOrChildren => _appRouter.canPop();

  void popUntilRootOfCurrentBottomTab() {
    if (tabsRouter == null) {
      throw 'Not found any TabRouter';
    }

    if (_currentTabRouter?.canPop() == true) {
      _currentTabRouter?.popUntilRoot();
    }
  }

  void navigateToBottomTab(int index, {bool notify = true}) {
    if (tabsRouter == null) {
      throw 'Not found any TabRouter';
    }

    tabsRouter?.setActiveIndex(index, notify: notify);
  }

  Future<T?> push<T extends Object?>(PageRouteInfo routeInfo) {
    return _appRouter.push<T>(routeInfo);
  }

  Future<void> pushAll(List<PageRouteInfo> listRouteInfo) {
    return _appRouter.pushAll(listRouteInfo);
  }

  Future<T?> replace<T extends Object?>(PageRouteInfo routeInfo) {
    return _appRouter.replace<T>(routeInfo);
  }

  Future<void> replaceAll(List<PageRouteInfo> listRouteInfo) {
    return _appRouter.replaceAll(listRouteInfo);
  }

  Future<bool> pop<T extends Object?>({T? result, bool useRootNavigator = false}) {
    if (LogConfig.enableNavigatorObserverLog) {
      Log.d('pop with result = $result, useRootNav = $useRootNavigator');
    }
    return useRootNavigator ? _appRouter.pop<T>(result) : _currentTabRouterOrRootRouter.pop<T>(result);
  }

  Future<T?> popAndPush<T extends Object?, R extends Object?>(PageRouteInfo routeInfo, {R? result, bool useRootNavigator = false}) {
    return useRootNavigator ? _appRouter.popAndPush<T, R>(routeInfo, result: result) : _currentTabRouterOrRootRouter.popAndPush<T, R>(routeInfo, result: result);
  }

  void popUntilRoot({bool useRootNavigator = false}) {
    useRootNavigator ? _appRouter.popUntilRoot() : _currentTabRouterOrRootRouter.popUntilRoot();
  }

  void popUntilRouteName(String routeName) {
    _appRouter.popUntilRouteWithName(routeName);
  }

  bool removeUntilRouteName(String routeName) {
    return _appRouter.removeUntil((route) => route.name == routeName);
  }

  bool removeAllRoutesWithName(String routeName) {
    return _appRouter.removeWhere((route) => route.name == routeName);
  }

  Future<void> popAndPushAll(List<PageRouteInfo> listRouteInfo) {
    return _appRouter.popAndPushAll(listRouteInfo);
  }

  bool removeLast() {
    return _appRouter.removeLast();
  }

  Future<T?> showDialog<T extends Object?>(
    AppPopupInfo appPopupInfo, {
    bool barrierDismissible = true,
    bool useSafeArea = false,
    bool useRootNavigator = true,
  }) {
    if (_popups.contains(appPopupInfo)) {
      Log.d('Dialog $appPopupInfo already shown');
      return Future.value(null);
    }
    _popups.add(appPopupInfo);

    return m.showDialog<T>(
      context: useRootNavigator ? _rootRouterContext : _currentTabContextOrRootContext,
      builder: (_) => m.WillPopScope(
        onWillPop: () async {
          Log.d('Dialog $appPopupInfo dismissed');
          _popups.remove(appPopupInfo);
          return Future.value(true);
        },
        child: _appPopupInfoMapper.map(appPopupInfo, this),
      ),
      useRootNavigator: useRootNavigator,
      barrierDismissible: barrierDismissible,
      useSafeArea: useSafeArea,
    );
  }

  Future<T?> showGeneralDialog<T extends Object?>(
    AppPopupInfo appPopupInfo, {
    Duration transitionDuration = DurationConstants.defaultGeneralDialogTransitionDuration,
    m.Widget Function(m.BuildContext, m.Animation<double>, m.Animation<double>, m.Widget)? transitionBuilder,
    m.Color barrierColor = const m.Color(0x80000000),
    bool barrierDismissible = true,
    bool useRootNavigator = true,
  }) {
    if (_popups.contains(appPopupInfo)) {
      Log.d('Dialog $appPopupInfo already shown');

      return Future.value(null);
    }
    _popups.add(appPopupInfo);

    return m.showGeneralDialog<T>(
      context: useRootNavigator ? _rootRouterContext : _currentTabContextOrRootContext,
      barrierColor: barrierColor,
      useRootNavigator: useRootNavigator,
      barrierDismissible: barrierDismissible,
      pageBuilder: (
        m.BuildContext context,
        m.Animation<double> animation1,
        m.Animation<double> animation2,
      ) =>
          m.WillPopScope(
        onWillPop: () async {
          Log.d('Dialog $appPopupInfo dismissed');
          _popups.remove(appPopupInfo);

          return Future.value(true);
        },
        child: _appPopupInfoMapper.map(appPopupInfo, this),
      ),
      transitionBuilder: transitionBuilder,
      transitionDuration: transitionDuration,
    );
  }

  Future<T?> showModalBottomSheet<T extends Object?>(
    AppPopupInfo appPopupInfo, {
    bool isScrollControlled = false,
    bool useRootNavigator = false,
    bool isDismissible = true,
    bool enableDrag = true,
    m.Color barrierColor = m.Colors.black54,
    m.Color? backgroundColor,
  }) {
    return m.showModalBottomSheet<T>(
      context: useRootNavigator ? _rootRouterContext : _currentTabContextOrRootContext,
      builder: (_) => _appPopupInfoMapper.map(appPopupInfo, this),
      isDismissible: isDismissible,
      enableDrag: enableDrag,
      useRootNavigator: useRootNavigator,
      isScrollControlled: isScrollControlled,
      backgroundColor: backgroundColor,
      barrierColor: barrierColor,
    );
  }

  void showErrorSnackBar(String message, {Duration? duration}) {
    ViewUtils.showAppSnackBar(
      _rootRouterContext,
      message,
      duration: duration,
      // backgroundColor: AppColors.current.primaryColor,
    );
  }

  void showSuccessSnackBar(String message, {Duration? duration}) {
    ViewUtils.showAppSnackBar(
      _rootRouterContext,
      message,
      duration: duration,
      // backgroundColor: AppColors.current.primaryColor,
    );
  }
}
