import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:template/app/router/app_router.dart';

@RoutePage()
class LoginPage extends StatefulWidget {
  final Function(bool)? onResult;

  const LoginPage({super.key, this.onResult});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  Function(bool)? onResult;
  final _formKey = GlobalKey<FormState>();
  String _email = '';
  String _password = '';
  bool _showErrorMessage = false;

  @override
  void initState() {
    super.initState();
    onResult = widget.onResult;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            const SizedBox(height: 56),
            const Text(
              'Login',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.w900),
            ),
            TextFormField(
              controller: TextEditingController(text: 'ogolah.edward@gmail.co'),
              decoration: const InputDecoration(
                labelText: 'Email',
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter your email';
                }
                return null;
              },
              onChanged: (value) {
                _email = value;
              },
            ),
            const SizedBox(height: 16.0),
            TextFormField(
              controller: TextEditingController(text: 'Passwor'),
              obscureText: true,
              decoration: const InputDecoration(
                labelText: 'Password',
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter your password';
                }
                return null;
              },
              onChanged: (value) {
                _password = value;
              },
            ),
            const SizedBox(height: 24.0),
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  bool authenticated = performLogin(_email, _password);
                  if (!authenticated) {
                    setState(() {
                      _showErrorMessage = true;
                    });
                    return;
                  }
                  if (onResult != null) {
                    onResult!(authenticated);
                  } else {
                    context.router.navigate(const MainRoute());
                  }
                }
              },
              child: const Text('Login'),
            ),
            Column(
              children: [
                if (_showErrorMessage)
                  const Padding(
                    padding: EdgeInsets.only(top: 16.0),
                    child: Text(
                      'Login failed! Please try again or register if you don\'t have an account yet',
                      style: TextStyle(color: Colors.red),
                    ),
                  ),
                const SizedBox(height: 18),
                TextButton(
                  onPressed: () => context.router.navigate(const RegisterRoute()),
                  child: const Text('Register'),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  bool performLogin(String email, String password) {
    // Implement your login logic here using Hive
    // For example, you can store user credentials in Hive and check if the provided email and password match
    final box = Hive.box('authBox');
    final String storedEmail = box.get('email', defaultValue: '');
    final String storedPassword = box.get('password', defaultValue: '');

    if (email == storedEmail && password == storedPassword) {
      box.put('isAuthenticated', true);
      return true; // Authenticated
    } else {
      box.put('isAuthenticated', false);
      return false; // Authentication failed
    }
  }
}
