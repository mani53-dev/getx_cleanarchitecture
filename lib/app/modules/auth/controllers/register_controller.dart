import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import '../../../models/user_model.dart';
import '../../../routes/app_routes.dart';
import '../../../services/background/user_service.dart';
import '../services/auth_service.dart';

class RegisterController extends GetxController {
  RegisterController({required this.authService});

  final AuthService authService;

  final loading = false.obs;
  final Rx<User> currentUser = Get.find<UserService>().user;
  var isTermsAndConditionsAccepted = false.obs;
  final hidePassword = true.obs;
  final hideConfirmPassword = true.obs;
  GlobalKey<FormState> registerFormKey = GlobalKey<FormState>();
  RxString pickedImagePath = "".obs;
  Rx<XFile?> pickedImage = Rx<XFile?>(null);

  void register() async {
    Get.focusScope?.unfocus();
    if (!registerFormKey.currentState!.validate()) return;
    registerFormKey.currentState!.save();
    if (!isTermsAndConditionsAccepted.value) {
      Get.snackbar(
        "Alert",
        "Please accept terms and conditions.",
        margin: const EdgeInsets.all(16),
        colorText: Get.theme.primaryColor,
      );
      return;
    }
    loading.value = true;
    try {
      // await authService.performAuth(currentUser.value);
      Get.toNamed(Routes.ROOT);
    } on DioException {
      // Get.showSnackbar(Ui.ErrorSnackBar(message: e.message!.toString()));
    } finally {
      loading.value = false;
    }
  }
}
