import 'package:flutter/material.dart';

import 'package:sizer/sizer.dart';
import 'package:stopwatch/constants/textStyles_constants.dart';

class CustomButton extends StatelessWidget {
  CustomButton(
      {Key? key,
      required this.onPressed,
      required this.text,
      this.alt = false,
      this.textColor,
      this.borderColor,
      this.bgColor,
      this.isBorder = true,
      this.upperCase = true,
      this.password = false,
      this.iconWithText})
      : super(key: key);

  final void Function()? onPressed;
  final String text;
  final bool alt;
  final bgColor;
  final textColor;
  final borderColor;
  final bool upperCase;
  final bool password;
  final bool isBorder;
  final iconWithText;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 1.5.h),
          // primary: Colors.blue,
          backgroundColor: bgColor,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.sp))),
      onPressed: onPressed,
      child: Container(
          alignment: Alignment.center,
          child: Center(
              child: iconWithText ??
                  Text(upperCase ? text.toUpperCase() : text,
                      style: DesignTextStyles.s12SB()))),
    );
  }
}
