import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:getx_clean_architecture/app/modules/dashboard/controllers/dashboard_controller.dart';
import 'package:getx_clean_architecture/common/colors.dart';

/// Replace dashboard controller with the original controller accordingly
class MessagesView extends GetView<DashboardController> {
  const MessagesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white.color,
      appBar: AppBar(
        title: const Text('Messages'),
        systemOverlayStyle: const SystemUiOverlayStyle(
          systemNavigationBarIconBrightness: Brightness.dark,
        ),
        backgroundColor: Get.theme.primaryColor.withOpacity(0.075),
      ),
      body: Obx(() => controller.loading.value
          ? const CircularProgressIndicator()
          : ListView.builder(
              primary: true,
              itemCount: controller.data.length,
              itemBuilder: (context, index) {
                return Container();
              },
            )),
    );
  }
}
