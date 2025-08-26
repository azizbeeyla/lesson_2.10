import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../core/utils/app_colors.dart';
import '../../../data/models/topchefs/top_chefs_detail.dart';

class TopChefFollow extends StatelessWidget {
  const TopChefFollow({
    super.key,
    required this.vm,
  });

  final TopChefsDetailModel vm;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 356.w,
      height: 49.57.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14.r),
        border: BoxBorder.all(
          color: AppColors.pinkorig,
        ),
      ),
      padding: EdgeInsets.symmetric(
        horizontal: 20.w,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "${vm.recipesCount}",
                style: TextStyle(
                  color: AppColors.whiteText,
                  fontWeight: FontWeight.w500,
                  fontSize: 15.sp,
                ),
              ),
              Text(
                "recipes",
                style: TextStyle(
                  color: AppColors.whiteText,
                  fontWeight: FontWeight.w400,
                  fontSize: 12.sp,
                ),
              ),
            ],
          ),
          VerticalDivider(
            color: AppColors.pinkorig,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "${vm.followingCount}",
                style: TextStyle(
                  color: AppColors.whiteText,
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                "Following",
                style: TextStyle(
                  color: AppColors.whiteText,
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
          VerticalDivider(

            color: AppColors.pinkorig,

          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "${vm.followerCount}",
                style: TextStyle(
                  color: AppColors.whiteText,
                  fontWeight: FontWeight.w500,
                  fontSize: 15.sp,
                ),
              ),
              Text(
                "Followers",
                style: TextStyle(
                  color: AppColors.whiteText,
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
