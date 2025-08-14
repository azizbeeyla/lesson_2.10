import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:lesson2_10/core/router/router_name.dart';
import 'package:lesson2_10/features/authenfiaction/pages/forgot_password_page.dart';
import 'package:lesson2_10/features/authenfiaction/pages/login_page.dart';
import 'package:lesson2_10/features/authenfiaction/pages/send_code_page.dart';
import 'package:lesson2_10/features/authenfiaction/pages/sign_up_page.dart';
import 'package:lesson2_10/features/categories/pages/CategorySourse.dart';
import 'package:lesson2_10/features/categories/pages/DetailPage.dart';
import 'package:lesson2_10/features/onboarding/pages/cuisines_alergic.dart';
import 'package:lesson2_10/features/onboarding/pages/cusiness_page.dart';
import 'package:lesson2_10/features/onboarding/pages/levels_page.dart';
import 'package:lesson2_10/features/onboarding/pages/onboarding3_page.dart';
import 'package:lesson2_10/features/onboarding/pages/onboarding_page1.dart';
import 'package:lesson2_10/features/onboarding/pages/page_view.dart';

import '../../features/categories/pages/recipilunch.dart';
import '../../features/onboarding/pages/onboarding_page2.dart';

class RouterClass {
  final GoRouter router = GoRouter(
    initialLocation: RouterName.login,
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
      GoRoute(
        path: RouterName.cuisinesallergic,
        builder: (context, state) => CuisinesAlergic(),
      ),
      GoRoute(
        path: RouterName.onboarding1,
        builder: (context, state) => OnboardingPage1(),
      ),
      GoRoute(
        path: RouterName.onboarding2,
        builder: (context, state) => OnboardingPage2(),
      ),
      GoRoute(
        path: RouterName.onboarding3,
        builder: (context, state) => OnboardingPage3(),
      ),
      GoRoute(path: RouterName.pageview,
      builder: (context,state)=>OnboardingScreen()
      ),
      GoRoute(path: RouterName.forgotPassword,
      builder: (context,state)=>ForgotPasswordPage(),
      ),
      GoRoute(path: RouterName.sendcode,builder: (context,state)=>SendCodePage()),

      GoRoute(path: RouterName.login,builder: (context,state)=>LoginPage()),
      GoRoute(path: RouterName.signup,builder: (context,state)=>SignUpPage()),


    ],
  );
}
