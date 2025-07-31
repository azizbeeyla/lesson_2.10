import 'package:flutter/material.dart';
import 'package:lesson2_10/utils/app_colors.dart';

class RecipiTexts extends StatelessWidget {
final String textnum;
final String textdetail;
   RecipiTexts({


    super.key, required this.textnum, required this.textdetail,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        
        Icon(Icons.circle, color:  AppColors.mainpink, size: 12,),
SizedBox(width: 10,),
        Text(textnum,style: TextStyle(color: AppColors.mainpink),),
        SizedBox(width: 5,),
        Text(textdetail, style: TextStyle(color: Colors.white),)
      ],
    );
  }
}
