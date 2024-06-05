import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:template/app/constants/string_constants.dart';
import 'package:template/app/router/app_router.dart';

@RoutePage()
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.all(16),
        child: Center(
          child: ElevatedButton(
            onPressed: () => performLogout(context),
            child: const Text('Logout'),
          ),
        ),
      );

  performLogout(BuildContext context) {
    final box = Hive.box(authConfig);
    box.put(keyEmail, '');
    box.put(keyPassword, '');
    box.put(keyIsAuthenticated, false);
    context.router.removeUntil((route) => false);
    context.router.push(const AuthRoute());
  }
}
