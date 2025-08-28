import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/utils/app_colors.dart';
import '../../../data/models/me/me_model.dart';

class MeFollowInfo extends StatelessWidget {
  final MeModel user;
  const MeFollowInfo({super.key, required this.user});


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
  "${user.recipesCount}",
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
  "${user.followingCount}",
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
  "${user.followerCount}",
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
