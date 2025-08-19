import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lesson2_10/features/trending_recipe/managers/trending_view_model.dart';
import 'package:lesson2_10/features/trending_recipe/widgets/most_view_widget.dart';
import 'package:provider/provider.dart';

import '../../../core/utils/app_colors.dart';
import '../../appbars/appbarcus_toms.dart';

class TrendingPage extends StatelessWidget {
  const TrendingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) =>
          MostViewedViewModel(apiClient: context.read(), detailRepo: context.read())..fetchMostViewed(),
      child: Scaffold(
        backgroundColor: AppColors.baige,
        appBar: AppbarcusToms(
          icon: 'assets/back.svg',
          title: "Trending Recipes",
          iconaction1: "assets/notification.svg",
          iconaction2: "assets/find.svg",
          background: Color(0xFFFFC6C9),
          foreground: AppColors.mainpink,
        ),
        body: Column(
          children: [
            Container(
              width: double.infinity,
              height: 242.h,
              decoration: BoxDecoration(
                color: AppColors.mainpink,
                borderRadius: BorderRadius.circular(20),
              ),

              child: Padding(
                padding: const EdgeInsets.only(left: 36.0,top: 9),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Most Viewed Today",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(height: 9,),
                    MostViewedWidget(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
