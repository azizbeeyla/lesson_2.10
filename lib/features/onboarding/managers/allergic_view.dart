import 'package:flutter/material.dart';
import 'package:lesson2_10/core/clients/dio_cielent.dart';
import 'package:lesson2_10/data/models/onboardingmodels/cuisines_alergicmodel.dart';

class AllergicView extends ChangeNotifier {
  AllergicView() {
    getallergic();
  }
  List<AllercigModel> allergic = [];
  bool isLoading = false;

  Future<void> getallergic() async {
    isLoading = true;

    notifyListeners();

    var response = await dio.get("/allergic/list");
    allergic = (response.data as List)
        .map((x) => AllercigModel.fromJson(x))
        .toList();
    isLoading=false;
    notifyListeners();
  }
}
