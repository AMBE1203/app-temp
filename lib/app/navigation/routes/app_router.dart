import 'package:auto_route/auto_route.dart';

import '../../app.dart';

part 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Page,Route')
class AppRouter extends _$AppRouter {
  @override
  RouteType get defaultRouteType => RouteType.custom(
        reverseDurationInMilliseconds: 300,
        transitionsBuilder: (ctx, animation1, animation2, child) {
          return child;
        },
      );

  @override
  final List<AutoRoute> routes = [
    AutoRoute(
      page: MainRoute.page,
      path: '/',
      guards: [RouteGuard()],
      children: [
        RedirectRoute(path: '', redirectTo: 'home'),
        homeTab,
        searchTab,
        settingTab,
      ],
    ),
    AutoRoute(page: LoginRoute.page, path: '/login'),
    AutoRoute(page: SignUpRoute.page, path: '/signUp'),
    RedirectRoute(path: '*', redirectTo: '/'),
  ];
}

@RoutePage(name: 'HomeTab')
class BottomTabHomePage extends AutoRouter {
  const BottomTabHomePage({super.key});
}

final homeTab = AutoRoute(
  path: 'home',
  page: HomeTab.page,
  maintainState: true,
  children: [
    AutoRoute(path: '', page: HomeRoute.page, title: (ctx, _) => 'Home'),
    // AutoRoute(
    //   path: ':id',
    //   page: ItemDetailRoute.page,
    //   title: (ctx, data) {
    //     return 'Item Details ${data.pathParams.get('id')}';
    //   },
    // ),
  ],
);

@RoutePage(name: 'SearchTab')
class BottomTabSearchPage extends AutoRouter {
  const BottomTabSearchPage({super.key});
}

final searchTab = AutoRoute(
  path: 'search',
  page: SearchTab.page,
  children: [
    AutoRoute(path: '', page: SearchRoute.page, title: (ctx, _) => 'Search'),
  ],
);

@RoutePage(name: 'SettingTab')
class BottomTabSettingPage extends AutoRouter {
  const BottomTabSettingPage({super.key});
}

final settingTab = AutoRoute(
  path: 'setting',
  page: SettingTab.page,
  children: [
    AutoRoute(path: '', page: SettingRoute.page, title: (ctx, _) => 'Setting'),
  ],
);

// // ignore_for_file:avoid-dynamic
// @MaterialAutoRouter(
//   replaceInRouteName: 'Page,Route',
//   routes: <AutoRoute>[
//     AutoRoute<dynamic>(page: LoginPage),
//     mainScreenRouter,
//   ],
// )
// class $AppRouter {}

// const mainScreenRouter = CustomRoute<dynamic>(
//   transitionsBuilder: TransitionsBuilders.fadeIn,
//   durationInMilliseconds: 200,
//   page: MainPage,
//   guards: [RouteGuard],
//   children: [
//     AutoRoute<dynamic>(
//       name: 'BottomTabHomeRouter',
//       page: EmptyRouterPage,
//       children: [
//         AutoRoute<dynamic>(page: HomePage, initial: true),
//         AutoRoute<dynamic>(page: ItemDetailPage),
//       ],
//     ),
//     AutoRoute<dynamic>(
//       name: 'BottomTabSearchRouter',
//       page: EmptyRouterPage,
//       children: [
//         AutoRoute<dynamic>(page: SearchPage, initial: true),
//       ],
//     ),
//     AutoRoute<dynamic>(
//       name: 'BottomTabMyPageRouter',
//       page: EmptyRouterPage,
//       children: [
//         AutoRoute<dynamic>(page: MyPagePage, name: 'MyPageRoute', initial: true),
//       ],
//     ),
//   ],
// );
