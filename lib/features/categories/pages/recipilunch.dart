import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../../../core/utils/app_colors.dart';
import '../../appbars/recipi_appbar.dart';
import '../managers/recipi_lunch_view.dart';

class CategoryDetailsRecipe extends StatelessWidget {
  final int recipeId;
  final String title;
  final num rating;

  const CategoryDetailsRecipe({
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
        builder: (context, viewModel, _) {
          if (viewModel.isLoading) {
            return  Scaffold(
              body: Center(child: CircularProgressIndicator()),
            );
          }

          final recipe = viewModel.recipeData;

          if (recipe == null) {
            return const Scaffold(
              body: Center(child: Text("Xatolik yuz berdi")),
            );
          }

          return Scaffold(
            appBar: RecipeAppBarMain(title: title),
            backgroundColor: AppColors.baige,
            body: SingleChildScrollView(
              padding:  EdgeInsets.symmetric(horizontal: 37),
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
                        if (recipe['photo'] != null)
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.network(
                              recipe['photo'],
                              fit: BoxFit.cover,
                              width: double.infinity,
                              height: 281,
                            ),
                          ),
                        Padding(
                          padding:  EdgeInsets.all(10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(
                                recipe['title'] ?? '',
                                style:  TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 20,
                                  color: Colors.white,
                                ),
                              ),
                              Row(
                                children: [
                                   Icon(Icons.star, color: Colors.white, size: 12),
                                  Text(
                                    "${recipe['stars'] ?? rating}",
                                    style:  TextStyle(fontSize: 12, color: Colors.white),
                                  ),
                                   SizedBox(width: 10),
                                   Icon(Icons.comment, color: Colors.white, size: 12),
                                  Text(
                                    "${recipe['comments'] ?? '0'}",
                                    style:  TextStyle(fontSize: 12, color: Colors.white),
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
                        backgroundImage: NetworkImage(recipe['user']['profilePhoto'] ?? ''),
                      ),
                       SizedBox(width: 15),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(recipe['user']['username'] ?? '', style: const TextStyle(fontSize: 12, color: Colors.white)),
                          Text(recipe['user']['firstname'] ?? '', style: const TextStyle(fontSize: 12, color: Colors.white)),
                        ],
                      ),
                       Spacer(),
                      Container(
                        width: 109,
                        padding:  EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: AppColors.pink,
                        ),
                        child:  Text(
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
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600, color: AppColors.mainpink),
                      ),
                       SizedBox(width: 15),
                      SvgPicture.asset("assets/clock.svg", color: Colors.white, width: 20),
                       SizedBox(width: 5),
                      Text("${recipe['timeRequired'] ?? '0'}min", style: const TextStyle(color: Colors.white)),
                    ],
                  ),

                   SizedBox(height: 10),
                  Text(recipe['description'] ?? '', style: const TextStyle(color: Colors.white)),

                   SizedBox(height: 31),

                   Text(
                    'Ingredients',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600, color: AppColors.mainpink),
                  ),
                   SizedBox(height: 21),
                  Text(
                    ((recipe['ingredients'] as List?) ?? [])
                        .map((e) => "${e['amount']} ${e['name']}")
                        .join("\n"),
                    style:  TextStyle(color: Colors.white),
                  ),

                   SizedBox(height: 31),

                   Text(
                    '6 Easy Step',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600, color: AppColors.mainpink),
                  ),
                   SizedBox(height: 11),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: ((recipe['instructions'] as List?) ?? []).asMap().entries.map((entry) {
                      final index = entry.key;
                      final e = entry.value;
                      return Container(
                        margin:  EdgeInsets.only(bottom: 8),
                        padding:  EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: AppColors.pink,
                          borderRadius: BorderRadius.circular(14),
                        ),
                        child: Text("${e['order']}. ${e['text'] ?? ''}"),
                      );
                    }).toList(),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
