import 'package:ecommerce_app/authentications/presentation/screens/login_page.dart';
import 'package:ecommerce_app/authentications/presentation/screens/register_page.dart';
import 'package:ecommerce_app/core/global/app_strings.dart';
import 'package:ecommerce_app/products/presentation/screens/home_screen.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static const splashRoute = '/';
  static const loginRoute = '/login';
  static const registerRoute = '/register';
  static const forgetPasswordRoute = '/forgetPassword';
  static const homeScreenRoute = '/homeScreen';
  // static Map<String, WidgetBuilder> routes = {
  //   '/': (context) => HomeScreen(),
  //   '/login': (context) => const LoginPage(),
  //   '/register': (context) => const RegisterPage(),
  // };
}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.loginRoute:
        return MaterialPageRoute(builder: (_) => const LoginPage());
      case AppRoutes.registerRoute:
        return MaterialPageRoute(builder: (_) => const RegisterPage());
      case AppRoutes.homeScreenRoute:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
      builder:
          (_) => Scaffold(body: Center(child: Text(AppStrings.noRouteFound))),
    );
  }
}
