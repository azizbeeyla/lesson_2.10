import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lesson2_10/core/utils/app_colors.dart';

class CustomSettings extends StatelessWidget {
  final String textTitle;
  final String svgIcon;
  final String? play;

  CustomSettings({
    super.key,
    required this.textTitle,
    required this.svgIcon,
    this.play,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 37.0,vertical: 8),
      child: Row(
        children: [
          Container(
            width: 35,
            height: 35,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(17.5),
              color: AppColors.mainpink,
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SvgPicture.asset(svgIcon),
            ),
          ),
          SizedBox(width: 18),
          Text(
            textTitle,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w500,
              fontSize: 15,
            ),
          ),
          Spacer(),
          if (play != null) SvgPicture.asset(play!),
        ],
      ),
    );
  }
}
