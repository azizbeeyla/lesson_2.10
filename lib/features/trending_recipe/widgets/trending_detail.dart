import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class TrendingDetail extends StatelessWidget {
  const TrendingDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer(

      builder:(context,vm,child)=> SizedBox(
        width: 358.w,
        height: 150.h,
        child: Stack(
          children: [
            Container(
              width: 217.w,
              height: 122.h,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(14),
                  bottomRight: Radius.circular(14),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: Column(children: [




                ],),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
