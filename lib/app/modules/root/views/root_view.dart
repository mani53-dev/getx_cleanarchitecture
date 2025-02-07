import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/helper.dart';
import '../../../global_widgets/custom_bottom_nav_bar.dart';
import '../controllers/root_controller.dart';
import '../widgets/custom_bottom_navigation_item.dart';

class RootView extends GetView<RootController> {
  const RootView({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: Helper().onWillPop,
      child: Scaffold(
        body: Obx(() => AnimatedSwitcher(
              duration: const Duration(milliseconds: 350),
              switchInCurve: Curves.easeInOut,
              switchOutCurve: Curves.easeInOut,
              child: KeyedSubtree(
                key: ValueKey(controller.currentIndex.value),
                child: controller.currentPage,
              ),
            )),
        bottomNavigationBar: CustomBottomNavigationBar(
          backgroundColor: context.theme.scaffoldBackgroundColor,
          itemColor: context.theme.colorScheme.primary,
          // currentIndex: controller.currentIndex.value,
          // onChange: controller.changePage,
          children: [
            CustomBottomNavigationItem(
              iconUrl: Icons.home_outlined,
              selectedIconUrl: Icons.home,
              label: "Home",
              color: Get.theme.primaryColor,
            ),
            CustomBottomNavigationItem(
              iconUrl: Icons.shop_outlined,
              selectedIconUrl: Icons.shop,
              label: "Market",
              color: Get.theme.primaryColor,
            ),
            CustomBottomNavigationItem(
              iconUrl: Icons.message_outlined,
              selectedIconUrl: Icons.message,
              label: "Messages",
              color: Get.theme.primaryColor,
            ),
            CustomBottomNavigationItem(
              iconUrl: Icons.person_outline,
              selectedIconUrl: Icons.person,
              label: "Profile",
              color: Get.theme.primaryColor,
            ),
          ],
        ),
      ),
    );
  }
}
