import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Constant/constant.dart';

class CustomForm extends StatelessWidget {
  final Function(String)? onChanged;
  final String? Function(String?)? validator;
  final String labelText;
  final TextEditingController controller ;

  const CustomForm(
      {super.key, this.onChanged, this.validator, required this.labelText, required this.controller});
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      onChanged: onChanged,
      validator: validator,
      cursorColor: white,
      style: Get.textTheme.headline3,
      decoration: InputDecoration(
          errorBorder:
              OutlineInputBorder(borderRadius: BorderRadius.circular(17)),
          focusedErrorBorder:
              OutlineInputBorder(borderRadius: BorderRadius.circular(17),borderSide: BorderSide(color: red,width: 2)),
          contentPadding:const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          labelText: labelText,
          labelStyle:  Get.textTheme.headline4,
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(17),
              borderSide:  BorderSide(color: amber,width: 2)),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(17),
              borderSide: BorderSide(color:Get.theme.primaryColor ))),
    );
  }
}
