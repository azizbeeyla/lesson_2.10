import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:lesson2_10/core/router/router_name.dart';
import 'package:lesson2_10/core/utils/app_colors.dart';
import 'package:lesson2_10/features/onboarding/managers/onboarding1_view.dart';
import 'package:lesson2_10/features/onboarding/widgets/continue_button.dart';
import 'package:provider/provider.dart';

import '../widgets/onboarding_texts.dart';

class OnboardingPage2 extends StatelessWidget {
  const OnboardingPage2({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => OnBoardingViewModel( apiClient: context.read()),

      child: Scaffold(
        extendBody: true,
        appBar: AppBar(
          leadingWidth: 74,
          backgroundColor: AppColors.baige,
          leading: Align(
            alignment: Alignment.centerRight,
            child: IconButton(
              onPressed: () {
                context.push(RouterName.onboarding1);
              },
              icon: SvgPicture.asset('assets/back.svg'),
            ),
          ),
        ),
        backgroundColor: AppColors.baige,
        body: Consumer<OnBoardingViewModel>(
          builder: (context, vm, child) {
            if (vm.isLoading) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            if (vm.images == null) {
              return Center(
                child: Text("Image kelmadi"),
              );
            }
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 37.0),
                  child: OnboardingTexts(
                    text1: 'Get an increase your skills',
                    text2:
                    '"Learn essential cooking techniques at your own pace.',
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: SizedBox(
                    height: 741.h,
                    child: Stack(
                      children: [
                        Image.network(
                          vm.images!.image,
                          fit: BoxFit.cover,
                        ),
                        Container(
                          width: double.infinity,
                          height: double.infinity,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.center,
                              colors: [
                                Colors.black.withAlpha(5),
                                Colors.transparent,
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            );
          },
        ),
        bottomNavigationBar: Align(
            alignment: Alignment.bottomCenter,
            child: ContinueButton(onpresed: () {
              context.push(RouterName.onboarding3);
            },)),
      ),
    );
  }
}
