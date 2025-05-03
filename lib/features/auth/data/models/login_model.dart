import 'package:ecommerce_app/features/auth/domain/entities/login.dart';

class LoginModel extends Login {
  const LoginModel({
    required super.token,
    required super.email,
    required super.mobile,
  });

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
    token: json["data"]["token"],
    email: json["data"]["user"]["email"],
    mobile: json["data"]["user"]["mobile"],
  );
}
