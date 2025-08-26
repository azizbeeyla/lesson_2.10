import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:go_router/go_router.dart';
import 'package:lesson2_10/core/router/router_name.dart';
import '../../../core/utils/app_colors.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  final _secureStorage = const FlutterSecureStorage();

  Future<void> _checkRegistration() async {
    await Future.delayed(const Duration(seconds: 3));

    final token = await _secureStorage.read(key: "token");

    if (!mounted) return;

    if (token != null && token.isNotEmpty) {
      context.go(RouterName.categorysourse);
    } else {
      context.go(RouterName.signup);
    }
  }

  @override
  void initState() {
    super.initState();
    _checkRegistration();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.mainpink,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 152.w,
              height: 152.h,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(76),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset('assets/spoon.svg'),
                  SizedBox(width: 12.78.w),
                  SvgPicture.asset('assets/fork.svg'),
                ],
              ),
            ),
            SizedBox(height: 20.h),
            Text(
              "DishDash",
              style: TextStyle(
                color: Colors.white,
                fontSize: 63.h,
                fontFamily: "Poppins",
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
