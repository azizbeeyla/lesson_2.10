import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lesson2_10/core/utils/app_colors.dart';
import 'package:provider/provider.dart';

import '../managers/review_comment_vmodel.dart';

class ReviewsComments extends StatelessWidget {
  const ReviewsComments({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<ReviewsCommentViewModel>(
      builder: (context, vm, child) => Padding(
        padding: EdgeInsets.symmetric(horizontal: 36.w),
        child: Column(
          spacing: 17.h,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Comments",
              style: TextStyle(color: AppColors.mainpink,fontSize: 15.sp,fontWeight: FontWeight.w600),
            ),
            ...List.generate(vm.comments.length, (index) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 11.h,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        spacing: 13.w,
                        children: [
                          ClipOval(
                            child: Image.network(
                              vm.comments[index].user.profilePhoto,
                              width: 46.w,
                              height: 42.h,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Text(
                            "@ ${vm.comments[index].user}",
                            style: TextStyle(color: AppColors.mainpink,fontSize: 15.sp)
                          ),
                        ],
                      ),
                      Text("(${vm.comments[index].created})"),
                    ],
                  ),
                  Text(
                    vm.comments[index].comment,
                    style: TextStyle(color: AppColors.whiteText,fontSize: 12.sp),
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Row(
                    spacing: 4.68.w,
                    children: [
                      ...List.generate(
                        vm.comments[index].rating.toInt(),
                            (
                            index,
                            ) {
                          return SvgPicture.asset(
                            "assets/starpink.svg",
                          );
                        },
                      ),
                      ...List.generate(
                        5 - vm.comments[index].rating.toInt(),
                            (
                            index,
                            ) {
                          return SvgPicture.asset(
                            'assets/starempty.svg',
                          );
                        },
                      ),
                    ],
                  ),
                ],
              );
            }),
          ],
        ),
      ),
    );
  }
}
