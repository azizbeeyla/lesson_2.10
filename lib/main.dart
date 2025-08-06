import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lesson2_10/features/categories/pages/CategorySourse.dart';
import 'package:lesson2_10/features/onboarding/pages/cusines_page.dart';

import 'features/onboarding/pages/onboarding_details.dart';




void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(430, 932),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MaterialApp(

          debugShowCheckedModeBanner: false,
          home: Categorysourse()),
    );
  }
}

