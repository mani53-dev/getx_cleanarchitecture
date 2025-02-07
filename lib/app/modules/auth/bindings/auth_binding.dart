import 'package:get/get.dart';

import '../controllers/login_controller.dart';
import '../controllers/register_controller.dart';
import '../services/login_service.dart';
import '../services/register_service.dart';

class AuthBinding extends Bindings {
  @override
  void dependencies() {
    // Get.put(AuthController(), permanent: true);
    Get.lazyPut(() => LoginService());
    Get.lazyPut(() => RegisterService());

    Get.lazyPut(() => LoginController(authService: Get.find<LoginService>()));
    Get.lazyPut(
        () => RegisterController(authService: Get.find<RegisterService>()));
  }
}
