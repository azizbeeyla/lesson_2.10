
import 'package:flutter/material.dart';
import 'package:lesson2_10/data/models/categorymodels/detail_model.dart';
import '../../../core/clients/dio_cielent.dart';

class RecipeDetailViewModel extends ChangeNotifier {
  bool isLoading = true;
  DetailModel? recipeData;   String? error;

  Future<void> fetchRecipeDetails(int recipeId) async {
    isLoading = true;
    error = null;
    notifyListeners();

    final response = await dio.get('/recipes/detail/$recipeId');

    if (response.statusCode == 200) {
      recipeData =DetailModel.fromJson(response.data);
    } else {
      error = "Xatolik: ${response.statusCode}";
    }

    isLoading = false;
    notifyListeners();
  }
}
