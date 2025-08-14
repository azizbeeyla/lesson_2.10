import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:lesson2_10/core/router/router_name.dart';
import 'package:lesson2_10/features/categories/managers/category_view.dart';
import 'package:lesson2_10/features/onboarding/widgets/onboarding_page3_text.dart';
import 'package:provider/provider.dart';

import '../../../core/utils/app_colors.dart';
import '../widgets/categories_item.dart';

class OnboardingPage3 extends StatelessWidget {
  OnboardingPage3({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CategoryView()..getCategory(),
      child: Scaffold(
        backgroundColor: AppColors.baige,
        appBar: AppBar(
          leadingWidth: 80,
          backgroundColor: AppColors.baige,
          leading: Align(
            alignment: Alignment.centerRight,
            child: IconButton(
              onPressed: () {
                context.push(RouterName.onboarding2);
              },
              icon: SvgPicture.asset('assets/back.svg'),
            ),
          ),
        ),
        body: Consumer<CategoryView>(
          builder: (context, cv, child) {
            if (cv.isLoading) {
              return Center(child: CircularProgressIndicator());
            }

            return Column(
              children: [
                SizedBox(
                  height: 557.h,
                  child: GridView.builder(
                    padding: EdgeInsets.symmetric(horizontal: 24),
                    itemCount: cv.categories.length,

                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisExtent: 190,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                    ),
                    itemBuilder: (context, index) {
                      final item = cv.categories[index];
                      return CategoriesItem(
                        id: item.id,
                        title: item.title,
                        image: item.image,
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 36.0),
                  child: OnboardingPage3Text(),
                ),
                SizedBox(
                  height: 28,
                ),

                Column(
                  children: [
                    TextButton(
                      style: TextButton.styleFrom(
                        backgroundColor: AppColors.pinkorig,
                        fixedSize: Size(162, 45),
                      ),

                      onPressed: () {
                        context.push(RouterName.levels);
                      },

                      child: Text(
                        "I'm New",
                        style: TextStyle(color: Colors.pink, fontSize: 20),
                      ),
                    ),
                    SizedBox(height: 18,),
                    TextButton(
                      style: TextButton.styleFrom(
                        backgroundColor: AppColors.pinkorig,
                        fixedSize: Size(162, 45),
                      ),

                      onPressed: () {},

                      child: Text(
                        "I've Been Here",
                        style: TextStyle(color: Colors.pink, fontSize: 20),
                      ),
                    ),
                  ],
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
