import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
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
    final box = Hive.box('authBox');
    box.put('storedEmail', '');
    box.put('storedPassword', '');
    box.put('isAuthenticated', false);
    context.router.removeUntil((route) => false);
    context.router.push(const AuthRoute());
  }
}
