part of 'login_cubit.dart';

class LoginState {
  // final login;
  // final RequestState loginState;
  const LoginState();
}

final class LoginInitial extends LoginState {}

final class Loginlodding extends LoginState {}

final class Loginsucess extends LoginState {}

final class Loginfailure extends LoginState {
  final String errorMassage;

  Loginfailure({required this.errorMassage});
}
