import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

// this page is a scaffold for auth screens
@RoutePage()
class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) => const Scaffold(body: AutoRouter());
}
