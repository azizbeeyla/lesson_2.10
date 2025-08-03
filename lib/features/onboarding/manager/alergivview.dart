import 'package:flutter/material.dart';

import 'package:lesson2_10/core/clients/dio_cielent.dart';


class AllergicView extends ChangeNotifier {
  AllergicView(){

    getalergic();
  }



  List allergics=[];
  bool isloading=false;
  void getalergic() async{

    isloading=true;
    notifyListeners();

    var response =await dio.get("/allergic/list");
    allergics=response.data;
    isloading=false;
    notifyListeners();

  }
}

