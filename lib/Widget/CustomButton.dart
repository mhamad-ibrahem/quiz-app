import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Constant/constant.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.onPress, required this.buttonText, required this.leftPadding, required this.rightPadding});
   final VoidCallback onPress;
   final String buttonText;
   final double leftPadding;
   final double rightPadding;
  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: 'button',
      child: MaterialButton(
        color: amber,
        padding: EdgeInsets.only(top: 15,bottom: 15,left: leftPadding,right: rightPadding),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        onPressed: onPress,
        child: Text(
          buttonText,
          style: TextStyle(
              color: white,
              fontSize: 20,
              shadows: [Shadow(blurRadius: 4)]),
        ),
      ),
    );
  }
}
