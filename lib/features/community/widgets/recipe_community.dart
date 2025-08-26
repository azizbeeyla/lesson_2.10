import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lesson2_10/core/utils/app_colors.dart';
import 'package:lesson2_10/features/community/widgets/time_data.dart';

import '../../../data/models/comunity_models/comunity_model.dart';

class RecipeCommunity extends StatelessWidget {
  final List<CommunityModel> vm;
  final Function viewModel;

  const RecipeCommunity({
    super.key,
    required this.vm,
    required this.viewModel,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(vm.length, (index) {
        final item = vm[index];
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 37.0, vertical: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // USER INFO ROW
              Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(23),
                    child: Image.network(
                      item.user.profilePhoto,
                      width: 46.w,
                      height: 42.h,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(width: 8.w),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "@${item.user.username}",
                        style: TextStyle(
                          color: AppColors.whiteText,
                          fontSize: 25.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Text(
                        viewModel(item.created), // vaqtni format qilish
                        style: TextStyle(
                          color: AppColors.pink,
                          fontWeight: FontWeight.w400,
                          fontSize: 12.sp,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 10.h),

              // RECIPE CARD
              Container(
                width: double.infinity,
                height: 250.6.h,
                decoration: BoxDecoration(
                  color: AppColors.mainpink,
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Stack(
                  children: [
                    Align(
                      alignment: Alignment.topCenter,
                      child: ClipRRect(
                        borderRadius: const BorderRadius.only(
                          topRight: Radius.circular(14),
                          topLeft: Radius.circular(14),
                        ),
                        child: Image.network(
                          item.photo,
                          width: double.infinity,
                          height: 173.h,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 12.w,
                          vertical: 6.h,
                        ),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    item.title,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 15.sp,
                                      fontWeight: FontWeight.w500,
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                SizedBox(width: 8.w),
                                SvgPicture.asset('assets/star.svg'),
                                SizedBox(width: 5.w),
                                Text(
                                  "${item.rating}",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 4.h),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: Text(
                                    item.description,
                                    maxLines: 3,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      color: AppColors.whiteText,
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ),
                                SizedBox(width: 8.w),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Row(
                                      children: [
                                        SvgPicture.asset('assets/clock.svg'),
                                        SizedBox(width: 6.w),
                                        Text(
                                          "${item.timeRequired} min",
                                          style: TextStyle(
                                            color: AppColors.whiteText,
                                            fontWeight: FontWeight.w400,
                                            fontSize: 12.sp,
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 6.h),
                                    Row(
                                      children: [
                                        Text(
                                          "${item.reviewsCount}",
                                          style: TextStyle(
                                            color: AppColors.whiteText,
                                            fontSize: 12.sp,
                                          ),
                                        ),
                                        SizedBox(width: 6.w),
                                        SvgPicture.asset('assets/comment.svg'),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
