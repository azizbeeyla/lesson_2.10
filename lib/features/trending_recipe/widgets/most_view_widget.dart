import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:lesson2_10/core/router/router_name.dart';
import 'package:lesson2_10/data/models/trending_models/most_viewed.dart';
import 'package:provider/provider.dart';

import '../../../core/utils/app_colors.dart';
import '../managers/trending_view_model.dart';
import 'like_button.dart';
import 'most_viewed_bottom.dart';

class MostViewedWidget extends StatefulWidget {
  const MostViewedWidget({super.key});

  @override
  State<MostViewedWidget> createState() => _MostViewedWidgetState();
}

class _MostViewedWidgetState extends State<MostViewedWidget> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return Consumer<MostViewedViewModel>(
      builder: (context, vm, child) {
        if (vm.isLoading) {
          return const Center(child: CircularProgressIndicator());
        }

        if (vm.error != null && vm.error!.isNotEmpty) {
          return Center(
            child: Text(
              vm.error!,
              style: const TextStyle(color: Colors.red, fontSize: 16),
            ),
          );
        }

        if (vm.mostViewed == null) {
          return const Center(child: Text("Ma'lumot topilmadi"));
        }

        final recipe = vm.mostViewed!;

        return GestureDetector(
          onTap: (){
            context.push("/recipe/${recipe.id}/${recipe.title}/${recipe.rating}",);
          },
          child: SizedBox(
            width: 358.w,
            height: 182.h,
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    width: 348.w,
                    height: 53.h,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(14),
                        bottomRight: Radius.circular(14),
                      ),
                    ),
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: MostViewedBottom(
                          title: recipe.title,
                          description: recipe.description,
                          timeRequired: recipe.timeRequired,
                          rating: recipe.rating,
                        ),
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.topCenter,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(14),
                    child: Image.network(
                      recipe.photo,
                      width: 358.w,
                      height: 143.h,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  right: 12,
                  top: 8,
                  child: LikeButton(
                    isSelected: isSelected,
                    onPressed: () {
                      setState(() {
                        isSelected = !isSelected;
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
