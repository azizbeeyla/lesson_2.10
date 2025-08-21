import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lesson2_10/core/utils/app_colors.dart';
import 'package:lesson2_10/features/trending_recipe/managers/trending_view_model.dart';
import 'package:provider/provider.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TrendingDetail extends StatelessWidget {
  const TrendingDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<MostViewedViewModel>(
      builder: (context, vm, child) {
        if (vm.isDetailLoad) {
          return const Center(child: CircularProgressIndicator());
        }

        return Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              "See All",
              style: TextStyle(color: AppColors.mainpink, fontSize: 12.sp),
            ),
            SizedBox(height: 15.h),
            ...List.generate(vm.details.length, (index) {
              final detail = vm.details[index];
              return Padding(
                padding: const EdgeInsets.only(bottom: 15.0),
                child: SizedBox(
                  width: 358.w,
                  height: 150.h,
                  child: Stack(
                    children: [
                      Align(
                        alignment: Alignment.centerRight,
                        child: Container(
                          width: 207.w,
                          height: 122.h,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.horizontal(
                              right: Radius.circular(14.r),
                            ),
                          ),
                          padding: EdgeInsets.all(10.w),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                detail.title,
                                style: TextStyle(
                                  color: AppColors.textcolor,
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              SizedBox(height: 6.h),
                              Text(
                                detail.description,
                                style: TextStyle(
                                  color: AppColors.textcolor,
                                  fontSize: 13.sp,
                                  fontWeight: FontWeight.w300,
                                ),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                              SizedBox(height: 6.h),
                              Text(
                                "By Chef Josh Ryan",
                                style: TextStyle(
                                  color: AppColors.mainpink,
                                  fontWeight: FontWeight.w300,
                                  fontSize: 12.sp,
                                ),
                              ),
                              Spacer(),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      SvgPicture.asset('assets/clock.svg'),
                                      SizedBox(width: 5.w),
                                      Text(
                                        "${detail.timeRequired} min",
                                        style: TextStyle(
                                          color: AppColors.pink,
                                          fontSize: 12.sp,
                                        ),
                                      ),
                                    ],
                                  ),

                                  Row(
                                    children: [
                                      Text(
                                        "${detail.rating}",
                                        style: TextStyle(
                                          color: AppColors.pink,
                                          fontSize: 12.sp,
                                        ),
                                      ),
                                      SizedBox(width: 5.w),
                                      SvgPicture.asset("assets/star.svg"),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(14.r),
                        child: Image.network(
                          detail.photo,
                          width: 151.w,
                          height: 150.h,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }),
          ],
        );
      },
    );
  }
}
