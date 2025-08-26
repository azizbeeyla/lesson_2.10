import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lesson2_10/features/your_recipes/managers/your_recipe_viewmodel.dart';
import 'package:lesson2_10/features/your_recipes/widgets/recipe_card.dart';
import 'package:provider/provider.dart';

import '../../../core/utils/app_colors.dart';

class YourRecipeWidget extends StatefulWidget {
  const YourRecipeWidget({
    super.key,
  });

  @override
  State<YourRecipeWidget> createState() => _YourRecipeWidgetState();
}

class _YourRecipeWidgetState extends State<YourRecipeWidget> {
  @override
  Widget build(BuildContext context) {
    return Consumer<YourRecipeViewModel>(
      builder: (context, vm, child) => Column(
        children: [
          if (vm.isYourRecipeLoad) Center(child: CircularProgressIndicator()),

          if (vm.yourReciperError != null && vm.yourReciperError!.isNotEmpty)
            Center(
              child: Text(
                vm.yourReciperError!,
                style: const TextStyle(color: Colors.red, fontSize: 16),
              ),
            ),

          if (!vm.isYourRecipeLoad &&
              (vm.yourReciperError == null || vm.yourReciperError!.isEmpty))
            Center(
              child: GridView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: vm.yourRecipes.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,

                  childAspectRatio: 168.w / 195.h,
                  crossAxisSpacing: 15,
                ),

                itemBuilder: (context, index) {
                  return RecipeCard(
                    id: vm.yourRecipes[index].id,
                    recipeId: vm.yourRecipes[index].categoryId,
                    photo: vm.yourRecipes[index].photo,
                    title: vm.yourRecipes[index].title,
                    rating: vm.yourRecipes[index].rating,
                    timerequired: vm.yourRecipes[index].timerequired,
                  );
                },
              ),
            ),
        ],
      ),
    );
  }
}
