import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:lesson2_10/data/models/onboardingmodels/cusines_model.dart';

import '../../../core/clients/dio_cielent.dart';

class CusinessView extends ChangeNotifier {
  final ApiClient apiClient = ApiClient();

  CusinessView() {
    getCuisines();
  }

  List<CusinesModel> cuisines = [];
  bool isLoading = false;
  String? error;

  Future<void> getCuisines() async {
    isLoading = true;
    error = null;
    notifyListeners();

    final result = await apiClient.get<dynamic>(
      "/cuisines/list",
    );

    result.fold(
          (e) {
        error = "Xatolik: $e";
      },
          (data) {
        try {
          cuisines = (data as List)
              .map((x) => CusinesModel.fromJson(x))
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
