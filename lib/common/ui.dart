import 'dart:math';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Ui {
  static GetSnackBar SuccessSnackBar(
      {String title = 'success',
      required String message,
      SnackPosition snackPosition = SnackPosition.BOTTOM}) {
    Get.log("[$title] $message");
    return GetSnackBar(
      titleText: Text(title,
          style: Get.textTheme.titleLarge
              ?.merge(const TextStyle(color: Colors.white, fontSize: 20))),
      messageText: Text(
          message.substring(0, min(message.length, 200)).split(':').last.trim(),
          style: Get.textTheme.bodySmall
              ?.merge(const TextStyle(color: Colors.white, fontSize: 16))),
      snackPosition: snackPosition,
      margin: const EdgeInsets.all(12),
      backgroundColor: Colors.green.withOpacity(0.75),
      icon: const Icon(Icons.verified, size: 32, color: Colors.white),
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
      borderRadius: 12,
      duration: const Duration(milliseconds: 1500),
    );
  }

  static GetSnackBar ErrorSnackBar(
      {String title = 'error',
      required String message,
      SnackPosition snackPosition = SnackPosition.BOTTOM}) {
    Get.log("[$title] $message", isError: true);
    return GetSnackBar(
      titleText: Text(
        title,
        style: Get.textTheme.titleLarge?.merge(
          const TextStyle(color: Colors.white, fontSize: 18),
        ),
      ),
      messageText: Text(
        message
            .substring(
              0,
              min(message.length, 200),
            )
            .split(':')
            .last
            .trim(),
        style: Get.textTheme.bodySmall?.merge(
          const TextStyle(color: Colors.white, fontSize: 12),
        ),
      ),
      snackPosition: snackPosition,
      margin: const EdgeInsets.all(12),
      backgroundColor: Colors.redAccent.withOpacity(0.75),
      icon: const Icon(Icons.error, size: 32, color: Colors.white),
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
      borderRadius: 12,
      duration: const Duration(milliseconds: 1500),
    );
  }

  static BoxDecoration getBoxDecoration({
    Color? color,
    required double radius,
    Border? border,
    Gradient? gradient,
    List<BoxShadow>? shadow,
  }) {
    return BoxDecoration(
        color: color,
        borderRadius: BorderRadius.all(Radius.circular(radius)),
        border: border,
        boxShadow: shadow,
        gradient: gradient);
  }

  static InputDecoration getInputDecoration(
      {String hintText = '',
      String? errorText,
      Widget? iconData,
      Widget? suffixIcon,
      TextStyle? hintStyle,
      bool? isDense,
      Widget? suffix}) {
    return InputDecoration(
      hintText: hintText,
      hintStyle: hintStyle ??
          Get.textTheme.labelMedium!.copyWith(color: const Color(0xff575757)),
      prefixIcon: iconData != null
          ? Container(
              margin: const EdgeInsets.only(right: 16),
              child: iconData,
            )
          : const SizedBox(),
      prefixIconConstraints: iconData != null
          ? const BoxConstraints.expand(width: 38, height: 20)
          : const BoxConstraints.expand(width: 0, height: 0),
      suffixIconConstraints: suffixIcon != null
          ? const BoxConstraints.expand(width: 20, height: 20)
          : const BoxConstraints.expand(width: 0, height: 0),
      floatingLabelBehavior: FloatingLabelBehavior.never,
      contentPadding: const EdgeInsets.all(0),
      isDense: isDense ?? true,
      border: const OutlineInputBorder(borderSide: BorderSide.none),
      focusedBorder: const OutlineInputBorder(borderSide: BorderSide.none),
      enabledBorder: const OutlineInputBorder(borderSide: BorderSide.none),
      suffixIcon: suffixIcon,
      suffix: suffix,
      errorText: errorText,
      // counterText: errorText,
      errorStyle: Get.textTheme.bodySmall!.copyWith(
        color: const Color(0XFFEC1A1A),
        fontWeight: FontWeight.w500,
        fontSize: 12,
      ),
    );
  }
}
