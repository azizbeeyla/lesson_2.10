import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lesson2_10/features/onboarding/pages/cusines_page.dart';

import '../../../core/utils/app_colors.dart';
import '../widgets/recipi_container.dart';

class OnboardingDetails extends StatefulWidget {
  const OnboardingDetails({super.key});

  @override
  State<OnboardingDetails> createState() => _OnboardingDetailsState();
}

class _OnboardingDetailsState extends State<OnboardingDetails> {
  int selectedIndex = -1;

  final List<Map<String, String>> levels = [
    {
      'title': 'Novice',
      'desc': 'Lorem ipsum dolor sit amet consectetur. Auctor pretium cras id dui pellentesque ornare. Quisque malesuada netus pulvinar diam.',
    },
    {
      'title': 'Intermediate',
      'desc': 'Lorem ipsum dolor sit amet consectetur. Auctor pretium cras id dui pellentesque ornare. Quisque pulvinar diam.',
    },
    {
      'title': 'Advanced',
      'desc': 'Lorem ipsum dolor sit amet pretium cras id dui pellentesque ornare. Quisque malesuada netus pulvinar diam.',
    },
    {
      'title': 'Professional',
      'desc': 'Lorem ipsum dolor sit amet consectetur. Auctor pretium cras id dui pellentesque ornare. Quisque malesuada.',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.baige,
      appBar: AppBar(
        leadingWidth: 74,
        backgroundColor: AppColors.baige,
        leading: Align(
          alignment: Alignment.centerRight,
          child: IconButton(
            onPressed: () {},
            icon: SvgPicture.asset('assets/back.svg'),
          ),
        ),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(55),
          child: Padding(
            padding: const EdgeInsets.only(bottom: 40.0),
            child: Container(
              width: 230,
              height: 12,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(100),
              ),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  width: 65,
                  height: 12,
                  decoration: BoxDecoration(
                    color: AppColors.mainpink,
                    borderRadius: BorderRadius.circular(100),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 37.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20),
            Text(
              "¿What is your cooking level?",
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(height: 20),
            SizedBox(
              width: 340,
              child: Text(
                "Please select your cooking level for better recommendations.",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 13,
                ),
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              child: ListView.builder(

                itemCount: levels.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 16.0),
                    child: SelectableCard(
                      title: levels[index]['title']!,
                      description: levels[index]['desc']!,
                      isSelected: selectedIndex == index,
                      onTap: () {
                        setState(() {
                          selectedIndex = index;
                        });
                      },
                    ),
                  );
                },
              ),
            ),
        Center(
          child: Padding(
            padding: const EdgeInsets.only(bottom: 30.0),
            child: TextButton(
              style: TextButton.styleFrom(
                backgroundColor: AppColors.mainpink,
                fixedSize: Size(162, 45),
              ),

              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context)=>CusinesPage()));

              },
              child: Text(
                "Continue",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
          ),)
          ],
        ),
      ),
    );
  }
}
