import 'package:flutter/material.dart';

import 'package:lesson2_10/core/clients/dio_cielent.dart';


class AllergicView extends ChangeNotifier {
  AllergicView(){

    getalergic();
  }



  List cuisines=[];
  bool isloading=false;
  void getalergic() async{

    isloading=true;
    notifyListeners();

    var response =await dio.get("/allergic/list");
    cuisines=response.data;
    isloading=false;
    notifyListeners();

  }
}

