import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../routes/app_routes.dart';
import '../services/background/user_service.dart';

class AuthMiddleware extends GetMiddleware {
  @override
  RouteSettings? redirect(String? route) {
    final authService = Get.find<UserService>();
    if (!authService.isAuth) {
      return const RouteSettings(name: Routes.LOGIN);
    }
    return null;
  }
}
