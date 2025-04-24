part of 'login_cubit.dart';

class LoginState extends Equatable {
  final RequestState loginState;
  const LoginState({this.loginState = RequestState.loading});

  @override
  List<Object> get props => [loginState];
}
