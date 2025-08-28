import 'package:flutter/material.dart';

import '../../../data/models/your_recipe_model/your_recipe.dart';
import '../../../data/repositry/your_recipe_repositiry/your_repositriy.dart';

class YourRecipeViewModel extends ChangeNotifier {
  final YourRecipeRepository _yourRecipesRepo;

  YourRecipeViewModel({required YourRecipeRepository yourRecipesRepo})
      : _yourRecipesRepo = yourRecipesRepo;

  List<YourRecipeModel> yourRecipes = [];

  bool isYourRecipeLoad = false;
  String? yourRecipeError;

  Future<void> fetchRecipes() async {
    isYourRecipeLoad = true;
    yourRecipeError = null;
    notifyListeners();
    var result = await _yourRecipesRepo.getYourRecipes();
    result.fold(
          (e) {
        return yourRecipeError = e.toString();
      },
          (value) => yourRecipes = value,
    );

    isYourRecipeLoad = false;
    notifyListeners();
  }
}
