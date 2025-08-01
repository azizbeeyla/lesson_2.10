import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lesson2_10/features/pages/CategorySourse.dart';
import 'package:lesson2_10/features/pages/login_page.dart';
import 'package:lesson2_10/utils/app_colors.dart';
import 'package:lesson2_10/features/widgets/categories.dart';
import 'package:lesson2_10/features/widgets/recipeItem.dart';

import 'features/widgets/Navigators.dart';
import 'features/widgets/categories.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(

        debugShowCheckedModeBanner: false,
        home: Categorysourse());
  }
}

