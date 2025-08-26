import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lesson2_10/core/utils/app_colors.dart';
import 'package:lesson2_10/features/authenfiaction/widgets/forgot_password_detail.dart';
import 'package:lesson2_10/features/authenfiaction/widgets/recipe_text.dart';

class RecipeTextButton extends StatelessWidget {
  final Color backgroundColor;
  final Color textcolor;

  final String text;
  final VoidCallback? onPressed;
  const RecipeTextButton({
    super.key, required this.backgroundColor, required this.text, required this.onPressed, required this.textcolor,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),

        backgroundColor: backgroundColor,

        fixedSize: Size(168.w, 29.h),


      ),
      onPressed: onPressed,
      child: Text(
        text,
        style: TextStyle(
          color: textcolor,
          fontSize: 20,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
