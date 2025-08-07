import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:lesson2_10/core/router/router_name.dart';
import 'package:lesson2_10/features/categories/pages/CategorySourse.dart';
import 'package:lesson2_10/features/categories/pages/DetailPage.dart';
import 'package:lesson2_10/features/onboarding/pages/cuisines_alergic.dart';
import 'package:lesson2_10/features/onboarding/pages/cusiness_page.dart';
import 'package:lesson2_10/features/onboarding/pages/levels_page.dart';

import '../../features/categories/pages/recipilunch.dart';

class RouterClass {
  final GoRouter router = GoRouter(
    initialLocation: RouterName.levels,
    routes: [
      GoRoute(
        path: RouterName.categorysourse,
        builder: (context, state) => Categorysourse(),
      ),

      GoRoute(
        path: RouterName.categorydetail,
        name: "categoryDetail",
        builder: (BuildContext context, GoRouterState state) {
          final id = num.parse(state.pathParameters['id']!);
          final title = Uri.decodeComponent(state.pathParameters['title']!);
          return CategoryDetailPagee(categoryId: id, title: title);
        },
      ),
      GoRoute(
        path: RouterName.categoryrecipe,
        name: "CategoryRecipe",

        builder: (context, state) {
          final id = int.parse(state.pathParameters['id']!);
          final title = Uri.decodeComponent(state.pathParameters['title']!);
          final rating = num.parse(state.pathParameters['rating']!);

          return CategoryDetailsRecipe(
            recipeId: id,
            title: title,
            rating: rating,
          );
        },
      ),
      GoRoute(
        path: RouterName.levels,
        builder: (context, state) => LevelsContainer(),
      ),

      GoRoute(
        path: RouterName.cuisines,
        builder: (context, state) => CusinesPage(),
      ),
      GoRoute(path: RouterName.cuisinesallergic,
      builder: (context, state)=> CuisinesAlergic(),
      )
    ],
  );
}
