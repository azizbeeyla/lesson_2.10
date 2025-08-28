
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lesson2_10/features/categories/widgets/Navigators.dart';
import 'package:lesson2_10/features/community/widgets/recipe_community.dart';
import 'package:provider/provider.dart';

import '../../../core/utils/app_colors.dart';
import '../managers/community_view_model.dart';

class CommunityPage extends StatelessWidget {
  const CommunityPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        extendBody: true,
        backgroundColor: AppColors.baige,
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: AppColors.baige,

          title: Text("Community",style: TextStyle(color: AppColors.mainpink,fontSize: 20.sp),),
          bottom: TabBar(
            indicator: BoxDecoration(
              color: AppColors.mainpink,
              borderRadius: BorderRadius.circular(18.r),
            ),
            indicatorColor: Colors.transparent,
            labelColor: AppColors.whiteText,
            unselectedLabelColor: AppColors.mainpink,
            dividerColor: Colors.transparent,
            indicatorSize: TabBarIndicatorSize.tab,
            indicatorPadding: EdgeInsets.symmetric(
              horizontal: 20.w,
              vertical: 10.h,
            ),
            tabs: [
              Tab(text: "Top Recipes"),
              Tab(text: "Newest"),
              Tab(text: "Oldest"),
            ],
          ),
        ),
        body: ChangeNotifierProvider(
          create: (context) => CommunityViewModel(communityRepo: context.read()),
          builder: (context, child) => TabBarView(
            children: [
              Consumer<CommunityViewModel>(
                builder: (context, vm, child) => vm.isLoadingTop
                    ? Center(
                  child: CircularProgressIndicator(),
                )
                    : SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 126.h),
                    child: RecipeCommunity(
                      vm: vm.communityTop,
                      viewModel:vm.formatTimeAgo,
                    ),
                  ),
                ),
              ),
              Consumer<CommunityViewModel>(
                builder: (context, vm, child) => vm.isLoadingNew
                    ? Center(
                  child: CircularProgressIndicator(),
                )
                    : SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 126.h),
                    child: RecipeCommunity(
                      vm: vm.communityNew,
                      viewModel: vm.formatTimeAgo,
                    ),
                  ),
                ),
              ),
              Consumer<CommunityViewModel>(
                builder: (context, vm, child) => vm.isLoadingOld
                    ? Center(
                  child: CircularProgressIndicator(),
                )
                    : SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 126.h),
                    child: RecipeCommunity(
                      vm: vm.communityOld,
                      viewModel:vm.formatTimeAgo,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
bottomNavigationBar: Navigations(),
      ),
    );
  }
}
