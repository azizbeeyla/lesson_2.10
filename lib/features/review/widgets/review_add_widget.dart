import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:lesson2_10/core/router/router_name.dart';
import 'package:provider/provider.dart';

import '../../../core/utils/app_colors.dart';
import '../managers/rewiev_view_model.dart';

class ReviewsAddWidget extends StatelessWidget {
  const ReviewsAddWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<ReviewsViewModel>(
      builder: (context, vm, child) => Container(
        width: 430.w,
        height: 223.24.h,
        decoration: BoxDecoration(
          color: AppColors.mainpink,
          borderRadius: BorderRadius.circular(20.r),
        ),
        alignment: Alignment.center,
        padding: EdgeInsets.fromLTRB(37.w, 30.h, 37.w, 30.h),
        child: vm.loading
            ? CircularProgressIndicator()
            : Row(
                spacing: 15.w,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(14.34.r),
                    child: Image.network(
                      vm.review!.photo,
                      width: 162.26.w,
                      height: 163.24.h,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Column(
                    spacing: 5.h,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        vm.review!.title,
                        style: TextStyle(
                          color: AppColors.whiteText,
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Row(
                        spacing: 4.68.w,
                        children: [
                          ...List.generate(
                            vm.review!.rating.toInt(),
                            (
                              index,
                            ) {
                              return SvgPicture.asset(
                                'assets/starwhite.svg',
                              );
                            },
                          ),
                          ...List.generate(
                            5 - vm.review!.rating.toInt(),
                            (
                              index,
                            ) {
                              return SvgPicture.asset('assets/starempty.svg');
                            },
                          ),
                          Text(
                            "(${vm.review!.reviewsCount} reviews)",
                            style: TextStyle(
                              color: AppColors.whiteText,
                              fontSize: 11.5.sp,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        spacing: 5.w,
                        children: [
                          ClipOval(
                            child: Image.network(
                              vm.review!.user.profilePhoto,
                              width: 32.18.w,
                              height: 33.24.h,
                              fit: BoxFit.cover,
                            ),
                          ),
                          SizedBox(
                            width: 141.54.w,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "@${vm.review!.user.username}",
                                  style: TextStyle(
                                    color: AppColors.whiteText,
                                    fontSize: 14.sp,
                                  ),
                                ),
                                Text(
                                  "${vm.review!.user.firstName} ${vm.review!.user.lastName}-chef",
                                  style: TextStyle(
                                    color: AppColors.whiteText,
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w300,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      TextButton(
                        style: TextButton.styleFrom(
                          backgroundColor: AppColors.whiteText,
                          fixedSize: Size(126.w, 24.h),
                        ),
                        onPressed: () {
                          context.push(
                            RouterName.reviewAdd,
                            extra: {
                              "categoriyId": vm.review!.id,
                            },
                          );
                        },
                        child: Text(
                          "Add Review",
                          style: TextStyle(
                            color: AppColors.mainpink,
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
      ),
    );
  }
}
