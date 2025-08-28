import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lesson2_10/core/utils/app_colors.dart';
import 'package:lesson2_10/features/authenfiaction/widgets/continue_button.dart';
import 'package:lesson2_10/features/authenfiaction/widgets/forgot_password_detail.dart';
import 'package:lesson2_10/features/authenfiaction/widgets/recipe_text.dart';

class ForgotPasswordPage extends StatefulWidget {
   ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final formkey=GlobalKey<FormState>();
  final emailcontroller=TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.baige,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Forgot Your Password",
          style: TextStyle(
            color: AppColors.mainpink,
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
        backgroundColor: AppColors.baige,
      ),
      body: Form(
        key: formkey,
        child: Padding(
          padding: const EdgeInsets.only(left: 37.0,right: 37,top: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ForgotPasswordDetail(
                textmain: 'Hello There!',
                textdetail:
                    'Enter your email address. We will send a code verification in the next step.',
              ),
              SizedBox(
                height: 23.h,
              ),
              RecipeTextField(
                hintText: 'example@examle.com',
                label: "Email", controller: emailcontroller,
              ),
              Spacer(),
              Align(
                alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 48.0),
                    child: RecipeButton(backgroundColor: AppColors.mainpink, text: 'Continue', onPressed: () {  }, textcolor: Colors.white,),
                  ))
            ],
          ),
        ),
      ),

    );
  }
}
