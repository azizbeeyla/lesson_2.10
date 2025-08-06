import 'package:flutter/material.dart';

import '../../../data/models/categorymodels/detail_model.dart';
import 'categories.dart';

class RecipeItem extends StatelessWidget {
  const RecipeItem({
    super.key,
    required this.recipe,
  });

  final DetailModel recipe;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 169,
        height: 226,
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
        CategoriesCard(image: recipe.image, textname: recipe.textname,
          textdetail: recipe.textdetail,
          textminute: recipe.textminute, textstar: recipe.textstar),

    ])));


  }
}