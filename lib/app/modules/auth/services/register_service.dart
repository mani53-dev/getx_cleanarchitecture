/* 
 * Author: Affine Sol (PVT LTD) - https://affinesol.com/ 
 * Last Modified: 27/11/2024 at 14:23:54
 */

import 'dart:convert';
import 'package:artools/artools.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

import '../../../models/user_model.dart';
import '../../../providers/dio_client.dart';
import '../../../services/background/user_service.dart';
import 'auth_service.dart';

class RegisterService implements AuthService {
  final Rx<User> currentUser = Get.find<UserService>().user;
  final DioClient _httpClient = DioClient();

  @override
  Future performAuth(User user) async {
    try {
      var response = await _httpClient.post(
        'register_api_name',
        data: json.encode(user.toJsonForSignUp()),
      );
      currentUser.value = User.fromJson(response);
    } on DioException catch (_) {
      rethrow;
    }
  }
}

extension RegisterUser on User {
  JsonMap toJsonForSignUp() => {
        'name': userName,
        'email': email,
        'password': password,
        'avatarURL': avatarURL,
      };
}
