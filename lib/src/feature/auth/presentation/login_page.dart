import 'package:flutter/material.dart';
import 'package:flutter_app_architecture/src/feature/auth/presentation/auth_controller.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({super.key});

  @override
  ConsumerState<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> {
  bool isLogin = true;
  @override
  Widget build(BuildContext context) {
    final state = ref.watch(authControllerProvider);
    return Scaffold(
      body: Column(
        children: [
          Row(
            children: [
              Switch(
                value: isLogin,
                onChanged: (_) {
                  isLogin = !isLogin;
                  setState(() {});
                },
              ),
              Text(isLogin ? 'Login' : 'Register'),
            ],
          ),
          Center(
            child: SizedBox(
              width: 300,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const TextField(
                    decoration: InputDecoration(labelText: 'Phone'),
                  ),
                  if (!isLogin)
                    const TextField(
                      decoration: InputDecoration(labelText: 'Name'),
                    ),
                  const TextField(
                    decoration: InputDecoration(labelText: 'Password'),
                  ),
                  if (!isLogin)
                    const TextField(
                      decoration: InputDecoration(labelText: 'Confirm password'),
                    ),
                  const SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () async {
                      if (isLogin) {
                        await ref.read(authControllerProvider.notifier).login(
                              phone: 'phone',
                              password: 'password',
                            );
                      } else {
                        await ref.read(authControllerProvider.notifier).register(
                              name: 'name',
                              phone: 'phone',
                              password: 'password',
                              confirmPassword: 'confirmPassword',
                            );
                      }
                    },
                    child: state.isLoading ? const CircularProgressIndicator() : const Text('Login'),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
