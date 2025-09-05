import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lesson2_10/features/categories/widgets/Navigators.dart';
import 'package:lesson2_10/features/topchefs/widgets/most_liked_chefs.dart';
import 'package:lesson2_10/features/topchefs/widgets/top_viewed_chef.dart';
import 'package:provider/provider.dart';
import 'package:lesson2_10/core/utils/app_colors.dart';

import '../../common/managers/apptheme_provider.dart';
import '../../common/widgets/appbarcus_toms.dart';
import '../managers/top_chefs_viewmodel.dart';

class TopChefPage extends StatelessWidget {
  const TopChefPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) =>
          TopChefsViewModel(
              apiClient: context.read(),
              chefsRepo: context.read(),
            )
            ..fetchTopChefs(limit: 2, page: 1)
            ..fetchTopChefs(limit: 2, page: 2)
            ..fetchTopChefs(limit: 2, page: 3),
      child: Scaffold(
        extendBody: true,
        appBar: AppbarcusToms(
          icon: 'assets/back.svg',
          title: "Top Chefs",
          iconaction1: "assets/notification.svg",
          iconaction2: "assets/find.svg",
          background: Color(0xFFFFC6C9),
          foreground: AppColors.mainpink,
        ),
        body: Consumer<TopChefsViewModel>(
          builder: (context, vm, child) {
            if (vm.isLoading) {
              return Center(child: CircularProgressIndicator());
            }
            if (vm.error != null) {
              return Center(child: Text("Xato: ${vm.error}"));
            }

            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MostViewedChefs(),
                  SizedBox(height: 20),

                  Padding(
                    padding: const EdgeInsets.only(left: 37.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Most Liked Chefs",
                          style: TextStyle(
                            color: AppColors.mainpink,
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),

                        SizedBox(
                          height: 9.h,
                        ),
                        Row(
                          children: List.generate(
                            vm.chefsTwo.length,
                            (index) => Padding(
                              padding: const EdgeInsets.only(right: 18.0),
                              child: MostLikedChefs(
                                vm: vm.chefsTwo,
                                index: index,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),

                        Text(
                          "Top Rated Chefs",
                          style: TextStyle(
                            color: AppColors.mainpink,
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(
                          height: 9.h,
                        ),
                        Row(
                          children: List.generate(
                            vm.chefsThree.length,
                            (index) => Padding(
                              padding: const EdgeInsets.only(right: 18.0),
                              child: MostLikedChefs(
                                vm: vm.chefsThree,
                                index: index,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
        bottomNavigationBar: Navigations(),

        floatingActionButton: FloatingActionButton(
          onPressed: () {
context.read<AppthemeProvider>().toggleTheme();
          },
          child: Text(
            'theme',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
