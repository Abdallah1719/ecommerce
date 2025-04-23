import 'package:equatable/equatable.dart';

class Login extends Equatable {
  final Data data;

  const Login({required this.data});

  @override
  List<Object?> get props => [data];
}

class Data extends Equatable {
  final String token;
  final String tokenType;
  final User user;
  final int expiresIn;

  const Data({
    required this.token,
    required this.tokenType,
    required this.user,
    required this.expiresIn,
  });

  @override
  List<Object?> get props => [token, tokenType, user, expiresIn];
}

class User extends Equatable {
  final int id;
  final String firstName;
  final String email;
  final String mobile;

  const User({
    required this.id,
    required this.firstName,

    required this.email,
    required this.mobile,
  });

  @override
  List<Object?> get props => [id, firstName, email, mobile];
}
