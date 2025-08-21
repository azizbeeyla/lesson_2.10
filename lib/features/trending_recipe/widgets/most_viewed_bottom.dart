import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/utils/app_colors.dart';

class MostViewedBottom extends StatelessWidget {
  final String title;
  final String description;
  final num timeRequired;
  final num rating;

  const MostViewedBottom({
    super.key,
    required this.title,
    required this.description,
    required this.timeRequired,
    required this.rating,
  });

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                title,
                style: TextStyle(
                  color: AppColors.textcolor,
                  fontSize: 13.h,
                  fontWeight: FontWeight.w400,
                  fontFamily: "Poppins",
                ),
              ),
              Spacer(),
              SvgPicture.asset('assets/clock.svg'),
              SizedBox(width: 6.w),
              Text(
                "$timeRequired min",
                style: TextStyle(
                  color: AppColors.pink,
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w500,
                  fontFamily: "Poppins",
                ),
              ),
            ],
          ),
          Row(
            children: [
              SizedBox(
                width: 264.w,
                child: Text(
                  description,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: AppColors.textcolor,
                    fontSize: 13.sp,
                    fontWeight: FontWeight.w400,
                    fontFamily: "Spartan",
                  ),
                ),
              ),
              Spacer(),
              Text(
                "$rating",
                style: TextStyle(
                  color: AppColors.pink,
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w400,
                  fontFamily: "Poppins",
                ),
              ),
              SizedBox(width: 4.w),
              SvgPicture.asset('assets/star.svg'),
            ],
          ),
        ],
      ),
    );
  }
}
