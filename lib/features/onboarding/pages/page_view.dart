import 'package:flutter/material.dart';
import 'onboarding3_page.dart';
import 'onboarding_page1.dart';
import 'onboarding_page2.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        physics: const BouncingScrollPhysics(),
        children: [
           OnboardingPage1(),
           OnboardingPage2(),
          OnboardingPage3(),
        ],
      ),
    );
  }
}
