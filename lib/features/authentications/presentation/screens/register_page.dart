import 'package:ecommerce_app/features/authentications/presentation/components/custom_text_field.dart';
import 'package:ecommerce_app/features/authentications/presentation/components/primary_button.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _phoneController = TextEditingController();

  String? _phoneNumber;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // اللوجو
                Image.asset('assets/logo.png', height: 100),

                const SizedBox(height: 32),

                // عنوان الصفحة
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Verify Phone Number',
                    style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                  ),
                ),

                const SizedBox(height: 24),

                // حقل رقم الهاتف
                CustomTextFormField(
                  hintText: 'Phone Number',
                  controller: _phoneController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your phone number';
                    }
                    // تحقق من صيغة رقم الهاتف الدولي
                    final phoneRegex = RegExp(r'^\+\d{10,15}$');
                    if (!phoneRegex.hasMatch(value)) {
                      return 'Invalid phone number format (e.g. +123456789)';
                    }
                    return null;
                  },
                  onSaved: (value) => _phoneNumber = value,
                  keyboardType: TextInputType.phone,
                ),

                const SizedBox(height: 24),

                // زر إرسال الكود
                PrimaryButton(
                  text: 'SEND CODE',
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      // هنا يتم إرسال الكود إلى رقم الهاتف
                      print('Phone Number: $_phoneNumber');
                      // الانتقال إلى صفحة التحقق من الكود
                      // Navigator.pushNamed(context, '/verify');
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
