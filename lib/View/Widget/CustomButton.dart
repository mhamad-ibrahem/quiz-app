import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../core/Constant/constant.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.onPress,
    required this.buttonText,
    this.hight,
    this.width,
  });
  final VoidCallback onPress;
  final String buttonText;
  final double? hight;
  final double? width;
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      color: AppColors.amber,
      height: hight ?? 50,
      minWidth: width ?? Get.width * 0.85,
      // padding: EdgeInsets.only(
      //     top: 20, bottom: 20, left: leftPadding, right: rightPadding),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      onPressed: onPress,
      child: Text(
        buttonText,
        style: const TextStyle(
          color: AppColors.white,
          fontSize: 20,
        ),
      ),
    );
  }
}
