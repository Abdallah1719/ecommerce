import 'package:equatable/equatable.dart';

class Login extends Equatable {
  final String token;
  final String email;
  final String mobile;

  const Login({required this.token, required this.email, required this.mobile});

  @override
  List<Object?> get props => [token, email, mobile];
}

// class Data extends Equatable {
//   final String token;
//   final String tokenType;
//   final User user;
//   final int expiresIn;

//   const Data({
//     required this.token,
//     required this.tokenType,
//     required this.user,
//     required this.expiresIn,
//   });

//   @override
//   List<Object?> get props => [token, tokenType, user, expiresIn];
// }

// class User extends Equatable {
//   final int id;
//   final String firstName;
//   final String email;
//   final String mobile;

//   const User({
//     required this.id,
//     required this.firstName,

//     required this.email,
//     required this.mobile,
//   });

//   @override
//   List<Object?> get props => [id, firstName, email, mobile];
// }
