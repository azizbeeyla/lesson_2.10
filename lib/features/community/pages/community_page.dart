
import 'package:flutter/material.dart';
import 'package:lesson2_10/features/community/widgets/recipe_community.dart';
import 'package:provider/provider.dart';

import '../../../core/utils/app_colors.dart';
import '../managers/community_view_model.dart';
import '../widgets/custom_tappbar.dart';


class CommunityPage extends StatefulWidget {
  const CommunityPage({super.key});

  @override
  State<CommunityPage> createState() => _CommunityPageState();
}

class _CommunityPageState extends State<CommunityPage> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: AppColors.baige,

      appBar: CustomTabBar(
        selectedIndex: selectedIndex,
        onTabSelected: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
      ),

      body: ChangeNotifierProvider(
        create: (context) =>
            CommunityViewModel(communityRepo: context.read()),
        builder: (context, child) {
          return Consumer<CommunityViewModel>(
            builder: (context, vm, _) {
              if (selectedIndex == 0) {
                // Top Recipes
                return vm.isLoadingTop
                    ? const Center(child: CircularProgressIndicator())
                    : SingleChildScrollView(
                  child: RecipeCommunity(
                    vm: vm.communityTop,
                    viewModel: (_){},
                  ),
                );
              } else if (selectedIndex == 1) {
                // Newest
                return vm.isLoadingNew
                    ? const Center(child: CircularProgressIndicator())
                    : SingleChildScrollView(
                  child: RecipeCommunity(
                    vm: vm.communityNew,
                    viewModel: (_){},
                  ),
                );
              } else {

                return vm.isLoadingOld
                    ? const Center(child: CircularProgressIndicator())
                    : SingleChildScrollView(
                  child: RecipeCommunity(
                    vm: vm.communityOld,
                    viewModel: (_){},
                  ),
                );
              }
            },
          );
        },
      ),


    );
  }
}
