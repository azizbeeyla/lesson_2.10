import 'package:flutter/material.dart';
import 'package:lesson2_10/data/models/categorymodels/detail_model.dart';
import '../../../core/clients/dio_cielent.dart';

class RecipeDetailViewModel extends ChangeNotifier {
  final ApiClient apiClient = ApiClient();

  bool isLoading = true;
  DetailModel? recipeData;
  String? error;

  Future<void> fetchRecipeDetails(int recipeId) async {
    isLoading = true;
    error = null;
    notifyListeners();

    final result = await apiClient.get<dynamic>(
      '/recipes/detail/$recipeId',
    );

    result.fold(
          (e) {
        error = 'Xatolik: $e';
      },
          (data) {
        try {
          recipeData = DetailModel.fromJson(data);
        } catch (e) {
          error = "Ma'lumotlarni parse qilishda xato: $e";
        }
      },
    );

    isLoading = false;
    notifyListeners();
  }
}
