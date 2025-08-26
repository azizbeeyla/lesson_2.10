import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:lesson2_10/core/router/router_name.dart';
import 'package:lesson2_10/features/authenfiaction/pages/forgot_password_page.dart';
import 'package:lesson2_10/features/authenfiaction/pages/login_page.dart';
import 'package:lesson2_10/features/authenfiaction/pages/send_code_page.dart';
import 'package:lesson2_10/features/authenfiaction/pages/sign_up_page.dart';
import 'package:lesson2_10/features/authenfiaction/pages/splash_page.dart';
import 'package:lesson2_10/features/categories/pages/CategorySourse.dart';
import 'package:lesson2_10/features/categories/pages/DetailPage.dart';
import 'package:lesson2_10/features/community/pages/community_page.dart';
import 'package:lesson2_10/features/onboarding/pages/cuisines_alergic.dart';
import 'package:lesson2_10/features/onboarding/pages/cusiness_page.dart';
import 'package:lesson2_10/features/onboarding/pages/levels_page.dart';
import 'package:lesson2_10/features/onboarding/pages/onboarding3_page.dart';
import 'package:lesson2_10/features/onboarding/pages/onboarding_page1.dart';
import 'package:lesson2_10/features/onboarding/pages/page_view.dart';
import 'package:lesson2_10/features/review/page/review_page.dart';
import 'package:lesson2_10/features/topchefs/pages/top_chefs_detail.dart';
import 'package:lesson2_10/features/topchefs/pages/top_chefs_page.dart';
import 'package:lesson2_10/features/trending_recipe/pages/trending_page.dart';

import '../../features/categories/pages/recipilunch.dart';
import '../../features/onboarding/pages/onboarding_page2.dart';
import '../../features/review/page/review_add_page.dart';

class RouterClass {
  final router = GoRouter(
    initialLocation: RouterName.splash,
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
      GoRoute(
        path: RouterName.pageview,
        builder: (context, state) => OnboardingScreen(),
      ),
      GoRoute(
        path: RouterName.forgotPassword,
        builder: (context, state) => ForgotPasswordPage(),
      ),
      GoRoute(
        path: RouterName.sendcode,
        builder: (context, state) => SendCodePage(),
      ),

      GoRoute(path: RouterName.login, builder: (context, state) => LoginPage()),
      GoRoute(
        path: RouterName.signup,
        builder: (context, state) => SignUpPage(),
      ),

      GoRoute(
        path: RouterName.trending,
        builder: (context, state) => TrendingPage(),
      ),

      GoRoute(
        path: RouterName.review,
        builder: (context, state) => ReviewPage(
          categoriyId: (state.extra as Map)["categoriyId"],
        ),
      ),
      GoRoute(
        path: RouterName.topchefsDetail,
        builder: (context, state) =>
            TopChefsDetail(id: (state.extra as Map)["id"]),
      ),
      GoRoute(
        path: RouterName.topchefs,
        builder: (context, state) => TopChefPage(),
      ),

      GoRoute(
        path: RouterName.community,
        builder: (context, state) => CommunityPage(),
      ),
      GoRoute(
        path: RouterName.reviewAdd,
        builder: (context, state) => ReviewAddPage(
          categoriyId: (state.extra as Map)["categoriyId"],
        ),
      ),
      GoRoute(path: RouterName.splash,builder: (context,state)=>SplashPage())
    ],
  );
}
