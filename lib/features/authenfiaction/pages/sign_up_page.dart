import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lesson2_10/core/utils/app_colors.dart';
import 'package:lesson2_10/features/authenfiaction/common/continue_button.dart';
import 'package:lesson2_10/features/authenfiaction/widgets/recipe_text.dart';
import 'package:provider/provider.dart';

import '../../../data/models/authefincation_models/sign_up.dart';
import '../managers/sign_up_viewmodel.dart';


class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final formKey = GlobalKey<FormState>();
  final fullnameController = TextEditingController();
  final emailController = TextEditingController();
  final mobileController = TextEditingController();
  final dateController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmController = TextEditingController();

  @override
  void dispose() {
    fullnameController.dispose();
    emailController.dispose();
    mobileController.dispose();
    dateController.dispose();
    passwordController.dispose();
    confirmController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => SignUpViewModel(),
      child: Consumer<SignUpViewModel>(
        builder: (context, vm, child) {
          return Scaffold(
            backgroundColor: AppColors.baige,
            appBar: AppBar(
              centerTitle: true,
              title: Text(
                "Sign Up",
                style: TextStyle(
                  color: AppColors.mainpink,
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
              backgroundColor: AppColors.baige,
            ),
            body: Padding(
              padding: const EdgeInsets.only(top: 70.0, left: 37, right: 37),
              child: SingleChildScrollView(
                child: Form(
                  key: formKey,
                  child: Column(
                    children: [
                      RecipeTextField(
                        hintText: "John Doe",
                        label: "Full Name",
                        controller: fullnameController,
                      ),
                      SizedBox(height: 9.h),
                      RecipeTextField(
                        label: "Email",
                        hintText: "example@example.com",
                        controller: emailController,
                      ),
                      SizedBox(height: 9.h),
                      RecipeTextField(
                        label: "Mobile Number",
                        hintText: "+123 456 789",
                        controller: mobileController,
                      ),
                      SizedBox(height: 9.h),
                      RecipeTextField(
                        hintText: "YY-MM-DD",
                        label: "Date of Birth",
                        controller: dateController,
                      ),
                      SizedBox(height: 9.h),
                      RecipeTextField(
                        hintText: "********",
                        label: "Password",
                        controller: passwordController,
                        isPassword: true,
                      ),
                      SizedBox(height: 9.h),
                      RecipeTextField(
                        hintText: "********",
                        label: "Confirm Password",
                        controller: confirmController,
                        isPassword: true,
                      ),
                      SizedBox(height: 40.h),
                      if (vm.error != null)
                        Text(
                          vm.error!,
                          style: const TextStyle(color: Colors.red),
                        ),

                      SizedBox(
                        width: 180,
                        child: Text(
                          "By continuing, you agree to Terms of Use and Privacy Policy.",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                          maxLines: 2,
                        ),
                      ),
                      SizedBox(height: 12),
                      RecipeButton(
                        backgroundColor: AppColors.mainpink,
                        text: vm.isLoading ? "Signing Up..." : "Sign Up",
                        onPressed: vm.isLoading
                            ? null
                            : () {
                          if (formKey.currentState!.validate()) {
                            if (passwordController.text.trim() !=
                                confirmController.text.trim()) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content:
                                  Text("Passwords do not match"),
                                ),
                              );
                              return;
                            }

                            final model = SignUpModel(
                              username: fullnameController.text
                                  .trim()
                                  .replaceAll(" ", "")
                                  .toLowerCase(),
                              firstName: fullnameController.text
                                  .trim()
                                  .split(" ")
                                  .first,
                              lastName: fullnameController.text
                                  .trim()
                                  .split(" ")
                                  .length >
                                  1
                                  ? fullnameController.text
                                  .trim()
                                  .split(" ")
                                  .last
                                  : "",
                              email: emailController.text.trim(),
                              phoneNumber: mobileController.text.trim(),
                              birthDate: dateController.text.trim(),
                              password: passwordController.text.trim(),
                            );

                            vm.register(model).then((_) {
                              if (vm.success) {
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(
                                  const SnackBar(
                                    content: Text(
                                        "Registration successful!"),
                                  ),
                                );

                              }
                            });
                          }
                        }, textcolor: AppColors.whiteText,
                      ),
                      SizedBox(height: 12,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Already have an account?",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                    ),
                  ),
                  SizedBox(width: 5),
                  Text(
                    "Login",
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                      color: AppColors.mainpink,
                    ),
                  ),
                ],

              )
                ]  )
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
