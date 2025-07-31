import 'package:flutter/material.dart';
import 'package:lesson2_10/features/widgets/lunch_page_row.dart';
import 'package:lesson2_10/features/widgets/lunchpage_row.dart';
import 'package:lesson2_10/utils/app_colors.dart';
import 'appbarcus_toms.dart';

class LunchPagedetail extends StatelessWidget {
  const LunchPagedetail({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          "Details",
          style: TextStyle(
            color: AppColors.mainpink,
            fontWeight: FontWeight.w600,
            fontSize: 20,
          ),
        ),
        SizedBox(width: 20),
        Icon(Icons.alarm, color: Colors.white, size: 15),
        Text(
          "45 min",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w500,
            fontSize: 15,
          ),
        ),
      ],
    );
  }
}
