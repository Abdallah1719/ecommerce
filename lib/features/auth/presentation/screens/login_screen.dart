import 'package:dio/dio.dart';
import 'package:ecommerce_app/core/common/routes/routes.dart';
import 'package:ecommerce_app/core/utils/api/dio_methods.dart';
import 'package:ecommerce_app/core/utils/resources/app_images.dart';
import 'package:ecommerce_app/core/utils/resources/index.dart';
import 'package:ecommerce_app/core/common/widgets/custom_text_field.dart';
import 'package:ecommerce_app/features/auth/presentation/components/custom_app_bar.dart';
import 'package:ecommerce_app/features/auth/presentation/components/primary_button.dart';
import 'package:ecommerce_app/features/auth/presentation/components/secondary_button.dart';
import 'package:ecommerce_app/features/auth/presentation/controller/cubit/login_cubit.dart';
import 'package:ecommerce_app/l10n/cubit/local_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String? _email;
  String? _password;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(DioMethods(dio: Dio())),
      child: BlocConsumer<LoginCubit, LoginState>(
        listener: (context, state) {},
        builder: (context, state) {
          return BlocBuilder<LoginCubit, LoginState>(
            builder: (context, state) {
              var c = context.read<LoginCubit>();
              return Scaffold(
                backgroundColor: R.colors.white,
                appBar: CustomAppBar(),
                body: SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: ListView(
                      children: [
                        Form(
                          key: c.formKey,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              // اللوجو
                              Image.asset(AppImages.splashLogo, height: 100),

                              const SizedBox(height: 32),

                              // عنوان الصفحة
                              Align(
                                alignment:
                                    LocaleCubit.isArabic()
                                        ? Alignment.centerRight
                                        : Alignment.centerLeft,
                                child: Text(
                                  'Login',
                                  style:
                                      Theme.of(context).textTheme.headlineLarge,
                                ),
                              ),

                              const SizedBox(height: 24),

                              CustomTextFormField(
                                hintText: 'Phone or Email',
                                controller: c.mobileController,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter your email or phone';
                                  }
                                  return null;
                                },
                                onSaved: (value) => _email = value,
                              ),

                              // حقل كلمة المرور
                              CustomTextFormField(
                                hintText: 'Password',
                                obscureText: true,
                                controller: c.passwordController,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter your password';
                                  }
                                  if (value.length < 6) {
                                    return 'Password must be at least 6 characters';
                                  }
                                  return null;
                                },
                                onSaved: (value) => _password = value,
                              ),

                              // نسيت كلمة المرور
                              Align(
                                alignment: Alignment.centerRight,
                                child: TextButton(
                                  onPressed: () {
                                    Navigator.pushNamed(
                                      context,
                                      AppRoutes.forgetPasswordRoute,
                                    );
                                  },
                                  child: Text(
                                    'Forget Password?',
                                    style: TextStyle(color: R.colors.darkgreen),
                                  ),
                                ),
                              ),

                              const SizedBox(height: 16),

                              PrimaryButton(
                                text: 'LOGIN',
                                onPressed: () {
                                  c.loginUser();
                                  Navigator.pushNamed(
                                    context,
                                    AppRoutes.homeScreenRoute,
                                  );
                                },
                              ),

                              const SizedBox(height: 16),

                              SecondaryButton(
                                text: "Don't have an account? Register",
                                onPressed: () {
                                  Navigator.pushNamed(
                                    context,
                                    AppRoutes.registerRoute,
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
