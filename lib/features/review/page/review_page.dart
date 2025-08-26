import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lesson2_10/features/categories/widgets/Navigators.dart';
import 'package:lesson2_10/features/review/widgets/review_add_widget.dart';
import 'package:lesson2_10/features/review/widgets/review_comment_widget.dart';
import 'package:provider/provider.dart';

import '../../../core/utils/app_colors.dart';
import '../managers/review_comment_vmodel.dart';
import '../managers/rewiev_view_model.dart';


class ReviewPage extends StatelessWidget {
  const ReviewPage({super.key, required this.categoriyId});

  final int categoriyId;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ReviewsViewModel(categoryId: categoriyId, reviewRepo: context.read()),
      builder: (context, child) => Scaffold(
        extendBody: true,
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
            "Reviews",
            style: TextStyle(color: AppColors.mainpink,fontSize: 20.sp,fontWeight: FontWeight.w600),
          ),
          centerTitle: true,
        ),
        body: ChangeNotifierProvider(
          create: (context) => ReviewsCommentViewModel(categoryId: categoriyId, commentRepo: context.read()),
          builder: (context, child) => SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.only(top: 17.h, bottom: 126.h),
              child: Column(
                spacing: 27.75.h,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ReviewsAddWidget(),
                  ReviewsComments()
                ],
              ),
            ),
          ),
        ),
        bottomNavigationBar:Navigations()

        ),

    );}
}
