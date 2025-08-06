// lib/features/categories/pages/category_detail_page.dart

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../core/utils/app_colors.dart';
import '../../appbars/recipi_appbar.dart';
import '../../appbars/recipi_appbar_bottom.dart';
import '../managers/category_detail.dart';
import '../widgets/recipeItem.dart';
import '../widgets/Navigators.dart';
import '../pages/recipilunch.dart';

class CategoryDetailPagee extends StatelessWidget {
  const CategoryDetailPagee({
    super.key,
    required this.categoryId,
    required this.title,
  });

  final num categoryId;
  final String title;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<CategoryDetailViewModel>(
      create: (_) => CategoryDetailViewModel()..fetchRecipes(categoryId),
      child: ScaffoldBuilder(title: title, categoryId: categoryId),
    );
  }
}

class ScaffoldBuilder extends StatelessWidget {
  final num categoryId;
  final String title;

  const ScaffoldBuilder({
    super.key,
    required this.categoryId,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<CategoryDetailViewModel>();

    if (viewModel.isLoading) {
      return Scaffold(body: Center(child: CircularProgressIndicator()));
    }

    if (viewModel.error != null) {
      return Scaffold(body: Center(child: Text(viewModel.error!)));
    }

    return Scaffold(
      backgroundColor: AppColors.baige,
      extendBody: true,
      appBar: RecipeAppBarMain(
        toolbarHeight: 75,
        title: title,
        bottom: RecipeAppBarBottom(selectedIndex: categoryId),
      ),
      body: GridView.builder(
        padding: const EdgeInsets.fromLTRB(37, 19, 37, 126),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 19,
          mainAxisSpacing: 30,
          mainAxisExtent: 226,
        ),
        itemCount: viewModel.recipes.length,
        itemBuilder: (context, index) {
          final recipe = viewModel.recipes[index];
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CategoryDetailsRecipe(
                    recipeId: recipe['id'],
                    title: title,
                    rating:
                    num.tryParse(recipe['rating'].toString()) ?? 0,
                  ),
                ),
              );
            },
            child: RecipeItem(recipe: recipe),
          );
        },
      ),
      bottomNavigationBar: Navigations(),
    );
  }
}
