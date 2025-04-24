import 'package:bloc/bloc.dart';

import 'package:ecommerce_app/core/utils/enums.dart';
import 'package:ecommerce_app/features/authentications/data/repository/login_repository.dart';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginRepository loginRepository;
  final formKey = GlobalKey<FormState>();
  final TextEditingController mobileController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  LoginCubit(this.loginRepository) : super(LoginState());

  Future<void> loginUser() async {
    emit(LoginState(loginState: RequestState.loading));
    final result = await loginRepository.loginUser(
      mobile: mobileController.text,
      password: passwordController.text,
    );
    print('ttttttttt$result');
    result.fold(
      (Failure) {
        emit(LoginState(loginState: RequestState.error));
      },
      (token) {
        emit(LoginState(loginState: RequestState.loaded));
      },
    );
  }

  void loginValidate() {
    if (formKey.currentState!.validate()) {
      loginUser();
    }
  }
}
