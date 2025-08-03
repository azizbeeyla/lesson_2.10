import 'package:flutter/material.dart';

import 'package:lesson2_10/core/clients/dio_cielent.dart';


class CusinessView extends ChangeNotifier {
  CusinessView(){

    getcusines();
  }



  List cuisines=[];
  bool isloading=false;
  void getcusines() async{

    isloading=true;
    notifyListeners();

    var response =await dio.get("/cuisines/list");
    cuisines=response.data;
    isloading=false;
    notifyListeners();

}
  }

