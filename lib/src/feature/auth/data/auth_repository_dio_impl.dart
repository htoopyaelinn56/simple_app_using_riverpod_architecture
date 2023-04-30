import 'package:dio/dio.dart';

import '../../../../main.dart';
import '../../../constants/api_constants.dart';
import '../../../util/page_pusher.dart';
import '../domain/login_response.dart';
import '../presentation/login_page.dart';
import 'abstract_auth_repository.dart';

class AuthRepositoryDioImpl implements AuthRepository {
  final _dio = Dio();
  @override
  Future<LoginResponse> login({required String phone, required String password}) async {
    const statusCode = 200; //api call here
    await Future.delayed(const Duration(seconds: 2));
    if (statusCode == 200) {
      return LoginResponse(name: 'name', phone: phone, token: '123');
    }
    throw 'Invalid cridentials';
  }

  @override
  Future<LoginResponse> register({required String name, required String phone, required String password, required String confirmPassword}) async {
    const statusCode = 200; //api call here
    await Future.delayed(const Duration(seconds: 2));
    if (statusCode == 200) {
      return LoginResponse(name: name, phone: phone, token: '123');
    } else if (statusCode == 500) {
      throw 'Internal Server Error';
    } else {
      throw 'Something went wrong'; //message from server response
    }
  }

  @override
  Future<void> logout() async {
    //remove shareprefs
    //call logout api
    pagePush(context: navigatorKey.currentContext!, page: const LoginPage());
  }

  @override
  Future<String> getProfile() async {
    await Future.delayed(const Duration(seconds: 2));
    return 'Mgmg';
  }
}
