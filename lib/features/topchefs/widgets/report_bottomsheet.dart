import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import '../../../core/utils/app_colors.dart';
import '../managers/top_chefs_detail_viewmodel.dart';

class ReportBottomSheet extends StatelessWidget {
  const ReportBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<TopChefDetailViewModel>();

    return Container(
      height: 373.h,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(50.r),
        ),
      ),
      padding: EdgeInsets.fromLTRB(56.w, 45.h, 56.w, 65.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              ClipOval(
                child: Image.network(
                  vm.chefDetail!.profilePhoto,
                  width: 64.w,
                  height: 63.h,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(width: 15.w),
              Text(
                "@${vm.chefDetail!.username}",
                style: TextStyle(
                  color: AppColors.mainpink,
                  fontWeight: FontWeight.w500,
                  fontSize: 15.sp,
                ),
              ),
            ],
          ),
          SizedBox(height: 17.h),

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () {},
                child: Text(
                  "Manage notifications",
                  style: TextStyle(
                    color: AppColors.textcolor,
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              SizedBox(height: 17.h),
              Text(
                "Mute Notifications",
                style: TextStyle(
                  color: AppColors.textcolor,
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(height: 17.h),
              Text(
                "Mute Account",
                style: TextStyle(
                  color: AppColors.textcolor,
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(height: 17.h),
              Text(
                "Block Account",
                style: TextStyle(
                  color: AppColors.textcolor,
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(height: 17.h),
              GestureDetector(
                onTap: () {},
                child: Text(
                  "Report",
                  style: TextStyle(
                    color: AppColors.textcolor,
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
