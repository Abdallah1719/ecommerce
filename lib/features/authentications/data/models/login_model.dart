import 'package:ecommerce_app/features/authentications/domain/entities/login.dart';

class LoginModel extends Login {
  const LoginModel({
    required super.token,
    required super.email,
    required super.mobile,
  });

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
    token: json["token"],
    email: json["email"],
    mobile: json["mobile"],
  );
}
