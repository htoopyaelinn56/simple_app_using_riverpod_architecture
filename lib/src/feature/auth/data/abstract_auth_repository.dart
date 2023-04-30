import 'package:flutter_app_architecture/src/feature/auth/domain/login_response.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'auth_repository_dio_impl.dart';
import 'auth_repository_http_impl.dart';

abstract class AuthRepository {
  Future<LoginResponse> login({
    required String phone,
    required String password,
  });

  Future<LoginResponse> register({
    required String name,
    required String phone,
    required String password,
    required String confirmPassword,
  });

  Future<void> logout();
}

final authRepositoryProvider = Provider<AuthRepository>((ref) {
  return AuthRepositoryHttpImpl();
});
