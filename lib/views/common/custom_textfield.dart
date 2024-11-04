import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jobhub/constants/app_constants.dart';

import 'app_style.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({super.key, required this.keyboardType, required this.obscureText, required this.hintText, this.suffixIcon, this.controller, this.validator});

  final TextInputType keyboardType;
  final bool obscureText;
  final String hintText;
  final Widget? suffixIcon;
  final TextEditingController? controller;
  final String? Function(String?)? validator;


  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(kLightGrey.value),
      child: TextFormField(
        keyboardType: keyboardType,
        obscureText: obscureText,
        decoration: InputDecoration(
          hintText: hintText,
          suffixIcon: suffixIcon,
          hintStyle: appstyle(14, Color(kDarkGrey.value), FontWeight.w500),
          errorBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.zero,
            borderSide: BorderSide(color: Colors.red, width: 0.5),
          ),
          focusedBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.zero,
            borderSide: BorderSide(color: Colors.transparent, width: 0),
          ),
          focusedErrorBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.zero,
            borderSide: BorderSide(color: Colors.red, width: 0.5),
          ),
          disabledBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.zero,
            borderSide: BorderSide(color: Colors.red, width: 0.5),
          ),
          enabledBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.zero,
            borderSide: BorderSide(color: Colors.red, width: 0.5),
          ),
          border: InputBorder.none,
        ),
        controller: controller,
        cursorHeight: 25,
        style: appstyle(14, Color(kDark.value), FontWeight.w500),
        validator: validator,
      ),
    );
  }
}