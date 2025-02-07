import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_clean_architecture/app/modules/root/widgets/custom_bottom_navigation_item.dart';
import '../modules/root/controllers/root_controller.dart';

class CustomBottomNavigationBar extends GetView<RootController> {
  final Color backgroundColor;
  final Color itemColor;
  final List<CustomBottomNavigationItem> children;

  const CustomBottomNavigationBar({
    super.key,
    this.backgroundColor = Colors.white,
    required this.itemColor,
    required this.children,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(() => SafeArea(
          child: Container(
            height: 75,
            decoration: BoxDecoration(
              color: backgroundColor,
              boxShadow: [
                BoxShadow(
                  offset: const Offset(0, -4),
                  blurRadius: 20,
                  color: Get.theme.primaryColor.withOpacity(0.15),
                ),
              ],
            ),
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: children.asMap().entries.map((entry) {
                final int index = entry.key;
                final CustomBottomNavigationItem item = entry.value;

                return GestureDetector(
                  onTap: () => controller.changePage(index),
                  child: _buildNavigationItem(item, index, controller),
                );
              }).toList(),
            ),
          ),
        ));
  }

  Widget _buildNavigationItem(
      CustomBottomNavigationItem item, int index, RootController controller) {
    final bool isSelected = (controller.currentIndex.value == index);
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 2),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: isSelected ? Colors.blue.withOpacity(0.05) : Colors.transparent,
      ),
      child: Column(
        children: [
          AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            height: isSelected ? 2 : 0,
            margin: const EdgeInsets.only(bottom: 13.5),
            width: 73,
            color: isSelected ? Get.theme.primaryColor : Colors.transparent,
          ),
          Column(
            children: [
              AnimatedSwitcher(
                duration: const Duration(milliseconds: 200),
                child: Icon(
                  isSelected ? item.selectedIconUrl : item.iconUrl,
                  key: ValueKey<String>(
                    isSelected
                        ? item.selectedIconUrl.toString()
                        : item.iconUrl.toString(),
                  ),
                  size: 24,
                  color: isSelected ? Get.theme.primaryColor : Colors.grey,
                ),
              ).paddingOnly(top: isSelected ? 0 : 10),
              const SizedBox(height: 6),
              if (isSelected)
                AnimatedTextLabel(
                  item.label,
                  textStyle: Get.textTheme.bodyMedium!.copyWith(
                    color: Get.theme.primaryColor,
                    fontFamily: 'SF-Pro-Text',
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }
}

class AnimatedTextLabel extends StatelessWidget {
  final String text;
  final TextStyle textStyle;

  const AnimatedTextLabel(this.text, {super.key, required this.textStyle});

  @override
  Widget build(BuildContext context) {
    final RxBool isVisible = false.obs;

    Future.delayed(const Duration(milliseconds: 100), () {
      isVisible.value = true;
    });

    return Obx(() => AnimatedOpacity(
          opacity: isVisible.value ? 1.0 : 0.0,
          duration: const Duration(milliseconds: 300),
          child: Text(
            text,
            style: textStyle,
          ),
        ));
  }
}
