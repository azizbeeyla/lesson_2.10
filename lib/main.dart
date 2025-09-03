import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hive/hive.dart';
import 'package:lesson2_10/core/clients/dio_cielent.dart';
import 'package:lesson2_10/core/interceptor.dart';
import 'package:lesson2_10/data/repositry/community_repostriy.dart';
import 'package:lesson2_10/data/repositry/login_repositiry.dart';
import 'package:lesson2_10/data/repositry/me_repositriy.dart';
import 'package:lesson2_10/data/repositry/review_repository/review_add.dart';
import 'package:lesson2_10/data/repositry/review_repository/review_comment.dart';
import 'package:lesson2_10/data/repositry/review_repository/review_repostriy.dart';
import 'package:lesson2_10/data/repositry/sign_up_repostriy.dart';
import 'package:lesson2_10/data/repositry/topchefs/top_chefs_detaiil.dart';
import 'package:lesson2_10/data/repositry/your_recipe_repositiry/your_repositriy.dart';
import 'package:lesson2_10/features/authenfiaction/managers/sign_up_viewmodel.dart';
import 'package:lesson2_10/features/your_recipes/managers/your_recipe_viewmodel.dart';
import 'package:provider/provider.dart';
import 'core/router/router_class.dart';
import 'core/utils/app_theme.dart';
import 'core/utils/apptheme_provider.dart';
import 'data/adapter/category_adapter.dart';
import 'data/models/categorymodels/sourse_model.dart';
import 'data/repositry/topchefs/top_chefs.dart';
import 'data/repositry/trending_repostries.dart';
import 'features/authenfiaction/managers/login_view_model.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  Hive.registerAdapter(SourseModelAdapter());
  await Hive.openBox<SourseModel>('sources');
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
Provider(create: (context)=>CommunityRepository(apiClient: context.read())),
        Provider(
          create: (context) =>
              TrendRecipesRepository(apiClient: context.read<ApiClient>()),
        ),
        Provider(
          create: (context) => TopChefsRepository(
            apiClient: context.read<ApiClient>(),
          ),
        ),
        ChangeNotifierProvider(create: (_) => AppthemeProvider()),
        Provider(create: (context)=>YourRecipeRepository(apiClient: context.read())),
        Provider(create: (context)=>ReviewRepositry(apiClient: context.read())),
        Provider(create: (context) => MeRepositiry(apiClient: context.read()),),
        Provider(create: (context)=>ReviewsCommentRepository(apiClient: context.read())),
        Provider(create: (context)=>ReviewsAddRepository(apiClient: context.read())),
        Provider(create: (context)=>TopChefDetailRepository(apiClient: context.read())),
        ChangeNotifierProvider<LoginViewModel>(
          create: (context) => LoginViewModel(
            authRepo: context.read<AuthRepository>(),
          ),
        ),
        ChangeNotifierProvider<SignUpViewModel>(
          create: (context) =>
              SignUpViewModel(signupRepo: context.read<SignUpRepository>()),
        ),
        ChangeNotifierProvider(create: (context)=>YourRecipeViewModel(yourRecipesRepo: context.read()))
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = context.watch<AppthemeProvider>();
    return ScreenUtilInit(
      designSize: const Size(430, 932),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MaterialApp.router(
        theme: AppTheme.light,
        darkTheme: AppTheme.dark,
        themeMode: themeProvider.isDarkMode
            ? ThemeMode.dark
            : ThemeMode.light,
        debugShowCheckedModeBanner: false,
        routerConfig: RouterClass().router,
      ),
    );
  }
}
