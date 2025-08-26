import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lesson2_10/features/topchefs/widgets/most_liked_chefs.dart';
import 'package:provider/provider.dart';

import '../../../core/utils/app_colors.dart';
import '../managers/top_chefs_viewmodel.dart';

class MostViewedChefs extends StatelessWidget {
  const MostViewedChefs({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<TopChefsViewModel>(
      builder: (context, vm, child) => Container(
        width: 430.w,
        height: 285.h,
        decoration: BoxDecoration(
          color: AppColors.mainpink,
          borderRadius: BorderRadius.circular(20.r),
        ),
        padding: EdgeInsets.fromLTRB(36.w, 9.h, 36.w, 27.h),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Most viewed chefs",
              style: TextStyle(
                color: Colors.white,
                fontSize: 15.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
            Row(
              spacing: 18.w,
              children: List.generate(vm.chefsOne.length, (index) {
                final chef = vm.chefsOne[index];
                return MostLikedChefs( vm: vm.chefsOne,index: index,);
              }),
            ),
          ],
        ),
      ),
    );
  }
}
