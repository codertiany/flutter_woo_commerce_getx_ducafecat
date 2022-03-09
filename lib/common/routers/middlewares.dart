import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../services/index.dart';
import 'index.dart';

class RouteAuthMiddleware extends GetMiddleware {
  RouteAuthMiddleware({int? priority});

  @override
  RouteSettings? redirect(String? route) {
    if (UserService.to.isLogin) {
      return null;
    }
    return const RouteSettings(name: RouteNames.login);
  }
}
