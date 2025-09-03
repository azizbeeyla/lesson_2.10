import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:lesson2_10/features/categories/widgets/Navigators.dart';
import 'package:lesson2_10/features/common/widgets/appbarcus_toms.dart';
import 'package:lesson2_10/features/your_recipes/managers/your_recipe_viewmodel.dart';
import 'package:lesson2_10/features/your_recipes/widgets/your_recipe_widget.dart';
import 'package:provider/provider.dart';

import '../../../core/utils/app_colors.dart';

class YourRecipePage extends StatelessWidget {
  const YourRecipePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => YourRecipeViewModel(yourRecipesRepo: context.read()),
      builder: (context, child) => Scaffold(
        backgroundColor: AppColors.baige,
        extendBody: true,
        appBar: AppbarcusToms(
          icon: 'assets/back.svg',
          title: "Your Recipes",
          iconaction1: "assets/notification.svg",
          iconaction2: "assets/find.svg",
          background: AppColors.pinkorig,
          foreground: AppColors.mainpink,
        ),
        body: Consumer<YourRecipeViewModel>(
          builder: (context, vm, child) {
            if (vm.isYourRecipeLoad)
              return Center(child: CircularProgressIndicator());
            if (vm.yourRecipeError != null)
              Center(child: Text(vm.yourRecipeError.toString()));
            return Padding(
              padding: const EdgeInsets.only(top: 28.0),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      width: 430.w,
                      height: 258.h,
                      decoration: BoxDecoration(
                        color: AppColors.mainpink,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      padding: EdgeInsets.symmetric(
                        horizontal: 38.w,
                        vertical: 14.h,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Most Viewed Today",
                            style: TextStyle(
                              color: AppColors.whiteText,
                              fontSize: 15.sp,
                            ),
                          ),
                          SizedBox(
                            height: 8.h,
                          ),
                          YourRecipeWidget(
                            itemLimit: 2,
                          ),
                        ],
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 37.0),
                      child: YourRecipeWidget(),
                    ),
                  ],
                ),
              ),
            );
          },

        ),
        bottomNavigationBar: Navigations(),
      ),
    );
  }
}
