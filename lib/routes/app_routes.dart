import 'package:flutter/material.dart';
import 'package:crypto_login_register/pages/dashboard.dart';
import 'package:crypto_login_register/pages/login.dart';
import 'package:crypto_login_register/pages/register.dart';

class AppRoutes {
  static const String dashboardPage = '/dashboard_page';

  static const String loginPage = '/login_page';

  static const String registerPage = '/register_page';

  static Map<String, WidgetBuilder> routes = {
    dashboardPage: (context) => DashboardPage(),
    loginPage: (context) => LoginPage(),
    registerPage: (context) => RegisterPage(),
  };
}
