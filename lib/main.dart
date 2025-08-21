import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:lesson2_10/core/clients/dio_cielent.dart';
import 'package:lesson2_10/core/interceptor.dart';
import 'package:lesson2_10/data/repositry/login_repositiry.dart';
import 'package:lesson2_10/data/repositry/sign_up_repostriy.dart';
import 'package:lesson2_10/features/authenfiaction/managers/sign_up_viewmodel.dart';
import 'package:provider/provider.dart';
import 'core/router/router_class.dart';
import 'data/repositry/topchefs/top_chefs.dart';
import 'data/repositry/trending_repostries.dart';
import 'features/authenfiaction/managers/login_view_model.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        Provider(create: (context)=>FlutterSecureStorage()),
        //interceptor
        Provider(create: (context)=>AuthInterceptor(secureStorage: context.read())),
        // Api client
        Provider(create: (context) => ApiClient(interceptor: context.read())),

        // Auth repositories
        Provider(
          create: (context) =>
              AuthRepository(apiClient: context.read<ApiClient>(), secureStorage: context.read()),
        ),
        Provider(
          create: (context) =>
              SignUpRepository(apiClient: context.read<ApiClient>()),
        ),

        Provider(
          create: (context) =>
              TrendRecipesRepository(apiClient: context.read<ApiClient>()),
        ),
        Provider(
          create: (context) => TopChefsRepository(
            apiClient: context.read<ApiClient>(),
          ),
        ),

        ChangeNotifierProvider<LoginViewModel>(
          create: (context) => LoginViewModel(
            authRepo: context.read<AuthRepository>(),
          ),
        ),
        ChangeNotifierProvider<SignUpViewModel>(
          create: (context) =>
              SignUpViewModel(signupRepo: context.read<SignUpRepository>()),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(430, 932),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        routerConfig: RouterClass().router,
      ),
    );
  }
}
