import 'package:ecommerce_app/core/utils/resources/app_strings.dart';
import 'package:ecommerce_app/core/utils/services/service_locator.dart';
import 'package:ecommerce_app/features/auth/presentation/screens/forget_password_screen.dart';
import 'package:ecommerce_app/features/auth/presentation/screens/login_screen.dart';
import 'package:ecommerce_app/features/auth/presentation/screens/register_screen.dart';
import 'package:ecommerce_app/features/products/presentation/controller/bloc/home_bloc.dart';
import 'package:ecommerce_app/features/products/presentation/screens/categories_products_screen.dart';
import 'package:ecommerce_app/features/products/presentation/screens/categories_screen.dart';
import 'package:ecommerce_app/features/products/presentation/screens/home_screen.dart';
import 'package:ecommerce_app/features/splash_screen/persentation/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRoutes {
  static const splashRoute = '/splash';
  static const loginRoute = '/login';
  static const registerRoute = '/register';
  static const homeScreenRoute = '/homeScreen';
  static const forgetPasswordRoute = '/forgetPasswordScreen';
  static const categoriesScreen = '/categoriesScreen';
  static const categoriesDetailsScreen = '/categoriesDetailsScreen';
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
        return MaterialPageRoute(
          builder:
              (_) => BlocProvider(
                create: (_) => sl<HomeBloc>()..add(GetCategoriesEvent()),
                child: const HomeScreen(),
              ),
        );
      case AppRoutes.forgetPasswordRoute:
        return MaterialPageRoute(builder: (_) => const ForgetPasswordScreen());
      case AppRoutes.categoriesScreen:
        // هنفحص إذا كان الـ arguments هو HomeBloc
        final HomeBloc? homeBloc = settings.arguments as HomeBloc?;

        if (homeBloc != null) {
          return MaterialPageRoute(
            builder:
                (_) => BlocProvider.value(
                  value: homeBloc,
                  child: const CategoriesScreen(),
                ),
          );
        }

        // لو مش موجود، نرجع بشاشة error أو نعمل fallback
        return unDefinedRoute();
      case AppRoutes.categoriesDetailsScreen:
        final HomeBloc? homeBloc = settings.arguments as HomeBloc?;
        if (homeBloc != null) {
          return MaterialPageRoute(
            builder:
                (_) => BlocProvider.value(
                  value: homeBloc,
                  child: const CategoriesProductsScreen(),
                ),
          );
        }

        // لو مش موجود، نرجع بشاشة error أو نعمل fallback
        return unDefinedRoute();
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
