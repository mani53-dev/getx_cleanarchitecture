import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BlockButtonWidget extends StatelessWidget {
  const BlockButtonWidget({
    super.key,
    required this.color,
    required this.text,
    required this.onPressed,
    this.width,
    this.horizontalMargin,
    required this.verticalPadding,
  });

  final Color color;
  final Widget text;
  final onPressed;
  final double? width;
  final double verticalPadding;
  final double? horizontalMargin;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: width ?? double.infinity,
        margin: EdgeInsets.symmetric(horizontal: horizontalMargin ?? 24),
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: const Color(0xFF161616).withOpacity(0.15),
              blurRadius: 10,
              offset: const Offset(0, 10),
            ),
          ],
          // borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
        child: MaterialButton(
          onPressed: onPressed,
          padding: EdgeInsets.symmetric(vertical: verticalPadding),
          color: color,
          disabledElevation: 0,
          disabledColor: Get.theme.focusColor,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          elevation: 0,
          child: text,
        ));
  }
}
