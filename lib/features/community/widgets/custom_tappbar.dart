import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lesson2_10/core/utils/app_colors.dart';

class CustomTabBar extends StatelessWidget implements PreferredSizeWidget {
  final int selectedIndex;
  final ValueChanged<int> onTabSelected;

  const CustomTabBar({
    super.key,
    required this.selectedIndex,
    required this.onTabSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8),
      color: AppColors.baige,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildTabButton("Top Recipes", 0),
          _buildTabButton("Newest", 1),
          _buildTabButton("Oldest", 2),
        ],
      ),
    );
  }

  Widget _buildTabButton(String title, int index) {
    final bool isSelected = selectedIndex == index;
    return GestureDetector(
      onTap: () => onTabSelected(index),
      child: Container(
        width: 119.w,
        height: 25.h,
        decoration: BoxDecoration(
          color: isSelected ? AppColors.mainpink : Colors.transparent,
          borderRadius: BorderRadius.circular(18.r),
        ),
        child: Center(
          child: Text(
            title,
            style: TextStyle(
              color: isSelected ? Colors.white : AppColors.mainpink,
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(50);
}
