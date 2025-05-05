import 'package:ecommerce_app/core/utils/resources/app_strings.dart';
import 'package:ecommerce_app/features/auth/presentation/screens/forget_password_screen.dart';
import 'package:ecommerce_app/features/auth/presentation/screens/login_screen.dart';
import 'package:ecommerce_app/features/auth/presentation/screens/register_screen.dart';
import 'package:ecommerce_app/features/products/presentation/screens/home_screen.dart';
import 'package:ecommerce_app/features/splash_screen/persentation/splash_screen.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static const splashRoute = '/splash';
  static const loginRoute = '/login';
  static const registerRoute = '/register';
  static const homeScreenRoute = '/homeScreen';
  static const forgetPasswordRoute = '/forgetPasswordScreen';
  // static Map<String, WidgetBuilder> routes = {
  //   '/': (context) => HomeScreen(),
  //   '/login': (context) => const LoginPage(),
  //   '/register': (context) => const RegisterPage(),
  // };
}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.splashRoute:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case AppRoutes.loginRoute:
        return MaterialPageRoute(builder: (_) => const LoginPage());
      case AppRoutes.registerRoute:
        return MaterialPageRoute(builder: (_) => const RegisterPage());
      case AppRoutes.homeScreenRoute:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case AppRoutes.forgetPasswordRoute:
        return MaterialPageRoute(builder: (_) => const ForgetPasswordScreen());
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
