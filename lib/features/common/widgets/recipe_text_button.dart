import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RecipeTextButton extends StatelessWidget {
  final Color backgroundColor;
  final Color textColor;
  final String text;
  final VoidCallback? onPressed;

  final double width;
  final double height;
  final double fontSize;
  final double borderRadius;

  const RecipeTextButton({
    super.key,
    required this.backgroundColor,
    required this.textColor,
    required this.text,
    required this.onPressed,
    required this.width,
    required this.height,
    required this.fontSize,
    required this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius.r),
        ),
        backgroundColor: backgroundColor,
        fixedSize: Size(width.w, height.h),
      ),
      onPressed: onPressed,
      child: Text(
        text,
        style: TextStyle(
          color: textColor,
          fontSize: fontSize.sp,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
