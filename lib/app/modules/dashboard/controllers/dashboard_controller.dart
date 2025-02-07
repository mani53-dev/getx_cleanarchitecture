import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:getx_clean_architecture/app/modules/dashboard/services/dashboard_service.dart';

import '../../../../common/ui.dart';
import '../../../models/user_model.dart';
import '../../../services/background/user_service.dart';

class DashboardController extends GetxController {
  AnyDashboardService dashboardService;
  DashboardController({required this.dashboardService});

  dynamic data = [];
  final loading = false.obs;
  final loadingMessage = ''.obs;
  final Rx<User> currentUser = Get.find<UserService>().user;

  @override
  void onInit() async {
    await fetchData();
    super.onInit();
  }

  Future<void> fetchData() async {
    try {
      loading.value = true;
      loadingMessage.value = 'fetching-data';
      // data = await dashboardService.fetchData();
      Future.delayed(const Duration(seconds: 5));
    } on DioException catch (e) {
      Get.showSnackbar(Ui.ErrorSnackBar(message: e.message.toString()));
    } finally {
      loading.value = false;
      loadingMessage.value = '';
    }
  }
}
