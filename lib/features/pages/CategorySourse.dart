import 'package:lesson2_10/utils/app_colors.dart';
import 'package:lesson2_10/features/widgets/appbarcus_toms.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:lesson2_10/features/widgets/Appbarcustom.dart';
import 'package:lesson2_10/main.dart';
import 'package:lesson2_10/features/widgets/recipeItem.dart';

import 'homepage.dart';

final dio = Dio(
  BaseOptions(
    baseUrl: "http://192.168.10.217:8888//api/v1",
    validateStatus: (status) => true,
  ),
);

Future<List> fetchCategories() async {
  var response = await dio.get("/categories/list");
  if (response.statusCode != 200) {
    throw Exception(response.data);
  }
  return response.data;
}

class Categorysourse extends StatelessWidget {
  final int id;

  final String title;

  const Categorysourse({super.key, required this.id, required this.title});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: fetchCategories(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Scaffold(body: Center(child: CircularProgressIndicator()));
        } else if (snapshot.hasError) {
          return Scaffold(body: Center(
              child: Text("Something went wrong: ${snapshot.error}")));
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
                  mainAxisSpacing: 20
              ),
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) =>
                  Column(

                    children: [
                      ClipRRect(
                        borderRadius: BorderRadiusGeometry.circular(13),
                        child: GestureDetector(
                          onTap: () {
                            Navigator
                                .of(context)
                                .push(MaterialPageRoute(builder: (context) =>
                                CategoryDetailPage(
                                    categoryId: id, title: title)));
                            },
                          child: Image.network(
                            snapshot.data![index]["image"],
                            width: 159,
                            height: 145,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Text(
                          style: TextStyle(color: Colors.white),

                          snapshot.data![index]["title"]),
                    ],
                  ),
            ),

          );
        } else {
          return Scaffold(
              body: Center(child: Text(
                  "Something went wrong... Again...")));
        }
      },
    );
  }
}
