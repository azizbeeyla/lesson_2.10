import 'package:flutter/material.dart';
import 'package:lesson2_10/data/models/categorymodels/sourse_model.dart';
import 'package:lesson2_10/data/result.dart';

import '../../../core/clients/dio_cielent.dart';

class CategoryView extends ChangeNotifier {
  final ApiClient apiClient = ApiClient();

  CategoryView() {
    getCategory();
  }

  List<SourseModel> categories = [];
  bool isLoading = false;
  String? error;

  Future<void> getCategory() async {
    isLoading = true;
    error = null;
    notifyListeners();

    final result = await apiClient.get<dynamic>(
      "/admin/categories/list",
    );

    result.fold(
          (e) {
        error = "Xatolik: $e";
      },
          (data) {
        try {
          categories = (data as List)
              .map((x) => SourseModel.fromJson(x))
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
