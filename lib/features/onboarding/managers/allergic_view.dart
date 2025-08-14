import 'package:flutter/material.dart';
import 'package:lesson2_10/data/models/onboardingmodels/cuisines_alergicmodel.dart';

import '../../../core/clients/dio_cielent.dart';

class AllergicView extends ChangeNotifier {
  final ApiClient apiClient = ApiClient();

  AllergicView() {
    getAllergic();
  }

  List<AllercigModel> allergic = [];
  bool isLoading = false;
  String? error;

  Future<void> getAllergic() async {
    isLoading = true;
    error = null;
    notifyListeners();

    final result = await apiClient.get<dynamic>(
      "/allergic/list",
    );

    result.fold(
          (e) {
        error = "Xatolik: $e";
      },
          (data) {
        try {
          allergic = (data as List)
              .map((x) => AllercigModel.fromJson(x))
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
