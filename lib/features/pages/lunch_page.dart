import 'package:flutter/material.dart';
import 'package:lesson2_10/features/pages/lunch_page_list_view.dart';
import 'package:lesson2_10/features/widgets/Navigators.dart';
import 'package:lesson2_10/features/widgets/lunch_page_row.dart';
import 'package:lesson2_10/features/widgets/lunch_pagedetail.dart';
import 'package:lesson2_10/features/widgets/lunch_pagetext.dart';
import 'package:lesson2_10/features/widgets/lunchpage_row.dart';
import 'package:lesson2_10/utils/app_colors.dart';

import '../widgets/appbarcus_toms.dart';

class LunchPage extends StatelessWidget {
  const LunchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: AppColors.baige,

      appBar: AppbarcusToms(
        icon: 'assets/back.svg',
        title: "Breakfast",
        iconaction1: "assets/heart.svg",
        iconaction2: "assets/find.svg",
        background: Color(0xFFFFC6C9),
        foreground: AppColors.mainpink,
      ),
      body: Column(
        children: [
          LunchPageRow(),
          SizedBox(
            height: 20,
          ),
          lunchpageRow(),

          SizedBox(height: 20),
          Divider(
            color: AppColors.pinkorig,
            indent: 24,
            endIndent: 24,
            thickness: 2,
          ),
          SizedBox(height: 30),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: LunchPagedetail(),
          ),
          SizedBox(height: 5),
          LunchPagetext(),
          SizedBox(height: 31),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Ingredients",
                style: TextStyle(
                  color: AppColors.mainpink,
                  fontWeight: FontWeight.w600,
                  fontSize: 20,
                ),
              ),
            ),
          ),
          SizedBox(height: 15),

          LunchPageListView(),
        ],
      ),
      bottomNavigationBar: Navigations(),
    );
  }
}
