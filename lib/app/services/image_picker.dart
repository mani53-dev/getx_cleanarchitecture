/* 
 * Author: Affine Sol (PVT LTD) - https://affinesol.com/ 
 * Last Modified: 19/01/2025 at 23:07:20
 */

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../common/ui.dart';

mixin MyImagePicker {
  final ImagePicker picker = ImagePicker();

  void showImagePicker(Rx<XFile?> pickedImage, RxString pickedImagePath) {
    showModalBottomSheet(
      context: Get.context!,
      builder: (BuildContext context) {
        return SafeArea(
          child: Wrap(
            children: <Widget>[
              ListTile(
                leading: Icon(
                  Icons.photo_library,
                  color: Get.theme.primaryColor,
                ),
                title: Text(
                  'Photo Library',
                  style: Get.textTheme.labelLarge!
                      .copyWith(fontWeight: FontWeight.w600),
                ),
                onTap: () {
                  pickImage(pickedImage, pickedImagePath, ImageSource.gallery);
                  Get.back();
                },
              ).marginOnly(top: 8),
              ListTile(
                leading: Icon(
                  Icons.photo_camera,
                  color: Get.theme.primaryColor,
                ),
                title: Text(
                  'Camera',
                  style: Get.textTheme.labelLarge!
                      .copyWith(fontWeight: FontWeight.w600),
                ),
                onTap: () {
                  pickImage(pickedImage, pickedImagePath, ImageSource.camera);
                  Get.back();
                },
              ).marginOnly(bottom: 8),
            ],
          ),
        );
      },
    );
  }

  Future<void> pickImage(Rx<XFile?> pickedImage, RxString pickedImagePath,
      ImageSource source) async {
    try {
      final XFile? image =
          await picker.pickImage(source: source, imageQuality: 50);
      if (image != null) {
        if (_isValidImageExtension(image.path)) {
          pickedImagePath.value = image.path;
          pickedImage.value = image;
        } else {
          throw Exception('Only PNG, JPG, and JPEG are allowed.');
        }
      }
    } catch (e) {
      Get.showSnackbar(Ui.ErrorSnackBar(message: e.toString()));
    }
  }

  bool _isValidImageExtension(String filePath) {
    String extension = filePath.split('.').last.toLowerCase();
    return ['png', 'jpg', 'jpeg'].contains(extension);
  }
}
