import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../core/utils/app_colors.dart';
import '../managers/top_chefs_detail_viewmodel.dart';

class ShareBottomSheet extends StatelessWidget {
  const ShareBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<TopChefDetailViewModel>(
      builder: (context, vm, child) {
        return Container(
          height: 253.h,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(50.r),
            ),
          ),
          padding: EdgeInsets.fromLTRB(56.w, 45.h, 56.w, 65.h),
          child: Column(
            spacing: 17.h,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                spacing: 15.w,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  ClipOval(
                    child: Image.network(
                      vm.chefDetail!.profilePhoto,
                      width: 64.w,
                      height: 63.h,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Text(
                    "@ ${vm.chefDetail!.username}",
                    style: TextStyle(
                      color: AppColors.mainpink,
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              Column(
                spacing: 17.h,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Copy Profile URL",
                    style: TextStyle(
                      color: AppColors.textcolor,
                      fontWeight: FontWeight.w400,
                      fontSize: 15.sp,
                    ),
                  ),
                  Text(
                    "Share this Profile",
                    style: TextStyle(
                      color: AppColors.textcolor,
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
