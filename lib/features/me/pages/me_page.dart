import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lesson2_10/features/categories/widgets/Navigators.dart';
import 'package:provider/provider.dart';
import '../../../core/utils/app_colors.dart';
import '../../your_recipes/managers/your_recipe_viewmodel.dart';
import '../../your_recipes/widgets/your_recipe_widget.dart';
import '../../../data/repositry/your_recipe_repositiry/your_repositriy.dart';
import '../managers/me_viewmodel.dart';
import '../widgets/me_follow.dart';
import '../widgets/me_profile.dart';


class MePage extends StatelessWidget {
  const MePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => MeViewModel(repository: context.read())..fetchMe(),
      builder: (context, child) {
        return Consumer<MeViewModel>(
          builder: (context, vm, child) {
            if (vm.loading) {
              return const Scaffold(
                extendBody: true,
                body: Center(child: CircularProgressIndicator()),
              );
            }

            if (vm.errorMessage != null) {
              return Scaffold(
                body: Center(
                  child: Text(
                    vm.errorMessage!,
                    style: const TextStyle(color: Colors.red),
                  ),
                ),
              );
            }

            final user = vm.me;
            if (user == null) {
              return const Scaffold(
                body: Center(child: Text("Foydalanuvchi ma'lumotlari yo‘q")),
              );
            }

            return Scaffold(
              backgroundColor: AppColors.baige,
              body: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.fromLTRB(37.w, 28.h, 37.w, 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 20.0),
                        child: MeProfileHeader(user: user),
                      ),

                      SizedBox(height: 13.h),

                      MeFollowInfo(user: user),

                      SizedBox(height: 12.h),

                      Text(
                        "My Recipes",
                        style: TextStyle(
                          color: AppColors.whiteText,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Divider(color: AppColors.mainpink),
                      SizedBox(height: 15.h),

                      ChangeNotifierProvider(
                        create: (context) => YourRecipeViewModel(
                          yourRecipesRepo:
                          context.read<YourRecipeRepository>(),
                        )..fetchRecipes(),
                        child:  YourRecipeWidget(),
                      ),
                    ],
                  ),
                ),
              ),

              bottomNavigationBar: Navigations(),
            );
          },
        );
      },
    );
  }
}
