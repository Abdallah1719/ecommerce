import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:ecommerce_app/core/error/exception.dart';
import 'package:ecommerce_app/core/network/api_constances.dart';
import 'package:ecommerce_app/core/network/error_message_model.dart';
import 'package:ecommerce_app/core/network/network_helper.dart';
import 'package:ecommerce_app/features/authentications/data/models/login_model.dart';

abstract class BaseLoginDataSource {
  Future<LoginModel> loginUser({
    required final String mobile,
    required final String password,
  });
}

class LoginDataSource extends BaseLoginDataSource {
  final NetworkHelper networkHelper;

  LoginDataSource(this.networkHelper);

  @override
  Future<LoginModel> loginUser({
    required final String mobile,
    required final String password,
  }) async {
    Response response = await networkHelper.post(
      path: ApiConstances.loginPath,
      data: {'mobile': mobile, 'password': password},
    );
    if (response.statusCode == 200) {
      log('${response.data}');
      return LoginModel.fromJson(response.data);
    } else {
      return throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }
}
