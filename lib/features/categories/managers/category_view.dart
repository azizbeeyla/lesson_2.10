import 'package:flutter/material.dart';

import '../../../core/clients/dio_cielent.dart';
import '../../../data/models/categorymodels/sourse_model.dart';

class CategoryView extends ChangeNotifier {
  final ApiClient _apiClient;
  bool _disposed = false;

  CategoryView({required ApiClient apiClient}) : _apiClient = apiClient {
    getCategory();
  }

  List<SourseModel> categories = [];
  bool isLoading = false;
  String? error;

  Future<void> getCategory() async {
    isLoading = true;
    error = null;
    notifyListeners();
print("Sorovdan oldin");
    final result = await _apiClient.get<dynamic>("/admin/categories/list");

    result.fold(
          (e) {
            print("Xatolik $e");
        error = "Xatolik: $e";
      },
          (data) {
            print("Success $data");
        try {
          categories = (data as List)
              .map((x) => SourseModel.fromJson(x))
              .toList();
        } catch (e) {
          error = "Parse qilishda xato: $e";
        }
      },
    );

    isLoading = false;
    if (!_disposed) notifyListeners();
  }

  @override
  void dispose() {
    _disposed = true;
    super.dispose();
  }
}
