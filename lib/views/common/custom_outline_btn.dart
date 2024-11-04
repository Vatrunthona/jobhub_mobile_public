import 'package:flutter/material.dart';
import 'package:jobhub/views/common/exports.dart';

class CustomOutlineBtn extends StatelessWidget {
  const CustomOutlineBtn(
      {super.key,
      this.width,
      this.height,
      required this.text,
      required this.onTap,
      this.color,
      required this.textColor,
      required this.borderColor});

  final double? width;
  final double? height;
  final String text;
  final Function() onTap;
  final Color? color;
  final Color borderColor;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width ?? 100,
        height: height ?? 50,
        decoration: BoxDecoration(
          color: color,
          border: Border.all(color: borderColor, width: 1),
        ),
        child: Center(
          child: ReusableText(
              text: text, style: appstyle(16, textColor, FontWeight.w500)),
        ),
      ),
    );
  }
}
