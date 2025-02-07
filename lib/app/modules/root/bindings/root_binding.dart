import 'package:get/get.dart';
import 'package:getx_clean_architecture/app/modules/dashboard/controllers/dashboard_controller.dart';
import 'package:getx_clean_architecture/app/modules/dashboard/services/dashboard_service.dart';
import '../controllers/root_controller.dart';

class RootBinding extends Bindings {
  @override
  void dependencies() {
    //services
    Get.lazyPut(() => DashboardService());
    Get.lazyPut(() => RootController());

    Get.lazyPut(
      () => DashboardController(
        dashboardService: Get.find<DashboardService>(),
      ),
    );
  }
}
