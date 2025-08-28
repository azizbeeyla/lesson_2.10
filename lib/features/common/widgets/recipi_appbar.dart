import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../core/utils/app_colors.dart';

import 'iconbutton.dart';

class RecipeAppBarMain extends StatelessWidget implements PreferredSizeWidget {
  const RecipeAppBarMain({
    super.key,
    required this.title,
    this.bottom,
    this.toolbarHeight = 56,
  });

  final String title;
  final double toolbarHeight;
  final PreferredSizeWidget? bottom;

  @override
  Size get preferredSize =>
      Size(
        double.infinity,
        bottom != null
            ? bottom!.preferredSize.height + toolbarHeight
            : toolbarHeight,
      );

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.baige,
      leading: Align(
        alignment: Alignment.centerRight,
        child: RecipeIconButton(
          icon: "assets/back.svg",
          backgroundColor: Colors.transparent,
          foregroundColor: AppColors.mainpink,
          onPressed: () {
            context.pop();
          },
        ),
      ),
      centerTitle: true,
      title: Text(
          title, style: TextStyle(color: AppColors.mainpink, fontSize: 20)),
      actionsPadding: EdgeInsets.only(right: 24),
      actions: [


        RecipeIconButton(icon: "assets/notification.svg", onPressed: () {}),
        SizedBox(width: 5,),
        RecipeIconButton(icon: "assets/find.svg", onPressed: () {}),
      ],
      bottom: bottom,
    );
  }
}
