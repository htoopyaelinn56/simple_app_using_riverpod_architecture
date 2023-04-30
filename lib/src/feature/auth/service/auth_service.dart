import 'package:flutter_app_architecture/src/feature/auth/domain/login_response.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;

import '../data/abstract_auth_repository.dart';

class AuthService {
  final Ref ref;
  AuthService(this.ref);

  Future<LoginResponse> login({
    required String phone,
    required String password,
  }) async {
    return await ref.read(authRepositoryProvider).login(phone: phone, password: password);
  }

  Future<LoginResponse> register({
    required String name,
    required String phone,
    required String password,
    required String confirmPassword,
  }) async {
    return await ref.read(authRepositoryProvider).register(name: name, phone: phone, password: password, confirmPassword: confirmPassword);
  }

  Future<void> logout() async {
    return await ref.read(authRepositoryProvider).logout();
  }
}

final authServiceProvider = Provider<AuthService>((ref) {
  return AuthService(ref);
});
