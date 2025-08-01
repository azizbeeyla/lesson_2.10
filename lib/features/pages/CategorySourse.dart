import 'package:lesson2_10/utils/app_colors.dart';
import 'package:lesson2_10/features/widgets/appbarcus_toms.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:lesson2_10/main.dart';
import 'package:lesson2_10/features/widgets/recipeItem.dart';

import '../../CategoryItem.dart';

final dio = Dio(
  BaseOptions(
    baseUrl: "http://192.168.10.217:8888//api/v1",
    validateStatus: (status) => true,
  ),
);

Future<List> fetchCategories() async {
  var response = await dio.get("/admin/categories/list");
  if (response.statusCode != 200) {
    throw Exception(response.data);
  }
  return response.data;
}

class Categorysourse extends StatelessWidget {
  Categorysourse();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: fetchCategories(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Scaffold(body: Center(child: CircularProgressIndicator()));
        } else if (snapshot.hasError) {
          return Scaffold(
            body: Center(
              child: Text("Something went wrong: ${snapshot.error}"),
            ),
          );
        } else if (snapshot.hasData) {
          return Scaffold(
            backgroundColor: AppColors.baige,
            appBar: AppbarcusToms(
              icon: 'assets/back.svg',
              title: "Breakfast",
              iconaction1: "assets/notification.svg",
              iconaction2: "assets/find.svg",
              background: Color(0xFFFFC6C9),
              foreground: AppColors.mainpink,
            ),

            body: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisExtent: 171,
                mainAxisSpacing: 20,
              ),
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) => CategoryItem(
                id: snapshot.data![index]['id'],
                title: snapshot.data![index]['title'],
                image: snapshot.data![index]['image'],
              ),
            ),
          );
        } else {
          return Scaffold(
            body: Center(child: Text("Something went wrong... Again...")),
          );
        }
      },
    );
  }
}
