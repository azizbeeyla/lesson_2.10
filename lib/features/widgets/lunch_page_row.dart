import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lesson2_10/utils/app_colors.dart';

class LunchPageRow extends StatelessWidget {
  const LunchPageRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 337,
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Container(
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(
                color: AppColors.mainpink,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                'assets/lunchtime.png',
                width: double.infinity,
                height: 281,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 34.0,
              vertical: 16,
            ),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Row(
                children: [
                  Text(
                    "Pancake & Cream",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Spacer(),
                  Row(
                    children: [
                      SvgPicture.asset(
                        'assets/star.svg',
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: 4,
                      ),
                      Text(
                        "4",
                        style: TextStyle(color: Colors.white),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      SvgPicture.asset('assets/coment.svg'),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        "2.273",
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            left: 195,
            top: 100,
            child: Container(
              width: 74,
              height: 70,
              decoration: BoxDecoration(
                color: AppColors.mainpink,
                borderRadius: BorderRadius.circular(35),
              ),
              child: IconButton(
                onPressed: () {},
                icon: SvgPicture.asset(
                  'assets/play.svg',
                  width: 28,
                  height: 43,
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
