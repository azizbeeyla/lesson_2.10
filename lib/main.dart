import 'package:flutter/material.dart';
import 'package:lesson2_10/features/onboarding/pages/cusines_page.dart';

import 'features/onboarding/pages/onboarding_details.dart';




void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(

        debugShowCheckedModeBanner: false,
        home: OnboardingDetails());
  }
}

