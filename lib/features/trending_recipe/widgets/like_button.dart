import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/utils/app_colors.dart';

class LikeButton extends StatelessWidget {
  final bool isSelected;
  final VoidCallback onPressed;

  const LikeButton({
    super.key,
    required this.isSelected,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 28,
      height: 28,
      child: IconButton(
        padding: EdgeInsets.zero,
        constraints: const BoxConstraints(),
        style: IconButton.styleFrom(
          backgroundColor:
          isSelected ? AppColors.mainpink : AppColors.pink,
        ),

        onPressed: onPressed,
        icon: SvgPicture.asset(
          "assets/heart.svg",
          width: 16,
          height: 16,
          color: isSelected ? Colors.white : AppColors.mainpink,
        ),
      ),
    );
  }
}
