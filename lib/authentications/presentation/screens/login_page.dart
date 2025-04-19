import 'package:ecommerce_app/authentications/presentation/components/custom_text_field.dart';
import 'package:ecommerce_app/authentications/presentation/components/primary_button.dart';
import 'package:ecommerce_app/authentications/presentation/components/secondary_button.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  String? _email;
  String? _password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: ListView(
            children: [
              Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // اللوجو
                    Image.asset('asstes/omda_logo.png', height: 100),

                    const SizedBox(height: 32),

                    // عنوان الصفحة
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Login',
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),

                    const SizedBox(height: 24),

                    CustomTextFormField(
                      hintText: 'Phone or Email',
                      controller: _emailController,
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
                      controller: _passwordController,
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
                          /* إضافة منطق النسيان */
                        },
                        child: const Text('Forget Password?'),
                      ),
                    ),

                    const SizedBox(height: 16),

                    // زر التسجيل
                    PrimaryButton(
                      text: 'LOGIN',
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          _formKey.currentState!.save();
                          // إضافة منطق التسجيل هنا
                          print('Email: $_email');
                          print('Password: $_password');
                        }
                      },
                    ),

                    const SizedBox(height: 16),

                    // زر إنشاء حساب
                    SecondaryButton(
                      text: "Don't have an account? Register",
                      onPressed: () {
                        Navigator.pushNamed(context, '/register');
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
  }
}
