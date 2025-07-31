import 'package:flutter/material.dart';
import 'package:lesson2_10/features/widgets/recipi_texts.dart';
import 'package:lesson2_10/features/widgets/lunch_page_row.dart';
import 'package:lesson2_10/features/widgets/lunch_pagedetail.dart';
import 'package:lesson2_10/features/widgets/lunch_pagetext.dart';
import 'package:lesson2_10/features/widgets/lunchpage_row.dart';
import 'package:lesson2_10/utils/app_colors.dart';
import '../widgets/appbarcus_toms.dart';
class LunchPageListView extends StatelessWidget {
  const LunchPageListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      children: [
        RecipiTexts(textnum: "1",textdetail: "cup all-purpose flour"),
        RecipiTexts( textnum: "2", textdetail: "tablespoons granulated sugar"),
        RecipiTexts(textnum: '1', textdetail: "teaspoon baking powder"),
        RecipiTexts(textnum: '1/2', textdetail: "teaspoon soda"),
        RecipiTexts(textnum: '1/4', textdetail: "teaspoon salt"),
        RecipiTexts(textnum: '1', textdetail: "cup butter milk(or regular milk"),
        RecipiTexts(textnum: '1', textdetail: "large egg"),
        RecipiTexts(textnum: '1', textdetail: "tablespons unsalted butter"),
        RecipiTexts(textnum: '1', textdetail: "Aditional butter or oil for cooking"),

      ],
    );
  }
}