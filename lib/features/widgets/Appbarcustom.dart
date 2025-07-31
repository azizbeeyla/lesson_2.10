
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../utils/app_colors.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final int selectedIndex;
  final List<String> categories;
  final Function(int) onCategorySelected;

  const CustomAppBar({
    Key? key,
     required this.selectedIndex,
    required this.categories,
    required this.onCategorySelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.baige,
      elevation: 0,
      leading: GestureDetector(
        onTap: () => Navigator.pop(context),
        child: Align(
          alignment: Alignment.centerRight,
          child: SvgPicture.asset(
            "assets/back.svg",
            fit: BoxFit.contain,
          ),
        ),
      ),
      centerTitle: true,
      title: Text(
        categories[selectedIndex],
        style: TextStyle(
          color: AppColors.mainpink,
          fontSize: 20,
          fontWeight: FontWeight.w700,
        ),
      ),
      actions: [
        Container(
          width: 30,
          height: 30,
          decoration: BoxDecoration(
            color: Color(0xFFFFC6C9),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Center(child: SvgPicture.asset("assets/notification.svg")),
        ),
        SizedBox(width: 5),
        Padding(
          padding: const EdgeInsets.only(right: 24),
          child: Container(
            width: 30,
            height: 30,
            decoration: BoxDecoration(
              color: Color(0xFFFFC6C9),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Center(child: SvgPicture.asset("assets/find.svg")),
          ),
        ),
      ],
      bottom: PreferredSize(
        preferredSize: Size.fromHeight(50),
        child: Container(
          alignment: Alignment.centerLeft,
          padding: EdgeInsets.symmetric(vertical: 10),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Row(
                children: List.generate(categories.length, (index) {
                  final isSelected = index == selectedIndex;
                  return GestureDetector(
                    onTap: () => onCategorySelected(index),
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 8),
                      padding: EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 8,
                      ),
                      decoration: BoxDecoration(
                        color:
                        isSelected ? AppColors.mainpink : Colors.transparent,
                        borderRadius: BorderRadius.circular(18),
                      ),
                      child: Text(
                        categories[index],
                        style: TextStyle(
                          color:
                          isSelected ? Colors.white : AppColors.mainpink,
                          fontWeight:
                          isSelected ? FontWeight.bold : FontWeight.normal,
                        ),
                      ),
                    ),
                  );
                }),
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight + 50);
}