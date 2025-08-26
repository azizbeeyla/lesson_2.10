import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/utils/app_colors.dart';
import '../../trending_recipe/widgets/like_button.dart';

class RecipeCard extends StatefulWidget {
  final String photo;
  final String title;
  final num rating;
  final num timerequired;
  final int id, recipeId;

  const RecipeCard({
    super.key,
    required this.photo,
    required this.title,
    required this.rating,
    required this.timerequired,
    required this.id,
    required this.recipeId,
  });

  @override
  State<RecipeCard> createState() => _RecipeCardState();
}

class _RecipeCardState extends State<RecipeCard> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 168.w,
      height: 195.h,
      child: Stack(
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(14),
              child: Image.network(
                widget.photo,
                width: 168.w,
                height: 162.h,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 5),
              child: Container(
                width: 168.w,
                height: 48.h,
                decoration: BoxDecoration(
                  color: AppColors.whiteText,
                  borderRadius: BorderRadius.circular(13),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 8,
                      offset: Offset(0, 4),
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 15,
                    vertical: 5,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        widget.title,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 12.h,
                          fontWeight: FontWeight.w400,
                          fontFamily: "Poppins",
                        ),
                      ),
                      SizedBox(width: 2.w),
                      Row(
                        children: [
                          Text(
                            "${widget.rating}",
                            style: TextStyle(
                              fontSize: 12.h,
                              fontFamily: "Poppins",
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          SizedBox(width: 4.w),
                          SvgPicture.asset('assets/star.svg'),
                          SizedBox(width: 26.w),
                          SvgPicture.asset("assets/clock.svg"),
                          SizedBox(width: 6.66.w),
                          Text(
                            "${widget.timerequired}min",
                            style: TextStyle(
                              color: AppColors.pink,
                              fontWeight: FontWeight.w400,
                              fontFamily: "Poppins",
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
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
    );
  }
}
