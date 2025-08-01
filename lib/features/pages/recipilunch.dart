import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../utils/app_colors.dart';
import '../appbars/recipi_appbar.dart';
import 'CategorySourse.dart';
class CategoryDetailsRecipe extends StatefulWidget {
  final int recipeId;
  final String title;
  final num rating;
  // final num reviewsCount;


  const CategoryDetailsRecipe({
    super.key,
    required this.recipeId,
    required this.title,
    required this.rating,
    // required this.reviewsCount,
  });

  @override
  State<CategoryDetailsRecipe> createState() => _CategoryDetailsRecipeState();
}

class _CategoryDetailsRecipeState extends State<CategoryDetailsRecipe> {
  Map<String, dynamic>? recipeData;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchRecipeDetails();
  }

  Future<void> fetchRecipeDetails() async {
    final response = await dio.get('/recipes/detail/${widget.recipeId}');




    if (response.statusCode == 200) {
      recipeData = response.data as Map<String, dynamic>;
      setState(() {
        isLoading = false;
      });
    } else {
      throw Exception("Xatolik: ${response.statusCode}");
    }
  }
  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return Scaffold(body: Center(child: CircularProgressIndicator()));
    }
    return Scaffold(
      appBar: RecipeAppBarMain(title: widget.title),
      backgroundColor: AppColors.baige,
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 37),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 50),
            Container(
              height: 337,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: AppColors.mainpink,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  recipeData!['photo'] != null
                      ? ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(
                      recipeData!['photo'],
                      fit: BoxFit.cover,
                      width: double.infinity,
                      height: 281,
                    ),
                  )
                      : SizedBox(),

                  Padding(
                    padding: EdgeInsets.all(10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          recipeData!['title'] ?? '',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 20,
                            color: Colors.white,
                          ),
                        ),
                        Row(
                          children: [
                            Icon(Icons.star, color: Colors.white, size: 12),
                            Text(
                              "${recipeData!['stars'] ?? widget.rating}",
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(width: 10),
                            Icon(Icons.comment, color: Colors.white, size: 12),
                            Text(
                              "${recipeData!['comments'] ?? '0'}",
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 26),
            Row(
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundImage: NetworkImage(recipeData!['user']['profilePhoto'] ?? ''),
                ),
                SizedBox(width: 15),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      recipeData!['user']['username'] ?? '',
                      style: TextStyle(fontSize: 12, color: Colors.white),
                    ),
                    Text(
                      recipeData!['user']['firstname'] ?? '',
                      style: TextStyle(fontSize: 12, color: Colors.white),
                    ),
                  ],
                ),
                Spacer(),
                Container(
                  width: 109,
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: AppColors.pink,
                  ),
                  child: Text(
                    textAlign: TextAlign.center,
                    'Following',
                    style: TextStyle(fontSize: 12, color: Colors.red),
                  ),
                ),
                SizedBox(width: 9),
                Icon(Icons.more_vert, color: Colors.white),
              ],
            ),
            SizedBox(height: 20),
            Divider(color: Colors.white),
            SizedBox(height: 31),
            Row(
              children: [
                Text(
                  'Details',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: AppColors.mainpink,
                  ),
                ),
                SizedBox(width: 15),
                SvgPicture.asset(
                  "assets/clock.svg",
                  color: Colors.white,
                  width: 20,
                ),
                SizedBox(width: 5),
                Text(
                  "${recipeData!['timeRequired'] ?? '0'}min",
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
            SizedBox(height: 10),
            Text(
              recipeData!['description'] ?? '',
              style: TextStyle(color: Colors.white),
            ),
            SizedBox(height: 31),
            Text(
              'Ingredients',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: AppColors.mainpink,
              ),
            ),
            SizedBox(height: 21),
            Text(
              ((recipeData?['ingredients'] as List?) ?? [])
                  .map((e) => "${e['amount']} ${e['name']}")
                  .join("\n"),
              style: const TextStyle(color: Colors.white),
            ),
            SizedBox(height: 31,),
            Text(
              '6 Easy Step',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: AppColors.mainpink,
              ),
            ),
            SizedBox(height:11),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: ((recipeData?['instructions'] as List?) ?? [])
                  .asMap()
                  .entries
                  .map((entry) {
                final index = entry.key;
                final e = entry.value;
                return Container(
                  margin: const EdgeInsets.only(bottom: 8),
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: index.isEven?  AppColors.pink : AppColors.pink,
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: Text(
                    "${e['order']}. ${e['text'] ?? ''}",
                  ),
                );
              })
                  .toList(),
            )
          ],
        ),
      ),
    );
  }
}


