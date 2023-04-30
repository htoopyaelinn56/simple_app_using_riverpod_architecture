import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_app_architecture/src/feature/auth/data/abstract_auth_repository.dart';
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
          child: Consumer(builder: (context, ref, _) {
            return ref.watch(getProfileProvider).when(
                  data: (data) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.person,
                          size: 300,
                        ),
                        Text(data),
                        TextButton(
                          onPressed: () async {
                            await ref.read(authServiceProvider).logout();
                          },
                          child: const Text('Logout'),
                        ),
                      ],
                    );
                  },
                  error: (e, st) => Center(child: Text('$e')),
                  loading: () => const CircularProgressIndicator(),
                );
          }),
        ),
      ),
    );
  }
}
