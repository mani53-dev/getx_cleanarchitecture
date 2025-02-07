import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/ui.dart';
import '../../../models/user_model.dart';
import '../../../routes/app_routes.dart';
import '../../../services/background/user_service.dart';
import '../services/auth_service.dart';

class LoginController extends GetxController {
  LoginController({required this.authService});
  final AuthService authService;

  final loading = false.obs;
  final Rx<User> currentUser = Get.find<UserService>().user;
  final hidePassword = true.obs;
  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();

  void login() async {
    Get.focusScope?.unfocus();
    if (!loginFormKey.currentState!.validate()) return;
    loginFormKey.currentState!.save();
    loading.value = true;
    try {
      Future.delayed(const Duration(seconds: 10));
      await authService.performAuth(currentUser.value);
      Get.offAllNamed(Routes.ROOT);
    } on DioException catch (e) {
      Get.showSnackbar(Ui.ErrorSnackBar(message: e.message!));
    } finally {
      loading.value = false;
    }
  }
}
