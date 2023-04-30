import 'dart:convert';

import 'package:flutter_app_architecture/main.dart';
import 'package:flutter_app_architecture/src/constants/api_constants.dart';
import 'package:flutter_app_architecture/src/feature/auth/data/abstract_auth_repository.dart';
import 'package:flutter_app_architecture/src/feature/auth/presentation/login_page.dart';
import 'package:flutter_app_architecture/src/util/page_pusher.dart';
import 'package:http/http.dart' as http;

import '../domain/login_response.dart';

class AuthRepositoryHttpImpl extends AuthRepository {
  @override
  Future<LoginResponse> login({required String phone, required String password}) async {
    final response = await http.get(Uri.parse(kBaseUrl));

    if (response.statusCode == 200) {
      return LoginResponse(name: 'name', phone: phone, token: '123');
    }
    throw 'Invalid cridentials';
  }

  @override
  Future<LoginResponse> register({required String name, required String phone, required String password, required String confirmPassword}) async {
    final response = await http.get(Uri.parse(kBaseUrl));
    if (response.statusCode == 200) {
      return LoginResponse(name: name, phone: phone, token: '123');
    } else if (response.statusCode == 500) {
      throw 'Internal Server Error';
    } else {
      throw 'Something went wrong'; //message from server response
    }
  }

  @override
  Future<void> logout() async {
    //remove shareprefs
    //call logout api
    pagePush(
      context: navigatorKey.currentContext!,
      page: const LoginPage(),
      removeBackStack: true,
    );
  }
}
