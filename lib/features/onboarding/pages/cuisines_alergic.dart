import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:lesson2_10/core/router/router_name.dart';
import 'package:lesson2_10/core/utils/app_colors.dart';
import 'package:lesson2_10/features/onboarding/managers/allergic_view.dart';
import 'package:provider/provider.dart';
import 'dart:ui';

import '../widgets/categories_cusiness.dart';

class CuisinesAlergic extends StatelessWidget {
  const CuisinesAlergic({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AllergicView(apiClient: context.read()),
      child: Scaffold(
        extendBody: true,
        backgroundColor: AppColors.baige,

        appBar: AppBar(
          leadingWidth: 74,
          backgroundColor: AppColors.baige,
          leading: Align(
            alignment: Alignment.centerRight,
            child: IconButton(
              onPressed: () {
                context.push(RouterName.cuisines);
              },
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
                  alignment: Alignment.centerRight,
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
        body: Consumer<AllergicView>(
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
                          "¿You have any allergic?",
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
                    "Lorem ipsum dolor sit amet consectetur. Leo ornare ullamcorper viverra ultrices in.",
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

                      itemCount: vm.allergic.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        crossAxisSpacing: 15,
                        mainAxisSpacing: 5,
                        mainAxisExtent: 145,
                      ),
                      itemBuilder: (context, index) => CategoryCusiness(
                        id: vm.allergic[index].id,
                        title: vm.allergic[index].title,
                        image: vm.allergic[index].image,
                      ),
                    ),
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
                        context.push(RouterName.categorysourse);
                      },
                      child: Text(
                        "Continue",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ),
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
