import 'package:flutter/cupertino.dart';
import '../../../core/clients/dio_cielent.dart';
import '../../../data/models/onboardingmodels/onboarding_model.dart';
import '../../../data/result.dart';

class OnBoardingViewModel extends ChangeNotifier {
  final ApiClient apiClient = ApiClient();

  OnBoardingViewModel(int id) {
    getImage(id);
  }

  OnboardingModel? images;
  bool isLoading = false;
  String? error;

  Future<void> getImage(int id) async {
    isLoading = true;
    error = null;
    notifyListeners();

    final result = await apiClient.get<dynamic>(
      "/onboarding/list",
    );

    result.fold(
          (e) {
        error = "Xatolik: $e";
      },
          (data) {
        try {
          final list = (data as List)
              .map((x) => OnboardingModel.fromJson(x))
              .toList();

          images = list.firstWhere((item) => item.id == id);
        } catch (e) {
          error = "Ma'lumotlarni parse qilishda xato: $e";
        }
      },
    );

    isLoading = false;
    notifyListeners();
  }
}
