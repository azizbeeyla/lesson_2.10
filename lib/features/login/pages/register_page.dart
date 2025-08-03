import 'package:flutter/material.dart';
import 'package:lesson2_10/core/utils/app_colors.dart';
import 'package:lesson2_10/features/login/widgets/login.dart';
import 'package:provider/provider.dart';
import '../managers/register_view.dart';
import 'login_page.dart';

class RegisterPage extends StatefulWidget {
  RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final emailcontroller = TextEditingController();
  final fullnamecontroller = TextEditingController();
  final datacontroller = TextEditingController();
  final formkey = GlobalKey<FormState>();
  final mobilecontroller = TextEditingController();
  final passwordcontroller = TextEditingController();
  final confirmpasswordcontroller = TextEditingController();

  @override
  void dispose() {
    emailcontroller.dispose();
    fullnamecontroller.dispose();
    datacontroller.dispose();
    mobilecontroller.dispose();
    passwordcontroller.dispose();
    confirmpasswordcontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => RegisterView(),
      child: Scaffold(
        backgroundColor: AppColors.baige,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(100),
          child: AppBar(
            backgroundColor: AppColors.baige,
            title: Text("Register", style: TextStyle(color: AppColors.mainpink)),
            centerTitle: true,
          ),
        ),
        body: Consumer<RegisterView>(
          builder: (context, vm, child) {
            return SingleChildScrollView(
              padding: EdgeInsets.all(16),
              child: Form(
                key: formkey,
                child: Column(
                  children: [
                    RecipiTextformfield(
                      hinttext: "John Doo",
                      label: "Full name",
                      onpressed: () {},
                      controller: fullnamecontroller,
                    ),
                    SizedBox(height: 10),
                    RecipiTextformfield(
                      hinttext: "example@example.com",
                      label: "Email",
                      onpressed: () {},
                      controller: emailcontroller,
                    ),
                    SizedBox(height: 10),
                    RecipiTextformfield(
                      hinttext: "+ 123 456 789",
                      label: "Mobile Number",
                      onpressed: () {},
                      controller: mobilecontroller,
                    ),
                    SizedBox(height: 10),
                    RecipiTextformfield(
                      hinttext: "DD/MM/YY",
                      label: "Date of Birth",
                      onpressed: () {},
                      controller: datacontroller,
                    ),
                    SizedBox(height: 10),
                    RecipiTextformfield(
                      ispasword: true,
                      hinttext: "12345678",
                      label: "Password",
                      onpressed: () {},
                      controller: passwordcontroller,
                    ),
                    SizedBox(height: 10),
                    RecipiTextformfield(
                      hinttext: "12345678",
                      label: "Confirm Password",
                      onpressed: () {},
                      controller: confirmpasswordcontroller,
                      ispasword: true,
                    ),
                    SizedBox(height: 40),

                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(
                          width: 230,
                          child: Text(
                            'By continuing, you agree to Terms of Use and Privacy Policy.',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              height: 1.5,
                            ),
                          ),
                        ),
                        SizedBox(height: 30),
                        SizedBox(
                          width: 260,
                          height: 60,
                          child: vm.isLoading
                              ? Center(child: CircularProgressIndicator(color: Colors.white))
                              : ElevatedButton(
                            onPressed: () async {
                              if (formkey.currentState!.validate()) {
                                if (passwordcontroller.text != confirmpasswordcontroller.text) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text("Passwordlar mos emas"),
                                      backgroundColor: Colors.red,
                                    ),
                                  );
                                  return;
                                }

                                if (fullnamecontroller.text.isEmpty ||
                                    emailcontroller.text.isEmpty ||
                                    mobilecontroller.text.isEmpty ||
                                    datacontroller.text.isEmpty ||
                                    passwordcontroller.text.isEmpty) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text("Iltimos barcha maydonlarni to'ldiring"),
                                      backgroundColor: Colors.red,
                                    ),
                                  );
                                  return;
                                }

                                try {
                                  await vm.registerUser(
                                    fullName: fullnamecontroller.text,
                                    email: emailcontroller.text,

                                    mobile: mobilecontroller.text,
                                    birthdate: datacontroller.text,
                                    password: passwordcontroller.text,

                                  );

                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text("Ro‘yxatdan o‘tish muvaffaqiyatli"),
                                      backgroundColor: Colors.green,
                                    ),
                                  );

                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(builder: (context) => LoginPage()),
                                  );
                                } catch (e) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text("Xatolik: ${e.toString()}"),
                                      backgroundColor: Colors.red,
                                    ),
                                  );
                                }
                              }
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.mainpink,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                            ),
                            child: Text(
                              'Sign Up',
                              style: TextStyle(
                                fontSize: 22,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 30),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Already have an account? ',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                              ),
                            ),
                            SizedBox(width: 3),
                            GestureDetector(
                              onTap: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(builder: (context) => LoginPage()),
                                );
                              },
                              child: Text(
                                'Log In',
                                style: TextStyle(
                                  color: AppColors.mainpink,
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    )
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
