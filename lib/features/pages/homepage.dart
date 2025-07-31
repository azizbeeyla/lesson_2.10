
import 'package:flutter/material.dart';

import '../widgets/recipeItem.dart';
import 'CategorySourse.dart';

Future<List> fetchRecipes({required int categoryId}) async {
  var response = await dio.get('/recipes/list?Category=$categoryId');
  if (response.statusCode != 200) {
    throw Exception("Ritseplarni olib kelishda xatolik: ${response.data}");
  }
  return response.data;
}

class CategoryDetailPage extends StatelessWidget {
  const CategoryDetailPage({
    super.key,
    required this.categoryId,
    required this.title,
  });

  final int categoryId;
  final String title;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: fetchRecipes(categoryId: categoryId),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Scaffold(body: Center(child: CircularProgressIndicator()));
        } else if (snapshot.hasError) {
          return Scaffold(body: Center(child: Text(snapshot.error.toString())));
        } else if (snapshot.hasData) {
          return Scaffold(
            extendBody: true,



            body: GridView.builder(
              padding: EdgeInsets.fromLTRB(37, 19, 37, 126),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 19,
                mainAxisSpacing: 30,
                mainAxisExtent: 226,
              ),
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) =>  RecipeItem(recipe: snapshot.data![index],),
            ),
            bottomNavigationBar: Navigator(),
          );
        } else {
          return Scaffold(body: Center(child: Text("Something went horribly wrong...")));
        }
      },
    );
  }
}