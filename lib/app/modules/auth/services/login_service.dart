/* 
 * Author: Affine Sol (PVT LTD) - https://affinesol.com/ 
 * Last Modified: 27/11/2024 at 14:23:54
 */

import 'dart:convert';
import 'package:artools/artools.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:getx_clean_architecture/app/providers/dio_client.dart';

import '../../../models/user_model.dart';
import '../../../services/background/user_service.dart';
import 'auth_service.dart';

class LoginService implements AuthService {
  final Rx<User> currentUser = Get.find<UserService>().user;
  final DioClient _httpClient = DioClient();

  @override
  Future<void> performAuth(User user) async {
    try {
      var response = await _httpClient.post(
        'login_api_name',
        data: json.encode(user.toJsonForSignIn()),
      );
      var fetchedUser = User.fromJson(response['response']);
      fetchedUser.auth = true;
      currentUser.value = fetchedUser;
    } on DioException catch (_) {
      rethrow;
    }
  }
}

extension LoginUser on User {
  JsonMap toJsonForSignIn() => {
        'email': email,
        'password': password,
      };
}
