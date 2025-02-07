import 'package:get/get.dart';
import 'package:getx_clean_architecture/app/modules/root/views/root_view.dart';

import '../modules/auth/bindings/auth_binding.dart';
import '../modules/auth/views/login_view.dart';
import '../modules/auth/views/register_view.dart';
import '../modules/root/bindings/root_binding.dart';
import 'app_routes.dart';

class AppPages {
  static var INITIAL = Routes.LOGIN;

  static final routes = [
    GetPage(
      name: Routes.ROOT,
      page: () => const RootView(),
      binding: RootBinding(),
      // middlewares: const [
      //   // AuthMiddleware(),
      // ]
    ),
    GetPage(
        name: Routes.LOGIN,
        page: () => const LoginView(),
        binding: AuthBinding()),
    GetPage(
      name: Routes.REGISTER,
      page: () => RegisterView(),
      binding: AuthBinding(),
    ),
  ];
}
