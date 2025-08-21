import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:lesson2_10/core/router/router_name.dart';
import 'package:provider/provider.dart';

import '../../../core/utils/app_colors.dart';
import '../managers/cusines_view.dart';
import '../widgets/categories_cusiness.dart';


class CusinesPage extends StatelessWidget {
  const CusinesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CusinessView(apiClient: context.read()),
      child: Scaffold(
        backgroundColor: AppColors.baige,
        appBar: AppBar(
          leadingWidth: 74,
          backgroundColor: AppColors.baige,
          leading: Align(
            alignment: Alignment.centerRight,
            child: IconButton(
              onPressed: () {
                context.push(RouterName.levels);
              },
              icon: SvgPicture.asset('assets/back.svg'),
            ),
          ),
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(55),
            child: Padding(
              padding: const EdgeInsets.only(bottom: 40.0),
              child: Container(
                width: 230.w,
                height: 12.h,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(100),
                ),
                child: Align(
                  alignment: Alignment.center,
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
        body: Consumer<CusinessView>(
          builder: (context, vm, child) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                vm.isLoading
                    ? Center(
                  child: CircularProgressIndicator(),
                )
                    : Padding(
                  padding: const EdgeInsets.only(left: 37.0),
                  child: Text(
                    "Select your cuisines preferences",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),

                Padding(
                  padding: const EdgeInsets.only(left: 37.0),
                  child: Text(
                    'Please select your cuisines preferences for a better recommendations or you can skip it.',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 13,
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Expanded(
                  child: Center(
                    child: GridView.builder(
                      padding: EdgeInsets.symmetric(horizontal: 37),

                      itemCount: vm.cuisines.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        crossAxisSpacing: 15,
                        mainAxisSpacing: 5,
                        mainAxisExtent: 145,
                      ),
                      itemBuilder: (context, index) => CategoryCusiness(
                        id: vm.cuisines[index].id,
                        title: vm.cuisines[index].title,
                        image: vm.cuisines[index].image,
                      ),
                    ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(
                    left: 37.0,
                    right: 37,
                    bottom: 30,
                  ),
                  child: Row(
                    children: [
                      TextButton(
                        style: TextButton.styleFrom(
                          backgroundColor: AppColors.pinkorig,
                          fixedSize: Size(162, 45),
                        ),

                        onPressed: () {
context.push(RouterName.categorysourse);
                        },
                        child: Text(
                          "Skip",
                          style: TextStyle(color: AppColors.pink, fontSize: 20),
                        ),
                      ),
                      Spacer(),
                      TextButton(
                        style: TextButton.styleFrom(
                          backgroundColor: AppColors.mainpink,
                          fixedSize: Size(162, 45),
                        ),

                        onPressed: () {
                          context.push(RouterName.cuisinesallergic);
                        },
                        child: Text(
                          "Continue",
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
