import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:lesson2_10/core/router/router_name.dart';
import 'package:lesson2_10/features/categories/widgets/Navigators.dart';
import 'package:provider/provider.dart';
import '../../../core/utils/app_colors.dart';
import '../../appbars/recipi_appbar.dart';
import '../managers/recipi_lunch_view.dart';

class CategoryDetailsRecipe extends StatelessWidget {
  final int recipeId;
  final String title;
  final num rating;

  CategoryDetailsRecipe({
    super.key,
    required this.recipeId,
    required this.title,
    required this.rating,
  });

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => RecipeDetailViewModel()..fetchRecipeDetails(recipeId),
      child: Consumer<RecipeDetailViewModel>(
        builder: (context, vm, _) {
          if (vm.isLoading) {
            return Scaffold(body: Center(child: CircularProgressIndicator()));
          }

          final recipe = vm.recipeData;

          if (recipe == null) {
            return Scaffold(body: Center(child: Text("Xatolik yuz berdi")));
          }

          return Scaffold(
            extendBody: true,
            backgroundColor: AppColors.baige,
            appBar: RecipeAppBarMain(
              toolbarHeight: 55,
              title: title,
            ),
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
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.network(
                            recipe.image,
                            fit: BoxFit.cover,
                            width: double.infinity,
                            height: 281,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(
                                recipe.textname,
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 20,
                                  color: Colors.white,
                                ),
                              ),
                              Row(
                                children: [
                                  GestureDetector(
                                    child: Icon(
                                      Icons.star,
                                      color: Colors.white,
                                      size: 12,
                                    ),
                                    onTap: () {
                                      context.push(RouterName.review);
                                    },
                                  ),
                                  Text(
                                    "${recipe.textstar}",
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.white,
                                    ),
                                  ),
                                  SizedBox(width: 10),
                                  GestureDetector(
                                    child: Icon(
                                      Icons.comment,
                                      color: Colors.white,
                                      size: 12,
                                    ),
                                    onTap: (){
                                      context.push(RouterName.review);
                                    },
                                  ),
                                  Text(
                                    "${recipe.comments ?? 0}",
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
                        backgroundImage: NetworkImage(recipe.user.profilePhoto),
                      ),
                      SizedBox(width: 15),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            recipe.user.username,
                            style: TextStyle(fontSize: 12, color: Colors.white),
                          ),
                          Text(
                            recipe.user.firstname,
                            style: TextStyle(fontSize: 12, color: Colors.white),
                          ),
                        ],
                      ),
                      Spacer(),
                      Container(
                        width: 109,
                        padding: EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 6,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: AppColors.pink,
                        ),
                        child: Text(
                          'Following',
                          textAlign: TextAlign.center,
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
                        "${recipe.textminute} min",
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Text(
                    recipe.textdetail,
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
                    recipe.ingredients
                        .map((e) => "${e.amount} ${e.name}")
                        .join("\n"),
                    style: TextStyle(color: Colors.white),
                  ),
                  SizedBox(height: 31),
                  Text(
                    '6 Easy Step',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: AppColors.mainpink,
                    ),
                  ),
                  SizedBox(height: 11),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: recipe.instructions.map((e) {
                      return Container(
                        margin: EdgeInsets.only(bottom: 8),
                        padding: EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: AppColors.pink,
                          borderRadius: BorderRadius.circular(14),
                        ),
                        child: Text("${e.order}. ${e.text}"),
                      );
                    }).toList(),
                  ),
                ],
              ),
            ),
            bottomNavigationBar: Navigations(),
          );
        },
      ),
    );
  }
}
