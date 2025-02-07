import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:getx_clean_architecture/app/models/user_model.dart';

import 'local_storage_service.dart';

class UserService extends GetxService {
  final user = User().obs;
  LocalStorageService localStorageService = Get.find();

  Future<UserService> init() async {
    await getCurrentUser();
    user.listen((User user) {
      localStorageService.saveUserToStorage(user);
    });
    return this;
  }

  Future getCurrentUser() async {
    user.value = await localStorageService.getUserFromStorage();
    if (user.value.userId != null && user.value.apiToken != null) {
      user.value.auth = true;
    } else {
      user.value.auth = false;
    }
  }

  Future removeCurrentUser() async {
    await localStorageService.removeCurrentUserFromStorage();
    user.value = User();
  }

  bool get isAuth => user.value.auth ?? false;
  String? get apiToken => isAuth ? user.value.apiToken : null;
}
