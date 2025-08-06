import 'package:flutter/material.dart';

import 'package:lesson2_10/core/clients/dio_cielent.dart';

import '../../../data/models/categorymodels/sourse_model.dart';

class CategoryView extends ChangeNotifier {
  CategoryView() {
    getcategory();
  }

  List<SourseModel> categoies = [];
  bool isloading = false;

  void getcategory() async {
    isloading = true;
    notifyListeners();

    var response = await dio.get("/admin/categories/list");
    categoies = (response.data as List)
        .map((x) => SourseModel.fromJson(x))
        .toList();
    isloading = false;
    notifyListeners();
  }
}
