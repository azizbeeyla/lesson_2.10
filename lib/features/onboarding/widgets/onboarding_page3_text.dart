import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnboardingPage3Text extends StatelessWidget {
  const OnboardingPage3Text({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "Welcome",
          style: TextStyle(
            color: Colors.white,
            fontSize: 25.h,
            fontWeight: FontWeight.w700,
          ),
        ),
        SizedBox(
          height: 11,
        ),

        Text(
          "Find the best recipes that the world can provide you also with every step that you can learn to increase your cooking skills.",style: TextStyle(color: Colors.white,fontSize: 13,),maxLines: 3,
        ),
      ],
    );
  }
}
