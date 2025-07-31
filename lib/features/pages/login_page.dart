import 'package:flutter/material.dart';
import 'package:lesson2_10/features/widgets/login.dart';
import 'package:lesson2_10/utils/app_colors.dart';

import 'CategorySourse.dart';

Future<String> login({required String login, required String password}) async {
  var response = await dio.post(
    '/auth/login',
    data: {"login": login, "password": password},
  );
  if (response.statusCode != 200) {
    throw Exception(response.data);
  }
  return response.data["accessToken"];
}

class LoginPage extends StatefulWidget {
  LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailcontroller = TextEditingController();
  final formkey = GlobalKey<FormState>();
  final logincontroller = TextEditingController();

  @override
  void dispose() {
    emailcontroller.dispose();
    logincontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.baige,
      appBar: AppBar(
        backgroundColor: AppColors.baige,
        title: Text(
          "Login",
          style: TextStyle(color: AppColors.mainpink),
        ),
        centerTitle: true,
      ),
      body: Form(
        key: formkey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            RecipiTextformfield(
              controller: emailcontroller,
              onpressed: () async {},
              label: 'Email',
              hinttext: 'example@example.gmail.com',
              ispasword: false,
            ),
            SizedBox(
              height: 10,
            ),

            RecipiTextformfield(
              hinttext: "123456",
              label: "Password",
              onpressed: () {},
              controller: logincontroller,
              ispasword: true,
            ),

            SizedBox(
              height: 100,
            ),

            Center(
              child: TextButton(
                style: TextButton.styleFrom(backgroundColor: Color(0xFFFFC6C9)),
                onPressed: () async {
                  var token = await login(
                    login: emailcontroller.text,

                    password: logincontroller.text,
                  );
                  ScaffoldMessenger.of(
                    context,
                  ).showSnackBar(SnackBar(content: Text(token)));
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 73.0),
                  child: Text(
                    "Login",
                    style: TextStyle(
                      color: AppColors.mainpink,
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            TextButton(
              style: TextButton.styleFrom(backgroundColor: Color(0xFFFFC6C9)),
              onPressed: () {},
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 65.0),
                child: Text(
                  'Sign up',
                  style: TextStyle(
                    color: AppColors.mainpink,
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

