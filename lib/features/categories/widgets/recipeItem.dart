import 'package:flutter/material.dart';

import 'categories.dart';

class RecipeItem extends StatelessWidget {
  const RecipeItem({
    super.key,
    required this.recipe,
  });

  final Map<String, dynamic> recipe;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 169,
        height: 226,
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
        CategoriesCard(image: recipe['photo'], textname: recipe["title"],
          textdetail: recipe['description'],
          textminute: recipe['timeRequired'], textstar: recipe['rating']),

    ])));


  }
}