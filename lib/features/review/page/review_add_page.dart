import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lesson2_10/features/categories/widgets/Navigators.dart';
import 'package:provider/provider.dart';

import '../../../core/utils/app_colors.dart';

import '../managers/review_add_viewmodel.dart';
import '../widgets/add_review_widget.dart';

class ReviewAddPage extends StatelessWidget {
  const ReviewAddPage({super.key, required this.categoriyId});

  final int categoriyId;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ReviewsAddViewModel(
        categoryId: categoriyId,
        reviewsAddRepo: context.read(),
      ),
      builder: (context, child) => Scaffold(
        backgroundColor: AppColors.baige,
        appBar: AppBar(
          backgroundColor: AppColors.baige,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: SvgPicture.asset('assets/back.svg'),
          ),
          title: Text(
            "Leave a Review",
            style: TextStyle(
              color: AppColors.mainpink,
              fontSize: 20.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
          centerTitle: true,
        ),
        body: Padding(
          padding: EdgeInsets.fromLTRB(37.w, 17.h, 37.w, 0),
          child: Column(
            spacing: 25.h,
            children: [
              Consumer<ReviewsAddViewModel>(
                builder: (context, vm, child) => SizedBox(
                  width: 356.w,
                  height: 262.h,
                  child: Stack(
                    children: [
                      Container(
                        width: 356.w,
                        height: 262.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.r),
                          color: AppColors.mainpink,
                        ),
                        padding: EdgeInsets.symmetric(
                          horizontal: 10.w,
                          vertical: 16.h,
                        ),
                        alignment: Alignment.bottomCenter,
                        child: Text(
                          vm.reviewadd!.title,
                          style: TextStyle(
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w600,
                            color: AppColors.whiteText,
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.topCenter,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10.r),
                          child: Image.network(
                            vm.reviewadd!.photo,
                            width: 356.w,
                            height: 206.h,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              AddReviews(),
            ],
          ),
        ),
        bottomNavigationBar:Navigations()
      ),
    );
  }
}
