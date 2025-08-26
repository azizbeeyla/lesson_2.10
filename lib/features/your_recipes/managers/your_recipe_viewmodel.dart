import 'package:flutter/material.dart';

import '../../../data/models/your_recipe_model/your_recipe.dart';
import '../../../data/repositry/your_recipe_repositiry/your_repositriy.dart';

class YourRecipeViewModel extends ChangeNotifier {
  final YourRecipeRepository _yourRecipesRepo;

  YourRecipeViewModel({required YourRecipeRepository yourRecipesRepo})
      : _yourRecipesRepo = yourRecipesRepo;

  // Data
  List<YourRecipeModel> yourRecipes = [];

  // Loading va error
  bool isYourRecipeLoad = false;
  String? yourReciperError;

  Future<void> fetchRecipes({int limit = 8}) async {
    isYourRecipeLoad = true;
    yourReciperError = null;
    notifyListeners();

    try {
      final result = await _yourRecipesRepo.fetchYourRecipes(limit: limit);

      result.fold(
            (err) {
          yourReciperError = err.toString();
        },
            (data) {
          yourRecipes = data;
        },
      );
    } catch (e) {
      yourReciperError = e.toString();
    }

    isYourRecipeLoad = false;
    notifyListeners();
  }
}
