import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../core/utils/app_colors.dart';
import '../../categories/pages/CategorySourse.dart';
import '../managers/login_view.dart';
import 'register_page.dart';
import '../widgets/login.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => LoginView(),
      child: Scaffold(
        backgroundColor: AppColors.baige,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(150),
          child: AppBar(
            backgroundColor: AppColors.baige,
            centerTitle: true,
            title: Text("Login", style: TextStyle(color: AppColors.mainpink)),
          ),
        ),
        body: Consumer<LoginView>(
          builder: (context, vm, child) {
            return SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    RecipiTextformfield(
                      controller: emailController,
                      onpressed: () {},
                      label: 'Email',
                      hinttext: 'example@example.com',
                      ispasword: false,
                    ),
                    SizedBox(height: 10),
                    RecipiTextformfield(
                      controller: passwordController,
                      onpressed: () {},
                      label: 'Password',
                      hinttext: '********',
                      ispasword: true,
                    ),
                    SizedBox(height: 40),
                    vm.isLoading
                        ? CircularProgressIndicator()
                        : TextButton(
                      style: TextButton.styleFrom(
                        backgroundColor: Color(0xFFFFC6C9),
                      ),
                      onPressed: () async {
                        if (formKey.currentState!.validate()) {
                          final token = await vm.login(
                            emailController.text,
                            passwordController.text,
                          );
                          if (token != null) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Categorysourse(),
                              ),
                            );
                          }
                        }
                      },
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 73),
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
                    if (vm.error!= null)
                      Padding(
                        padding: EdgeInsets.only(top: 12),
                        child: Text(
                          vm.error!,
                          style: TextStyle(color: Colors.red),
                        ),
                      ),
                    SizedBox(height: 20),
                    TextButton(
                      style: TextButton.styleFrom(
                        backgroundColor: Color(0xFFFFC6C9),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => RegisterPage()),
                        );
                      },
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 65),
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
          },
        ),
      ),
    );
  }
}
