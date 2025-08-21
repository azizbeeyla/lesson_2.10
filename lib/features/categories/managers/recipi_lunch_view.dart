import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:lesson2_10/data/models/categorymodels/detail_model.dart';
import '../../../core/clients/dio_cielent.dart';

class RecipeDetailViewModel extends ChangeNotifier {
  final ApiClient _apiClient;

  bool isLoading = true;
  DetailModel? recipeData;
  String? error;

  RecipeDetailViewModel({required ApiClient apiClient}) : _apiClient = apiClient;

  Future<void> fetchRecipeDetails(int recipeId) async {
    isLoading = true;
    error = null;
    notifyListeners();

    final result = await _apiClient.get<dynamic>(
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
