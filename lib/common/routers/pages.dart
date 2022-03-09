import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../pages/index.dart';
import 'index.dart';

class RoutePages {
  static final RouteObserver<Route> observer = RouteObservers();
  static List<String> history = [];

  static List<GetPage> list = [
    // 无需登录
    GetPage(
      name: RouteNames.splash,
      page: () => const SplashPage(),
    ),
    GetPage(
      name: RouteNames.welcome,
      page: () => const WelcomePage(),
    ),
    GetPage(
      name: RouteNames.main,
      page: () => const MainPage(),
      transitionDuration: Duration.zero,
    ),
    GetPage(
      name: RouteNames.login,
      page: () => const LoginPage(),
    ),
    GetPage(
      name: RouteNames.register,
      page: () => const RegisterPage(),
    ),
    GetPage(
      name: RouteNames.registerPin,
      page: () => const RegisterPinPage(),
    ),
    GetPage(
      name: RouteNames.forgot,
      page: () => const ForgotPage(),
    ),
    GetPage(
      name: RouteNames.userAgreement,
      page: () => const UserAgreementPage(),
    ),
  ];
}
