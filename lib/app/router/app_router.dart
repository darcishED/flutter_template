import 'package:auto_route/auto_route.dart';
import 'package:flutter/widgets.dart';
import 'package:template/app/constants/string_constants.dart';
import 'package:template/app/router/custom_transitions.dart';
import 'package:template/app/router/guards/auth_guard.dart';
import 'package:template/pages/_export_all_pages.dart';

part 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  AppRouter([GlobalKey<NavigatorState>? navKey]) : super(navigatorKey: navKey);

  @override
  RouteType get defaultRouteType =>
      // const RouteType.custom(transitionsBuilder: null);
      RouteType.custom(
        transitionsBuilder: (context, animation, secondaryAnimation, child) =>
            CustomTransitions.scale(animation, secondaryAnimation, child),
        durationInMilliseconds: 500,
        reverseDurationInMilliseconds: 500,
        opaque: true,
      );

  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          path: routeMain,
          initial: true,
          page: MainRoute.page,
          guards: [AuthGuard()],
          children: [
            AutoRoute(
              path: routeHome,
              initial: true,
              page: HomeRoute.page,
            ),
            AutoRoute(
              path: routeSearch,
              page: SearchRoute.page,
            ),
            AutoRoute(
              path: routeLibrary,
              page: LibraryRoute.page,
              children: [
                AutoRoute(
                  path: routeShelves,
                  page: ShelvesRoute.page,
                ),
                AutoRoute(
                  initial: true,
                  path: routeInventory,
                  page: InventoryRoute.page,
                ),
                AutoRoute(
                  path: routeFavorites,
                  page: FavoritesRoute.page,
                ),
              ],
            ),
          ],
        ),
        AutoRoute(
          path: routeAuth,
          page: AuthRoute.page,
          guards: [AuthGuard(isAuthScreen: true)],
          children: [
            AutoRoute(
              initial: true,
              path: routeLogin,
              page: LoginRoute.page,
            ),
            AutoRoute(
              path: routeRegister,
              page: RegisterRoute.page,
            ),
            AutoRoute(
              path: routeOtp,
              page: OtpRoute.page,
            ),
            AutoRoute(
              path: routeResetPassword,
              page: ResetPasswordRoute.page,
            ),
          ],
        ),
      ];
}
