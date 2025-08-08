import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class CategoriesItem extends StatelessWidget {
  const CategoriesItem({
    super.key,
    required this.id,
    required this.title,
    required this.image,
  });

  final num id;
  final String title, image;


  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 6,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(13),
          child: Image.network(
            image,
            width: 150.w,
            height: 150.h,
            fit: BoxFit.cover,
          ),
        ),
        Text(
          title,
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
