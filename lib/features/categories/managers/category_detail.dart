import 'package:flutter/material.dart';
import 'package:lesson2_10/data/models/categorymodels/detail_model.dart';
import '../../../core/clients/dio_cielent.dart';

class CategoryDetailViewModel extends ChangeNotifier {
  List<DetailModel> recipes = [];
  bool isLoading = false;
  String? error;

  Future<void> fetchRecipes(num categoryId) async {
    isLoading = true;
    error = null;
    notifyListeners();

    final response = await dio.get('/recipes/list?Category=$categoryId');

    if (response.statusCode == 200) {
      recipes = (response.data as List)
          .map((x) => DetailModel.fromJson(x))
          .toList();
    } else {
      error = 'Xatolik: ${response.data}';
    }

    isLoading = false;
    notifyListeners();
  }
}
