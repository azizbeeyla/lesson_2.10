
import 'package:flutter/material.dart';

import 'package:lesson2_10/core/clients/dio_cielent.dart';


class CategoryView extends ChangeNotifier {
  CategoryView() {
    getcategory();
  }


  List categoies = [];
  bool isloading = false;

  void getcategory() async {
    isloading = true;
    notifyListeners();

    var response = await dio.get("/admin/categories/list");
    categoies = response.data;
    isloading = false;
    notifyListeners();
  }
}