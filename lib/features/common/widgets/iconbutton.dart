import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../core/utils/app_colors.dart';


class RecipeIconButton extends StatelessWidget {
  final String icon;
  final VoidCallback onPressed;
  final  Color backgroundColor;
  final Color? foregroundColor;

   RecipeIconButton({
    super.key,
    required this.icon,
    required this.onPressed,
    this.backgroundColor = AppColors.pinkorig,
    this.foregroundColor = Colors.black,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      style: IconButton.styleFrom(
        tapTargetSize:MaterialTapTargetSize.shrinkWrap ,
        backgroundColor: backgroundColor
      ),
      constraints: BoxConstraints.tight(Size(28,28)),
      padding: EdgeInsets.zero,
      onPressed: onPressed,
      icon: SvgPicture.asset(
        icon,
        colorFilter: ColorFilter.mode(
          AppColors.mainpink ?? Colors.black,
          BlendMode.srcIn,
        ),
        width: 24,
        height: 24,
      ),
    );
  }
}
