import 'package:flutter/cupertino.dart';

import '../../../core/clients/dio_cielent.dart';
import '../../../data/models/onboardingmodels/onboarding_model.dart';

class OnBoardingViewModel extends ChangeNotifier{

OnBoardingViewModel(int id){
  getImage(id);


}
  OnboardingModel? images;
  bool isLoading = false;
Future<void> getImage(int id) async{

  isLoading=true;
  notifyListeners();
  try {
    final response = await dio.get("/onboarding/list");
    final list = (response.data as List)
        .map((e) => OnboardingModel.fromJson(e))
        .toList();

    images = list.firstWhere((item) => item.id == id);
  } catch (e) {
    print("Error: $e");
  }

  isLoading = false;
  notifyListeners();
}

}