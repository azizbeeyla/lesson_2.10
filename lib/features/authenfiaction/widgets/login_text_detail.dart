import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/utils/app_colors.dart';

class LoginTextDetail extends StatelessWidget {
  const LoginTextDetail({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "Forgot Password?",
          style: TextStyle(
            color: Colors.white,
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(
          height: 74.h,
        ),
        Text(
          "or sign up with",
          style: TextStyle(
            color: AppColors.whiteText,
            fontWeight: FontWeight.w400,
            fontSize: 13,
          ),
        ),
        SizedBox(
          height: 26.h,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 14,
          children: [
            SvgPicture.asset('assets/insta.svg'),

            SvgPicture.asset('assets/google.svg'),
            SvgPicture.asset('assets/facebook.svg'),
            SvgPicture.asset('assets/whatsapp.svg'),
          ],
        ),
        SizedBox(
          height: 20.h,
        ),
        Text(
          "Don’t have an account? Sign Up",
          style: TextStyle(
            color: AppColors.whiteText,
            fontWeight: FontWeight.w400,
            fontSize: 13,
          ),
        ),
      ],
    );
  }
}
