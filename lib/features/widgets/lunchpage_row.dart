import 'package:flutter/material.dart';
import 'package:lesson2_10/utils/app_colors.dart';

class lunchpageRow extends StatelessWidget {
  const lunchpageRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 24.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: 61,
            height: 63,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: Image.asset("assets/shef.png"),
            ),
          ),
          SizedBox(width: 15),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "@josh-ryan",
                style: TextStyle(
                  color: AppColors.mainpink,
                  fontWeight: FontWeight.w500,
                  fontSize: 13,
                ),
              ),
              Text(
                "Josh Ryan-Chef",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w400,
                  fontSize: 15,
                ),
              ),
            ],
          ),
          Spacer(),
          SizedBox(
            width: 110,
            height: 21,
            child: TextButton(
              style: TextButton.styleFrom(
                backgroundColor: AppColors.pink,
                padding: EdgeInsets.zero,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(21),
                ),
              ),
              onPressed: () {},
              child: Text(
                "Following",
                style: TextStyle(
                  color: AppColors.pinkorig,
                  fontWeight: FontWeight.w500,
                  fontSize: 15,
                ),
              ),
            ),
          ),

          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.more_vert,
              color: AppColors.mainpink,
            ),
          ),
        ],
      ),
    );
  }
}
