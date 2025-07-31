import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../utils/app_colors.dart';

class CategoriesCard extends StatefulWidget {
  String image;
  String textname;
  String textdetail;
  String textminute;
  String textstar;


  CategoriesCard({
    super.key,
    required this.image,
    required this.textname,
    required this.textdetail,
    required this.textminute,
    required this.textstar,
  });

  @override
  State<CategoriesCard> createState() => _CategoriesCardState();
}

class _CategoriesCardState extends State<CategoriesCard> {
  bool isSelected=false;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 168,
      height: 229,
      child: Stack(
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: 158,
              height: 84,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(14),
                  bottomLeft: Radius.circular(14),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 15,
                  top: 6,
                  bottom: 6,
                  right: 15,
                ),
                child: SizedBox(
                  height: 84,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.textname,
                        style: TextStyle(
                          color: AppColors.textcolor,
                          fontSize: 12,
                          fontWeight: FontWeight.w700,
                        ),
                      ),

                      SizedBox(
                        width: 128,
                        child: Text(
                          maxLines: 2,
                          widget.textdetail,
                          style: TextStyle(
                            color: AppColors.textcolor,
                            fontSize: 13,
                          ),
                        ),
                      ),
                      Spacer(),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Row(
                          children: [
                            Text(
                              widget.textstar,
                              style: TextStyle(
                                color: AppColors.pink,
                                fontSize: 12,
                              ),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            SvgPicture.asset('assets/star.svg'),
                            Spacer(),
                            SvgPicture.asset('assets/clock.svg'),
                            SizedBox(
                              width: 6,
                            ),
                            Text(
                              widget.textminute,
                              style: TextStyle(
                                color: AppColors.pink,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),

          Align(
            alignment: Alignment.topCenter,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(14),
              child: Image.asset(
                widget.image,
                fit: BoxFit.cover,
                width: 168,
                height: 145,
              ),
            ),
          ),
          Positioned(
            right: 12,
            top: 8,
            child: SizedBox(
              width: 28,
              height: 28,
              child: IconButton(
                padding: EdgeInsets.zero,
                style: IconButton.styleFrom(
                  backgroundColor: isSelected? AppColors.mainpink : AppColors.pink
                ),
                onPressed: () {
              
                  setState(() {
                    isSelected=!isSelected;
              
                  });
                },
                icon: SvgPicture.asset("assets/heart.svg",width: 16, height: 16,
                  color: isSelected ? Colors.white : AppColors.mainpink,

                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
