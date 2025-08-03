import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginPageForgot extends StatelessWidget {
  const LoginPageForgot({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "Forgot Password",
          style: TextStyle(
            color: Colors.white,
            fontSize: 15,
            fontWeight: FontWeight.w700,
          ),
        ),
        SizedBox(
          height: 88,
        ),

        Text(
          "or sign up with",
          style: TextStyle(
            color: Colors.white,
            fontSize: 15,
            fontWeight: FontWeight.w400,
          ),
        ),
        SizedBox(
          height: 26,
        ),

        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 14,
          children: [
            SvgPicture.asset('assets/insta.svg'),
            SvgPicture.asset('assets/google.svg'),
            SvgPicture.asset('assets/facebook.svg'),
            SvgPicture.asset('assets/whatsapp.svg'),
          ],
        ),
        SizedBox(
          height: 26,
        ),

        Text(
          "Don’t have an account? Sign Up",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w400,
            fontSize: 13,
          ),
        ),
      ],
    );
  }
}
