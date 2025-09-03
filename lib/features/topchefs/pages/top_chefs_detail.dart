import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lesson2_10/core/utils/app_colors.dart';
import 'package:lesson2_10/features/categories/managers/category_view.dart';
import 'package:lesson2_10/features/categories/widgets/Navigators.dart';
import 'package:lesson2_10/features/topchefs/managers/top_chefs_detail_viewmodel.dart';
import 'package:lesson2_10/features/topchefs/widgets/report_bottomsheet.dart';
import 'package:lesson2_10/features/topchefs/widgets/share_bottom_sheet.dart';
import 'package:provider/provider.dart';

import '../../../data/repositry/your_recipe_repositiry/your_repositriy.dart';
import '../../common/widgets/appbarcus_toms.dart';
import '../../your_recipes/managers/your_recipe_viewmodel.dart';
import '../../your_recipes/widgets/your_recipe_widget.dart';
import '../widgets/top_chef_follow.dart';
import '../widgets/top_chef_profile.dart';

class TopChefsDetail extends StatelessWidget {
  final int id;

  const TopChefsDetail({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) =>
          TopChefDetailViewModel(repository: context.read(), id: id),
      builder: (context, child) => Consumer<TopChefDetailViewModel>(
        builder: (context, vm, child) => vm.loading
            ? Scaffold(
                body: Center(
                  child: CircularProgressIndicator(),
                ),
              )
            : Scaffold(
          extendBody: true,
                backgroundColor: AppColors.baige,
                appBar: AppbarcusToms(
                  icon: 'assets/back.svg',
            
                  title: "@${vm.chefDetail?.username}",
                  iconaction1: "assets/share.svg",
                  iconaction2: "assets/more.svg",
                  background: Color(0xFFFFC6C9),
                  foreground: AppColors.mainpink,
                  onAction2Pressed: () {
                    final vm = context.read<TopChefDetailViewModel>();
                    showModalBottomSheet(
                      context: context,
                      builder: (_) {
                        return ChangeNotifierProvider.value(
                          value: vm,
                          child: const ReportBottomSheet(),
                        );
                      },
                    );
                  },

                  onAction1Pressed: () {
                    final vm = context.read<TopChefDetailViewModel>();
                    showModalBottomSheet(
                      context: context,
                      builder: (_) {
                        return ChangeNotifierProvider.value(
                          value: vm,
                          child: const ShareBottomSheet(),
                        );
                      },
                    );
                  },
                ),
                body: ChangeNotifierProvider(
                  create: (context) => CategoryView(repository: context.read()),
                  builder: (context, child) => SingleChildScrollView(
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.fromLTRB(37.w, 28.h, 37.w, 0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              TopChefProfil(
                                vm: vm.chefDetail!,
                              ),
                              SizedBox(height: 13.h,),
                              TopChefFollow(
                                vm: vm.chefDetail!,
                              ),
                              SizedBox(height: 12.h,),
                              Text(
                                "Recipes",
                                style: TextStyle(
                                  color: AppColors.whiteText,
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              Divider(
                                color: AppColors.mainpink,
                              ),
                              SizedBox(height: 15.h,),
                          ChangeNotifierProvider(
                            create: (context) => YourRecipeViewModel(
                              yourRecipesRepo: context.read<YourRecipeRepository>(),
                            )..fetchRecipes(),
                            child:
                              YourRecipeWidget()
                          )  ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
          bottomNavigationBar: Navigations(),
              ),
      ),
    );
  }
}
