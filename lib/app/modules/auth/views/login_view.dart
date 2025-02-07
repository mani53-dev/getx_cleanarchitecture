import 'package:artools/artools.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_clean_architecture/common/colors.dart';

import '../../../global_widgets/block_button_widget.dart';
import '../../../global_widgets/loading_indicator.dart';
import '../../../global_widgets/text_field_widget.dart';
import '../../../routes/app_routes.dart';
import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Obx(
        () => Stack(
          children: [
            SafeArea(
              child: Column(
                children: [
                  const FlutterLogo(
                    size: 100,
                  ).marginOnly(bottom: 20, top: 16),
                  Expanded(
                    child: ListView(
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              "Welcome",
                              style: Get.textTheme.headlineMedium!
                                  .copyWith(letterSpacing: 1.5),
                            ).marginOnly(bottom: 8),
                            Text("Login to your account!",
                                    style: Get.textTheme.bodyMedium)
                                .marginOnly(
                              bottom: 40,
                            ),
                          ],
                        ),
                        Form(
                          key: controller.loginFormKey,
                          child: Column(
                            children: [
                              TextFieldWidget(
                                labelText: "Email",
                                hintText: "abc@xyz.com",
                                onSaved: (input) =>
                                    controller.currentUser.value.email = input,
                                validator: (input) => input!.isEmpty
                                    ? "Field cannot be empty"
                                    : GetUtils.isEmail(input.trim())
                                        ? null
                                        : "Enter valid email",
                                onChanged: (String value) {},
                                keyboardType: TextInputType.emailAddress,
                                iconData: Icon(
                                  Icons.email,
                                  color: AppColors.primaryColor.color,
                                ),
                              ).marginOnly(bottom: 4),
                              Obx(
                                () => TextFieldWidget(
                                  labelText: "Password",
                                  hintText: "*****",
                                  onSaved: (input) => controller
                                      .currentUser.value.password = input!,
                                  onChanged: (input) => controller
                                      .currentUser.value.password = input,
                                  validator: (input) => input!.isEmpty
                                      ? "Field cannot be empty"
                                      : input.length < 3
                                          ? "You must enter 3 characters least"
                                          : null,
                                  obscureText: controller.hidePassword.value,
                                  keyboardType: TextInputType.visiblePassword,
                                  suffixIcon: GestureDetector(
                                    onTap: () => controller.hidePassword.value =
                                        !controller.hidePassword.value,
                                    child: Icon(
                                      controller.hidePassword.value
                                          ? Icons.visibility_off
                                          : Icons.visibility,
                                    ),
                                  ),
                                  iconData: Icon(
                                    Icons.lock,
                                    color: AppColors.primaryColor.color,
                                  ),
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  TextButton(
                                    onPressed: () {
                                      Get.toNamed(Routes.FORGOT_PASSWORD);
                                    },
                                    child: Text("Forget password?",
                                        style: Get.textTheme.bodyMedium),
                                  ),
                                ],
                              ).paddingSymmetric(horizontal: 24),
                              BlockButtonWidget(
                                onPressed: controller.login,
                                color: Get.theme.primaryColor,
                                text: Text("Login",
                                    style: Get.textTheme.headlineMedium!
                                        .copyWith(
                                            color: Colors.white, fontSize: 16)),
                                width: double.infinity,
                                verticalPadding: 14,
                              ).marginOnly(top: 48),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ).isAbsorbing(controller.loading.value),
            ),
            controller.loading.value
                ? LoadingIndicator(
                    isVisible: controller.loading.value,
                    loadingText: 'Logging In'.tr)
                : const SizedBox()
          ],
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(bottom: 10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Don't have an account?", style: Get.textTheme.bodyMedium),
              TextButton(
                style: TextButton.styleFrom(
                  padding: EdgeInsets.zero,
                ),
                onPressed: () => Get.offAllNamed(Routes.REGISTER),
                child: Text(
                  "Sign up",
                  style: Get.textTheme.headlineMedium!.copyWith(fontSize: 16),
                ),
              )
            ],
          ),
        ),
      ).isAbsorbing(controller.loading.value),
    );
  }

  Size get preferredSize => const Size.fromHeight(100); //
}
