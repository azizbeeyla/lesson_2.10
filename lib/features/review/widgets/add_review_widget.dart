import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lesson2_10/core/utils/app_colors.dart';
import 'package:lesson2_10/features/appbars/iconbutton.dart';
import 'package:lesson2_10/features/authenfiaction/common/continue_button.dart';
import 'package:lesson2_10/features/onboarding/widgets/continue_button.dart';
import 'package:lesson2_10/features/review/widgets/recipe_text_button.dart';

class AddReviews extends StatefulWidget {
  const AddReviews({
    super.key,
  });

  @override
  State<AddReviews> createState() => _AddReviewsState();
}

class _AddReviewsState extends State<AddReviews> {
  int selectedStars = 0;
  TextEditingController commentController = TextEditingController();
  String? selected = "No";

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 26.h,
      children: [
        Align(
          alignment: Alignment.center,
          child: Column(
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ...List.generate(5, (index) {
                    return IconButton(
                      style: IconButton.styleFrom(
                        padding: EdgeInsets.zero,
                        fixedSize: Size(28.57.w, 28.57.h),
                      ),
                      onPressed: () {
                        setState(() {
                          selectedStars = index + 1;
                        });
                      },
                      icon: SvgPicture.asset(
                        width: 28.57.w,
                        height: 28.57.h,
                        index < selectedStars
                            ? 'assets/starpink.svg'
                            : 'assets/starempty.svg',
                        colorFilter: ColorFilter.mode(
                          AppColors.pink,
                          BlendMode.modulate,
                        ),
                      ),
                    );
                  }),
                ],
              ),
              Text(
                "Your overall rating",
                style: TextStyle(color: Colors.white,fontSize: 12.sp,fontWeight: FontWeight.w400),
              ),
            ],
          ),
        ),
        TextField(
          controller: commentController,
          maxLines: 4,
          style: TextStyle(color: AppColors.mainpink,fontSize: 15.sp),
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(
              horizontal: 11.w,
              vertical: 11.h,
            ),
            constraints: BoxConstraints(maxWidth: 358.w, maxHeight: 142.18.h),
            filled: true,
            fillColor: AppColors.pinkorig,
            hintText: "Leave us Review!",
            hintStyle: TextStyle(
              color: Color(0xFF1C0F0D73),
              fontSize: 15.sp,
              fontWeight: FontWeight.w500,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14.r),
              borderSide: BorderSide.none,
            ),
          ),
        ),
        SizedBox(
          width: 196.w,
          child: Column(
            spacing: 6.h,
            children: [
              Text(
                "Do you recommend this recipe?",
                style: TextStyle(color: Colors.white, fontSize: 12.sp),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Text(
                        "No",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w400,
                          fontSize: 15.sp,
                        ),
                      ),
                      Radio<String>(
                        value: "No",
                        groupValue: selected,
                        activeColor: Colors.red,
                        onChanged: (value) {
                          setState(() {
                            selected = value;
                          });
                        },
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        "Yes",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Radio<String>(
                        value: "Yes",
                        groupValue: selected,
                        activeColor: Colors.red,
                        onChanged: (value) {
                          setState(() {
                            selected = value;
                          });
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            RecipeTextButton(
              backgroundColor: AppColors.pinkorig,
              text: "Cancel",
              onPressed: () {},
              textcolor: AppColors.pink,
            ),
            RecipeTextButton(
              backgroundColor: AppColors.mainpink,
              text: "Submit",
              onPressed: () {},
              textcolor: AppColors.whiteText,
            ),
          ],
        ),
      ],
    );
  }
}
