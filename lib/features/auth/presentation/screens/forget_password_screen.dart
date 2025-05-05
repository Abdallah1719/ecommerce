import 'package:ecommerce_app/core/common/widgets/custom_text_field.dart';
import 'package:ecommerce_app/core/utils/resources/space_widget.dart';
import 'package:ecommerce_app/features/auth/presentation/components/custom_app_bar.dart';
import 'package:ecommerce_app/features/auth/presentation/components/primary_button.dart';
import 'package:flutter/material.dart';

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({super.key});

  @override
  State<ForgetPasswordScreen> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<ForgetPasswordScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _phoneController = TextEditingController();

  String? _phoneNumber;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                VerticalSpace(2),
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    'Forget Password',
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                ),
                VerticalSpace(15),
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
                  text: 'Send Code',
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
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
