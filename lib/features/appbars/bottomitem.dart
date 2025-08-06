import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lesson2_10/features/categories/pages/DetailPage.dart';

import '../../core/utils/app_colors.dart';

class BottomItem extends StatelessWidget {
  const BottomItem({
    super.key,
    required this.title,
    required this.isSelected,
    required this.id,
  });

  final int id;
  final String title;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        final encodedTitle = Uri.encodeComponent(title);
        context.pushNamed(
          'categoryDetail',
          pathParameters: {
            'id': id.toString(),
            'title': encodedTitle,
          },
        );
      },
      child: Container(
        height: 25,
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(horizontal: 9),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.mainpink : Colors.transparent,
          borderRadius: BorderRadiusGeometry.circular(18),
        ),
        child: Text(
          title,
          style: TextStyle(
            color: isSelected ? Colors.white : AppColors.mainpink,
          ),
        ),
      ),
    );
  }
}
