import 'package:auto_route/auto_route.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:template/app/router/app_router.dart';

class AuthGuard extends AutoRouteGuard {
  final bool isAuthScreen;

  AuthGuard({this.isAuthScreen = false});

  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) {
    final box = Hive.box('authBox');
    final isAuthenticated = box.get('isAuthenticated', defaultValue: false);

    router.removeUntil((route) => false);

    if (isAuthenticated) {
      // if user is authenticated we continue
      if (isAuthScreen) {
        resolver.redirect(const MainRoute());
      } else {
        resolver.next(true);
      }
    } else {
      if (isAuthScreen) {
        resolver.next(true);
      } else {
        resolver.redirect(LoginRoute(onResult: (success) {
          // if success == true the navigation will be resumed
          // else it will be aborted
          resolver.next(success);
        }));
      }
    }
  }
}
