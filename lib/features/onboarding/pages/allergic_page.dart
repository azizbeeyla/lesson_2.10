import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lesson2_10/features/onboarding/manager/alergivview.dart';
import 'package:lesson2_10/features/onboarding/widgets/category_cusines.dart';
import 'package:provider/provider.dart';

import '../../../core/utils/app_colors.dart';
import '../../categories/pages/CategorySourse.dart';


class AlergicPage extends StatelessWidget {
  const AlergicPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AllergicView(),
      child: Scaffold(
        extendBody: true,
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
                vm.isloading
                    ? Center(
                  child: CircularProgressIndicator(),
                )
                    : Padding(
                  padding:  EdgeInsets.only(left: 37.0),
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
                  padding:  EdgeInsets.only(left: 37.0,right: 37),
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

                      itemCount: vm.allergics.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        crossAxisSpacing: 15,
                        mainAxisSpacing: 5,
                        mainAxisExtent: 145,
                      ),
                      itemBuilder: (context, index) => CategoryCusiness(
                        id: vm.allergics[index]['id'],
                        title: vm.allergics[index]['title'],
                        image: vm.allergics[index]['image'],
                      ),
                    ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(

                    bottom: 35,
                  ),
                  child: Center(
                    child: TextButton(
                      style: TextButton.styleFrom(
                        backgroundColor: AppColors.mainpink,
                        fixedSize: Size(162, 45),
                      ),

                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Categorysourse()));

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
