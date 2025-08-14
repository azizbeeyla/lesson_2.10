import 'package:flutter/material.dart';
import 'package:lesson2_10/data/models/categorymodels/detail_model.dart';
import '../../../core/clients/dio_cielent.dart';
import '../../../data/result.dart'; // Result joylashgan fayl

class CategoryDetailViewModel extends ChangeNotifier {
  final ApiClient apiClient = ApiClient();

  List<DetailModel> recipes = [];
  bool isLoading = false;
  String? error;

  Future<void> fetchRecipes(num categoryId) async {
    isLoading = true;
    error = null;
    notifyListeners();

    final result = await apiClient.get<dynamic>(
      '/recipes/list',
      queryParams: {"Category": categoryId},
    );

    result.fold(
          (e) {
        error = 'Xatolik: $e';
      },
          (data) {
        try {
          recipes = (data as List)
              .map((x) => DetailModel.fromJson(x))
              .toList();
        } catch (e) {
          error = "Ma'lumotlarni parse qilishda xato: $e";
        }
      },
    );

    isLoading = false;
    notifyListeners();
  }
}
