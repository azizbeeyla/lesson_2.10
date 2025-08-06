import 'package:flutter/material.dart';
import '../../../core/clients/dio_cielent.dart';

class CategoryDetailViewModel extends ChangeNotifier {
  List<dynamic> recipes = [];
  bool isLoading = false;
  String? error;

  Future<void> fetchRecipes(num categoryId) async {
    isLoading = true;
    error = null;
    notifyListeners();

    final response = await dio.get('/recipes/list?Category=$categoryId');

    if (response.statusCode == 200) {
      recipes = response.data;
    } else {
      error = 'Xatolik: ${response.data}';
    }

    isLoading = false;
    notifyListeners();
  }
}
