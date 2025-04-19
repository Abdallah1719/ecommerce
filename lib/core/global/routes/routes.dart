import 'package:ecommerce_app/authentications/presentation/screens/login_page.dart';
import 'package:ecommerce_app/authentications/presentation/screens/register_page.dart';
import 'package:ecommerce_app/products/presentation/screens/home_screen.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static Map<String, WidgetBuilder> routes = {
    '/': (context) => HomeScreen(),
    '/login': (context) => const LoginPage(),
    '/register': (context) => const RegisterPage(),
  };
}
