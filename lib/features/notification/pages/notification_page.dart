import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lesson2_10/core/utils/app_colors.dart';
import 'package:lesson2_10/features/categories/widgets/Navigators.dart';
import 'package:lesson2_10/features/notification/widgets/reusable_notication.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
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
          "Notifications",
          style: TextStyle(
            color: Color(0xFFFD5D69),
            fontWeight: FontWeight.w600,
            fontSize: 20,
          ),
        ),
      ),

      body: Column(
        children: [
          ReusableNotification(textNotification: "General Notifications"),
          ReusableNotification(textNotification: "Sound"),
          ReusableNotification(textNotification: "Sound Call"),
          ReusableNotification(textNotification: "Vibrate"),
        ],
      ),
      bottomNavigationBar: Navigations(),
    );
  }
}
