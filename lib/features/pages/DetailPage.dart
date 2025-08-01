import 'package:flutter/material.dart';
import 'package:lesson2_10/features/pages/recipilunch.dart';
import 'package:lesson2_10/features/widgets/Navigators.dart';
import 'package:lesson2_10/utils/app_colors.dart';

import '../appbars/recipi_appbar.dart';
import '../appbars/recipi_appbar_bottom.dart';
import 'CategorySourse.dart';
import '../widgets/recipeItem.dart';

Future<List> fetchRecipes({required num categoryId}) async {
  var response = await dio.get('/recipes/list?Category=$categoryId');
  if (response.statusCode != 200) {
    throw Exception("Ritseplarni olib kelishda xatolik: ${response.data}");
  }
  return response.data;
}

class CategoryDetailPagee extends StatelessWidget {
  const CategoryDetailPagee({
    super.key,
    required this.categoryId,
    required this.title,
  });
  final num categoryId;
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
            backgroundColor: AppColors.baige,
            extendBody: true,
            appBar: RecipeAppBarMain(

              toolbarHeight: 75,
              title: title,
              bottom: RecipeAppBarBottom(selectedIndex: categoryId),
            ),
            body: GridView.builder(
              padding: EdgeInsets.fromLTRB(37, 19, 37, 126),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 19,
                mainAxisSpacing: 30,
                mainAxisExtent: 226,
              ),
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) =>
                  GestureDetector(
                      onTap: (){
                        // print(snapshot.data?[index]['id']);
                        if(snapshot.data != null) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context)=> CategoryDetailsRecipe(recipeId: snapshot.data?[index]['id'],
                                title: title,
                                rating: num.tryParse(snapshot.data![index]['rating'].toString()) ?? 0,                              ),
                            ),
                          );
                        }
                      },
                      child: RecipeItem(recipe: snapshot.data![index])),
            ),
            bottomNavigationBar: Navigations(),
          );
        } else {
          return Scaffold(
              body: Center(child: Text("Something went horribly wrong...")));
        }
      },
    );
  }
}
