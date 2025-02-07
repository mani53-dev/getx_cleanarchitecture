import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_clean_architecture/common/colors.dart';
import 'package:getx_clean_architecture/common/ui.dart';

class TextFieldWidget extends StatelessWidget {
  const TextFieldWidget({
    super.key,
    this.onSaved,
    this.onChanged,
    this.validator,
    this.keyboardType,
    this.initialValue,
    this.hintText,
    this.errorText,
    this.iconData,
    required this.labelText,
    this.obscureText,
    this.suffixIcon,
    this.style,
    this.textAlign,
    this.suffix,
    this.inputFormatters,
    this.maxLines = 1,
    this.readOnly = false,
    this.labelSecondaryText,
    this.controller,
  });

  final FormFieldSetter<String>? onSaved;
  final ValueChanged<String>? onChanged;
  final FormFieldValidator<String>? validator;
  final TextInputType? keyboardType;
  final String? initialValue;
  final String? hintText;
  final String? errorText;
  final TextAlign? textAlign;
  final String labelText;
  final TextStyle? style;
  final Widget? iconData;
  final bool? obscureText;
  final Widget? suffixIcon;
  final Widget? suffix;
  final TextEditingController? controller;
  final inputFormatters;
  final maxLines;
  final readOnly;
  final labelSecondaryText;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(
              margin: const EdgeInsets.only(left: 24.0),
              child: Text(
                labelText,
                style: Get.textTheme.titleMedium!,
                textAlign: textAlign,
              ),
            ),
          ],
        ),
        Container(
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
          margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          decoration: BoxDecoration(
            color: AppColors.bgColor.color,
            borderRadius: const BorderRadius.all(Radius.circular(10)),
          ),
          child: TextFormField(
            maxLines: keyboardType == TextInputType.multiline ? null : maxLines,
            key: key,
            controller: controller,
            cursorColor: Get.theme.primaryColor,
            keyboardType: keyboardType,
            onSaved: onSaved,
            readOnly: readOnly,
            onChanged: onChanged,
            validator: validator,
            initialValue: initialValue ?? '',
            style: Get.textTheme.bodyMedium,
            inputFormatters: inputFormatters ?? [],
            obscureText: obscureText ?? false,
            textAlign: textAlign ?? TextAlign.start,
            textAlignVertical: TextAlignVertical.center,
            autocorrect: false,
            decoration: Ui.getInputDecoration(
              hintText: hintText ?? '',
              iconData: iconData,
              suffixIcon: suffixIcon,
              suffix: suffix,
              errorText: errorText,
            ),
          ),
        ),
      ],
    );
  }
}
