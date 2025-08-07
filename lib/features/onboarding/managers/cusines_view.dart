import 'package:flutter/material.dart';

import 'package:lesson2_10/core/clients/dio_cielent.dart';
import 'package:lesson2_10/data/models/onboardingmodels/cusines_model.dart';


class CusinessView extends ChangeNotifier {
  CusinessView(){

    getcusines();
  }



  List<CusinesModel> cuisines=[];
  bool isloading=false;
  void getcusines() async{

    isloading=true;
    notifyListeners();

    var response =await dio.get("/cuisines/list");
    cuisines=(response.data as List).map((x)=>CusinesModel.fromJson(x)).toList() ;
    isloading=false;
    notifyListeners();

  }
}

