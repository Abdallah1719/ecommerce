import 'package:ecommerce_app/core/global/routes/routes.dart';
import 'package:ecommerce_app/core/global/theme/cubit/theme_cubit.dart';
import 'package:ecommerce_app/generated/l10n.dart';
import 'package:ecommerce_app/l10n/cubit/local_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => LocaleCubit()..loadSavedLocale()),
        BlocProvider(create: (context) => ThemeCubit()..loadSavedTheme()),
      ],
      child: BlocBuilder<LocaleCubit, String>(
        builder: (context, locale) {
          return BlocBuilder<ThemeCubit, ThemeState>(
            builder: (context, state) {
              return MaterialApp(
                title: "Notes",
                debugShowCheckedModeBanner: false,
                supportedLocales: S.delegate.supportedLocales,
                localizationsDelegates: LocaleCubit.localizationsDelegates,
                locale: Locale(locale),
                theme: context.read<ThemeCubit>().currentTheme(),
                themeAnimationStyle: AnimationStyle(
                  duration: Duration(seconds: 2),
                  curve: Curves.decelerate,
                ),
                initialRoute: '/login',
                routes: AppRoutes.routes,
              );
            },
          );
        },
      ),
    );
  }
}
