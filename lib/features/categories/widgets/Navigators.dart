import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Navigations extends StatefulWidget {
  Navigations({
    super.key,
  });

  @override
  State<Navigations> createState() => _NavigationsState();
}
class _NavigationsState extends State<Navigations> {
  int selected = 0;

  @override
  Widget build(BuildContext context) {

    return SizedBox(
      width: double.infinity,
      height: 126,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Container(

            width: double.infinity,
            height: 126,
            decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
                  Color(0xFF1C0F0D),
                  Colors.transparent
                ],
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter
                )

            ),
          ),


          Padding(
            padding: const EdgeInsets.only(bottom: 34.0),
            child: Container(
              width: 281,
              height: 56,
              decoration: BoxDecoration(
                color: Color(0xFFFD5D69),
                borderRadius: BorderRadius.circular(33),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SvgPicture.asset("assets/home.svg"),
                  SvgPicture.asset("assets/comment.svg"),
                  SvgPicture.asset("assets/romf.svg"),
                  SvgPicture.asset("assets/human.svg"),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
