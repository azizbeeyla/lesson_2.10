import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/utils/app_colors.dart';
import '../../../data/models/topchefs/top_chefs_detail.dart';

class TopChefProfil extends StatelessWidget {
  const TopChefProfil({
    super.key,
    required this.vm,
  });

  final TopChefsDetailModel vm;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 97.h,
      child: Row(
        spacing: 13.w,
        children: [
          ClipOval(
            child: Image.network(
              vm.profilePhoto,
              width: 102.w,
              height: 97.h,
              fit: BoxFit.cover,
            ),
          ),
          Column(
            spacing: 5.5.h,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "${vm.firstName} ${vm.lastName}-Chef",
                style: TextStyle(
                  color: AppColors.mainpink,
                  fontWeight: FontWeight.w500,
                  fontSize: 15.sp,
                ),
              ),
              Text(
                vm.presentation,
                style: TextStyle(
                  color: AppColors.whiteText,
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w400,
                ),
                maxLines: 2,
              ),
              TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: AppColors.pinkorig,
                  foregroundColor: AppColors.mainpink,
                  padding: EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 2,
                  ),
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  minimumSize: Size(0, 0),
                ),
                onPressed: () {},
                child: Text(
                  "Following",
                  style: TextStyle(
                    color: AppColors.pink,
                    fontWeight: FontWeight.w500,
                    fontSize: 10.sp,
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
