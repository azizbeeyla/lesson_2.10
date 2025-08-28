import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lesson2_10/features/review/widgets/recipe_text_button.dart';
import '../../../core/utils/app_colors.dart';
import '../../../data/models/me/me_model.dart';
import '../../common/widgets/recipe_text_button.dart';

class MeProfileHeader extends StatelessWidget {
  const MeProfileHeader({
    super.key,
    required this.user,
    this.onEdit,
    this.onShare,
  });

  final MeModel user;
  final VoidCallback? onEdit;
  final VoidCallback? onShare;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 97.h,
          width: double.infinity,
          child: Row(
            children: [
              ClipOval(
                child: Image.network(
                  user.profilePhoto,
                  width: 97.h,
                  height: 97.h,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(width: 12.w),

              // Matnlar
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Ism familiya
                    Text(
                      "${user.firstName} ${user.lastName}",
                      style: TextStyle(
                        color: AppColors.mainpink,
                        fontWeight: FontWeight.w500,
                        fontSize: 15.sp,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(height: 5.h),

                    // Username
                    Text(
                      "@${user.username}",
                      style: TextStyle(
                        color: AppColors.pink,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(height: 5.h),

                    // Description/presentation
                    Text(
                      user.presentation,
                      style: TextStyle(
                        color: AppColors.whiteText,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w400,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: 40.w,
              ),
              Align(
                alignment: Alignment.topRight,
                child: Row(
                  children: [
                    IconButton(
                      style: IconButton.styleFrom(
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,

                        backgroundColor: AppColors.pinkorig,
                        fixedSize: Size(28.w, 28.h),
                      ),

                      constraints: BoxConstraints.tight(Size.square(28)),
                      onPressed: () {},

                      icon: Icon(
                        size: 15,
                        Icons.add,
                        color: AppColors.pink,
                      ),
                      padding: EdgeInsets.zero,
                    ),
                    SizedBox(
                      width: 5.w,
                    ),
                    IconButton(
                      style: IconButton.styleFrom(
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,

                        backgroundColor: AppColors.pinkorig,
                        fixedSize: Size(28.w, 28.h),
                      ),

                      constraints: BoxConstraints.tight(Size.square(28)),
                      onPressed: () {},

                      icon: Icon(
                        size: 15,
                        Icons.menu,
                        color: AppColors.pink,
                      ),
                      padding: EdgeInsets.zero,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 12,
        ),
        Row(
          children: [
            RecipeTextButton(
              backgroundColor: AppColors.pinkorig,
              text: "Edit Profile",
              onPressed: () {},
              textColor: AppColors.pink,
              width: 170,
              height: 25.h,
              borderRadius: 30,
              fontSize: 15.sp,
            ),
            SizedBox(width: 6.w ,),
            RecipeTextButton(
              backgroundColor: AppColors.pinkorig,
              text: "Share Profile",
              onPressed: () {},
              textColor: AppColors.pink,
              width: 170.w,
              height: 23.h,
              borderRadius: 30,
              fontSize: 15.sp,
            ),


          ],
        ),
      ],
    );
  }
}
