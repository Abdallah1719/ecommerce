import 'package:ecommerce_app/core/utils/api/api_constances.dart';
import 'package:ecommerce_app/core/utils/api/api_methods.dart';

import 'package:ecommerce_app/core/utils/error/exception.dart';
import 'package:ecommerce_app/features/auth/data/models/login_model.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final ApiMethods api;
  final formKey = GlobalKey<FormState>();
  final TextEditingController mobileController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  LoginCubit(this.api) : super(LoginInitial());
  LoginModel? user;
  Future<void> loginUser() async {
    try {
      emit(Loginlodding());
      final response = await api.post(
        ApiConstances.loginPath,
        data: {
          'mobile': mobileController.text,
          'password': passwordController.text,
        },
      );
      user = LoginModel.fromJson(response);
      final decodedToken = JwtDecoder.decode(user!.token);

      emit(Loginsucess());
    } on ServerException catch (e) {
      emit(Loginfailure(errorMassage: e.errorMessageModel.statusMessage));
    }
  }

  // Future<void> loginUser() async {
  //   final result = await loginUsecase();
  //   result.fold(
  //     (l) => emit(LoginState(loginState: RequestState.error)),
  //     (r) => emit(LoginState(loginState: RequestState.loaded)),
  //   );
  // }

  // Future<void> loginUser() async {
  //   emit(LoginState(loginState: RequestState.loading));
  //   final result = await loginRepository.loginUser(
  //     mobile: mobileController.text,
  //     password: passwordController.text,
  //   );
  //   print('ttttttttt$result');
  //   result.fold(
  //     (Failure) {
  //       emit(LoginState(loginState: RequestState.error));
  //     },
  //     (token) {
  //       emit(LoginState(loginState: RequestState.loaded));
  //     },
  //   );
  // }

  // void loginValidate() {
  //   if (formKey.currentState!.validate()) {
  //     loginUser();
  //   }
  // }
}
