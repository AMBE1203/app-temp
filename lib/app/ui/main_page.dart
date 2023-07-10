import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/domain.dart';
import '../../shared/shared.dart';
import '../app.dart';

@RoutePage()
class MainPage extends ConsumerWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Log.d('MainPage > build');
    final _navigator = getIt.get<AppNavigator>();
    final _bottomBarKey = GlobalKey();
    ref.watch(appProvider.select((value) => value.value?.languageCode)); // for change language of bottom tab

    return AutoTabsScaffold(
      routes: _navigator.tabRoutes,
      bottomNavigationBuilder: (_, tabsRouter) {
        _navigator.tabsRouter = tabsRouter;
        return BottomNavigationBar(
          key: _bottomBarKey,
          currentIndex: tabsRouter.activeIndex,
          onTap: (index) {
            if (index == tabsRouter.activeIndex) {
              _navigator.popUntilRootOfCurrentBottomTab();
            }
            tabsRouter.setActiveIndex(index);
          },
          showSelectedLabels: true,
          showUnselectedLabels: true,
          // unselectedItemColor: AppColors.current.primaryColor,
          // selectedItemColor: AppColors.current.primaryColor,
          type: BottomNavigationBarType.fixed,
          // backgroundColor: AppColors.current.primaryColor,
          items: BottomTab.values.map((tab) => BottomNavigationBarItem(label: tab.title, icon: tab.icon, activeIcon: tab.activeIcon)).toList(),
        );
      },
    );
  }
}
