import 'package:flutter/material.dart';
import 'package:lesson2_10/data/repositry/trending_repostries.dart';
import 'package:lesson2_10/features/trending_recipe/widgets/trending_detail.dart';
import '../../../data/models/trending_models/most_viewed.dart';
import '../../../core/clients/dio_cielent.dart';
import '../../../data/models/trending_models/recipies_detail.dart';
import '../../../data/result.dart';

class MostViewedViewModel extends ChangeNotifier {
  final ApiClient apiClient;
  final TrendRecipesRepository _detailRepo;

  bool isLoading = false;
  bool isDetailLoad = false;
  String? detailError;
  List<TrendRecipesDetail> details = [];
  String? error;
  MostViewedModel? mostViewed;

  MostViewedViewModel({
    required this.apiClient,
    required TrendRecipesRepository detailRepo,
  }) : _detailRepo = detailRepo;

  Future<bool> fetchMostViewed() async {
    isLoading = true;
    error = null;
    bool success = false;
    notifyListeners();

    try {
      final result = await apiClient.get("/recipes/trending-recipe");

      result.fold(
        (err) {
          error = err.toString();
          success = false;
        },
        (data) {
          if (data is Map<String, dynamic>) {
            mostViewed = MostViewedModel.fromJson(data);
            success = true;
          } else {
            error = "Noto‘g‘ri format: Map emas";
            success = false;
          }
        },
      );
    } catch (e) {
      error = e.toString();
      success = false;
    }

    isLoading = false;
    notifyListeners();
    return success;
  }

  Future<void> fetchTrendRecipes({int limit = 3}) async {
    isLoading = true;
    detailError = null;
    notifyListeners();

    final result = await _detailRepo.getTrendRecipes(limit: limit);

    result.fold(
      (err) {
        detailError = err.toString();
      },
      (data) {
        details = data;
      },
    );

    isDetailLoad = false;
    notifyListeners();
  }
}
