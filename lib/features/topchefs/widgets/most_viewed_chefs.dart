import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:lesson2_10/core/router/router_name.dart';

import '../../../core/utils/app_colors.dart';
import '../../../data/models/topchefs/topchefs.dart';

class MostLikedChefs extends StatefulWidget {
  const MostLikedChefs({
    super.key,
    required this.vm,
    required this.index,
    this.star = 6687,
  });

  final List<TopChefsModel> vm;
  final int index, star;


  @override
  State<MostLikedChefs> createState() => _MostLikedChefsState();
}

class _MostLikedChefsState extends State<MostLikedChefs> {
  bool follow = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.push(
            RouterName.topchefsDetail
          // extra: {"id": widget.vm[widget.index].id},
        );
      },
      child: SizedBox(
        width: 170.w,
        height: 217.h,
        child: Stack(
          children: [
          Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            width: 160.w,
            height: 76.h,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(14.r),
              ),
            ),
            padding: EdgeInsets.fromLTRB(10.w, 4.h, 10.w, 10.h),
            alignment: Alignment.bottomCenter,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
            Text(
            "${widget.vm[widget.index].firstName} ${widget.
              vm[widget.index].lastName}",
              style: TextStyle(color: AppColors.mainpink,fontWeight: FontWeight.w400,fontSize: 12.sp),
              maxLines: 1,
            ),
            Text(
                "@${widget.vm[widget.index].username}",
                style: TextStyle(color: AppColors.mainpink,
                    fontSize: 12,
                    fontWeight: FontWeight.w300)
            ),
           Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              spacing: 6,
              children: [
                Text(
                  "${widget.star}",
                  style: TextStyle(color: AppColors.pink),
                ),
                SvgPicture.asset('assets/star.svg'),
              ],
            ),
            Row(
              spacing: 6,
              children: [
                TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: follow
                        ? AppColors.pink
                        : AppColors.mainpink,
                    foregroundColor: follow
                        ? AppColors.pinkorig
                        : Colors.white,
                    padding: EdgeInsets.symmetric(
                      horizontal: 2,
                      vertical: 2,
                    ),
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    minimumSize: Size(43.60.w, 13.78.h),
                  ),
                  onPressed: () {
                    follow = !follow;
                    setState(() {});
                  },
                  child: Text(
                    follow ? "Follow" : "Following",
                    style: TextStyle(),
                  ),
                ),
                Container(
                  width: 13.72.w,
                  height: 13.68.h,
                  decoration: BoxDecoration(
                    color: AppColors.mainpink,
                    borderRadius: BorderRadius.circular(5.64.r),
                  ),
                  padding: EdgeInsets.all(1),
                  child: SvgPicture.asset('assets/share.svg'),
                ),
              ],
            ),
          ],
        ),
          ],
        ),
      ),
    ),
    Align(
    alignment: Alignment.topCenter,
    child: ClipRRect(
    borderRadius: BorderRadius.circular(14.r),
    child: Image.network(
    widget.vm[widget.index].photo,
    width: 170.w,
    height: 153.h,
    fit: BoxFit.cover,
    ),
    ),
    ),
    ],
    ),
    ),
    );
  }
}
