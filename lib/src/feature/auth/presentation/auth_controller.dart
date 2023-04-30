import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_app_architecture/main.dart';
import 'package:flutter_app_architecture/src/feature/auth/service/auth_service.dart';
import 'package:flutter_app_architecture/src/feature/posts/presentation/post_list_page.dart';
import 'package:flutter_app_architecture/src/util/page_pusher.dart';
import 'package:flutter_app_architecture/src/util/show_common_snackbar.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AuthController extends AutoDisposeAsyncNotifier<void> {
  @override
  FutureOr<void> build() {
    //no need
  }

  Future<void> login({
    required String phone,
    required String password,
  }) async {
    state = const AsyncLoading();
    try {
      final response = await ref.read(authServiceProvider).login(phone: phone, password: password);
      //save token, username to shareprefs
      state = const AsyncData(null);
      pagePush(
        context: navigatorKey.currentContext!,
        page: const PostListPage(),
        removeBackStack: true,
      );
    } catch (e, st) {
      state = AsyncError(e, st);
      showCommonSnackBar(context: navigatorKey.currentContext!, message: e.toString(), color: Colors.red);
    }
  }

  Future<void> register({
    required String name,
    required String phone,
    required String password,
    required String confirmPassword,
  }) async {
    state = const AsyncLoading();
    try {
      final response = await ref.read(authServiceProvider).register(name: name, phone: phone, password: password, confirmPassword: confirmPassword);
      //save token, username to shareprefs
      state = const AsyncData(null);
      pagePush(
        context: navigatorKey.currentContext!,
        page: const PostListPage(),
        removeBackStack: true,
      );
    } catch (e, st) {
      state = AsyncError(e, st);
      showCommonSnackBar(context: navigatorKey.currentContext!, message: e.toString(), color: Colors.red);
    }
  }

  Future<void> logout() async {
    await ref.read(authServiceProvider).logout();
  }
}

final authControllerProvider = AsyncNotifierProvider.autoDispose<AuthController, void>(() {
  return AuthController();
});
