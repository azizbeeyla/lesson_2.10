import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lesson2_10/core/utils/app_colors.dart';
import 'package:lesson2_10/features/categories/widgets/Navigators.dart';
import 'package:lesson2_10/features/notification/widgets/custom_settings.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.baige,
      appBar: AppBar(
        leadingWidth: 80,
        backgroundColor: Color(0xFF1C0F0D),
        leading: IconButton(
          onPressed: () {},
          icon: SvgPicture.asset("assets/back.svg"),
        ),
        centerTitle: true,
        title: Text(
          "Settings",
          style: TextStyle(
            color: Color(0xFFFD5D69),
            fontWeight: FontWeight.w600,
            fontSize: 20,
          ),
        ),
      ),

      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomSettings(
            textTitle: "Notification",
            svgIcon: 'assets/setting_notification.svg',
            play: "assets/setting_play.svg",
          ),
          CustomSettings(
            textTitle: "Help Center",
            svgIcon: 'assets/setting_headphone.svg',
            play: "assets/setting_play.svg",
          ),
          CustomSettings(
            textTitle: "Privacy Policy",
            svgIcon: 'assets/setting_tick.svg',
            play: "assets/setting_play.svg",
          ),
          CustomSettings(
            textTitle: "Language",
            svgIcon: 'assets/setting_comment.svg',
            play: "assets/setting_play.svg",
          ),
          CustomSettings(
            textTitle: "Turn Dark Theme",
            svgIcon: 'assets/setting_reply.svg',
          ),
          CustomSettings(
            textTitle: "Log Out",
            svgIcon: 'assets/setting_exit.svg',
          ),
          SizedBox(height: 10.h,),
          Padding(
            padding: const EdgeInsets.only(left:37.0),
            child: Text(
              "Delete Account",
              style: TextStyle(
                color: AppColors.pink,
                fontWeight: FontWeight.w500,
                fontSize: 15,
              ),
            ),
          ),
        ],

      ),
      bottomNavigationBar: Navigations(),
    );
  }
}
