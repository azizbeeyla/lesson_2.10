import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lesson2_10/features/your_recipes/widgets/recipe_card.dart';
import 'package:provider/provider.dart';

import '../managers/your_recipe_viewmodel.dart';

class YourRecipeWidget extends StatefulWidget {
  final int? itemLimit;

  const YourRecipeWidget({
    super.key,
    this.itemLimit,
  });

  @override
  State<YourRecipeWidget> createState() => _YourRecipeWidgetState();
}

class _YourRecipeWidgetState extends State<YourRecipeWidget> {
  @override
  Widget build(BuildContext context) {
    return Consumer<YourRecipeViewModel>(
      builder: (context, vm, child) {
        final recipes = widget.itemLimit != null
            ? vm.yourRecipes.take(widget.itemLimit!).toList()
            : vm.yourRecipes;

        return Column(
          children: [
            if (vm.isYourRecipeLoad)
              const Center(child: CircularProgressIndicator()),

            if (vm.yourRecipeError != null && vm.yourRecipeError!.isNotEmpty)
              Center(
                child: Text(
                  vm.yourRecipeError!,
                  style:  TextStyle(color: Colors.red, fontSize: 14.sp),
                ),
              ),

            if (!vm.isYourRecipeLoad &&
                (vm.yourRecipeError == null || vm.yourRecipeError!.isEmpty))
              GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: recipes.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 168.w / 195.h,
                  crossAxisSpacing: 15,
                ),
                itemBuilder: (context, index) {
                  final recipe = recipes[index];
                  return RecipeCard(
                    id: recipe.id,
                    recipeId: recipe.categoryId,
                    photo: recipe.photo,
                    title: recipe.title,
                    rating: recipe.rating,
                    timerequired: recipe.timerequired,
                  );
                },
              ),
          ],
        );
      },
    );
  }
}
