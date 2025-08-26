import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import '../../core/utils/app_colors.dart';

class AppbarcusToms extends StatelessWidget implements PreferredSizeWidget {
  final String icon;
  String iconaction1, iconaction2;
  final String title;
  final Color background, foreground;
  final VoidCallback? onAction1Pressed;
  final VoidCallback? onAction2Pressed;
   AppbarcusToms({
    super.key,

    required this.icon,
    required this.iconaction1,
    required this.iconaction2,
    required this.title,
    required this.background,
    required this.foreground, this.onAction1Pressed, this.onAction2Pressed,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.baige,

      leading: Align(
        alignment: Alignment.centerRight,
        child: IconButton(

          style: IconButton.styleFrom(
            backgroundColor: Colors.transparent,
            foregroundColor: foreground,
          ),
          onPressed: () {
            context.pop();
          },
          icon: SvgPicture.asset(icon),
        ),
      ),

      centerTitle: true,
      title: Text(
        title,
        style: TextStyle(color: foreground, fontSize: 20),
      ),

      actions: [
        IconButton(
          constraints: BoxConstraints.tight(Size(28,28)),

          style: IconButton.styleFrom(
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            backgroundColor: background,
            foregroundColor: foreground,
          ),
          padding: EdgeInsets.zero,

          onPressed: onAction1Pressed,
          icon: SvgPicture.asset(
            iconaction1,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 12.0),
          child: IconButton(

            constraints: BoxConstraints.tight(Size(28,28)),
            style: IconButton.styleFrom(
              backgroundColor: background,
              foregroundColor: foreground,
            ),
            padding: EdgeInsets.zero,

            onPressed: onAction2Pressed,
            icon: SvgPicture.asset(
              iconaction2,
            ),
          ),
        ),
      ],
    );
  }

  Size get preferredSize => Size.fromHeight(kToolbarHeight );
}
