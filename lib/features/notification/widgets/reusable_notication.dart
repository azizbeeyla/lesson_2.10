import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lesson2_10/core/utils/app_colors.dart';
import 'package:lesson2_10/features/notification/widgets/switch_widget.dart';

class ReusableNotification extends StatelessWidget {
  final String textNotification;

  ReusableNotification({super.key, required this.textNotification});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 37.0,vertical: 13.5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            textNotification,
            style: TextStyle(
              color: AppColors.whiteText,
              fontSize: 15.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
          CustomSwitch()
        ],
      ),
    );
  }
}
