import 'package:flutter/material.dart';
import 'package:lesson2_10/features/categories/pages/CategorySourse.dart';
import 'package:lesson2_10/features/login/pages/__login_page_forgot.dart';
import 'package:lesson2_10/features/login/pages/login_page.dart';

import 'features/login/pages/register_page.dart';



void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(

        debugShowCheckedModeBanner: false,
        home: RegisterPage());
  }
}

