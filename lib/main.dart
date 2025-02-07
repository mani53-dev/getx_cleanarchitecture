import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_clean_architecture/app/routes/app_pages.dart';
import 'package:getx_clean_architecture/app/services/background/user_service.dart';
import 'app/services/background/local_storage_service.dart';
import 'common/theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Get.putAsync(() => LocalStorageService().init());
  await Get.putAsync(() => UserService().init());

  runApp(
    GetMaterialApp(
      title: 'GetX',
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      debugShowCheckedModeBanner: false,
      defaultTransition: Transition.cupertino,
      theme: getAppTheme(),
    ),
  );
}
