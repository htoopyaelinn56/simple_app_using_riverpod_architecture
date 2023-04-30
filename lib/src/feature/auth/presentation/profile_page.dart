import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_app_architecture/src/feature/auth/service/auth_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.person,
                size: 300,
              ),
              Consumer(builder: (context, ref, _) {
                return TextButton(
                  onPressed: () async {
                    await ref.read(authServiceProvider).logout();
                  },
                  child: const Text('Logout'),
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
