import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:lesson2_10/core/router/router_name.dart';
import 'package:lesson2_10/features/authenfiaction/common/continue_button.dart';
import 'package:lesson2_10/features/authenfiaction/widgets/login_text_detail.dart';
import 'package:lesson2_10/features/authenfiaction/widgets/recipe_text.dart';
import 'package:lesson2_10/features/authenfiaction/managers/login_view_model.dart';
import 'package:provider/provider.dart';
import '../../../core/utils/app_colors.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final formkey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.baige,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Login",
          style: TextStyle(
            color: AppColors.mainpink,
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
        backgroundColor: AppColors.baige,
      ),
      body: Consumer<LoginViewModel>(
        builder: (context, vm, child) {
          return Form(
            key: formkey,
            child: Padding(
              padding: const EdgeInsets.only(left: 37.0, right: 37, top: 112),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    RecipeTextField(
                      hintText: "example@example.com",
                      label: "Email",
                      controller: emailController,
                    ),
                    SizedBox(height: 10.h),
                    RecipeTextField(
                      hintText: "12345678",
                      label: "Password",
                      controller: passwordController,
                      isPassword: true,
                    ),
                    SizedBox(height: 89.h),
                    vm.isLoading
                        ? const CircularProgressIndicator()
                        : RecipeButton(
                      backgroundColor: AppColors.pinkorig,
                      text: "Log In",
                      onPressed: () async {
                        final success = await vm.login(
                          emailController.text,
                          passwordController.text,
                        );

                        if (success) {
                          context.push(RouterName.categorysourse);
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                vm.error ?? "Login xatolik",
                              ),
                            ),
                          );
                        }
                      },
        textcolor: AppColors.pink,

                    ),
                    SizedBox(height: 27.h),
                    RecipeButton(
                      backgroundColor: AppColors.pinkorig,
                      text: "Sign Up",
                      onPressed: () {
                        context.push(RouterName.signup);
                      }, textcolor: AppColors.pink,
                    ),
                    SizedBox(height: 67.h),
                    LoginTextDetail(),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
