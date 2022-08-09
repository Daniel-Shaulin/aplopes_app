

import 'package:aplopes_app/src/pages/auth/view/sign_in_screen.dart';
import 'package:aplopes_app/src/pages/auth/view/sign_up_screen.dart';
import 'package:aplopes_app/src/pages/base/base_screen.dart';
import 'package:aplopes_app/src/pages/base/splash_screen.dart';
import 'package:get/get.dart';

abstract class AppPage{

  static final pages = <GetPage>[
    GetPage(
      page: () => SplashScreen(),
      name: '/splash'
    ),
    GetPage(
        name: "/signin",
        page: () => SignInScreen()
    ),
    GetPage(
        name: '/signup',
        page: () => SignUpScreen()
    ),
    GetPage(
        name: '/',
        page: () => BaseScreen()
    ),
  ];
}

abstract class PagesRoutes{
  static const String signInRoute = '/signin';
  static const String signUpRoute = '/signup';
  static const String splashRoute = '/splash';
  static const String baseRout = '/';
}