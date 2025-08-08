import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lesson2_10/core/utils/app_colors.dart';
import 'package:lesson2_10/features/onboarding/managers/onboarding1_view.dart';
import 'package:provider/provider.dart';
import 'onboarding_texts.dart';
class ContinueButton extends StatelessWidget {
  final VoidCallback onpresed;
  const ContinueButton({
    super.key, required this.onpresed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 30.0),
      child: TextButton(
        style: TextButton.styleFrom(
          backgroundColor: AppColors.pinkorig,
          fixedSize: Size(162, 45),
        ),

        onPressed:onpresed,

        child: Text(
          "Continue",
          style: TextStyle(color: Colors.pink, fontSize: 20),
        ),
      ),
    );  }
}