import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:ecommerce_app/core/utils/api/api_methods.dart';
import 'package:ecommerce_app/core/utils/error/exception.dart';
import 'package:ecommerce_app/core/utils/api/api_constances.dart';
import 'package:ecommerce_app/core/utils/error/error_message_model.dart';
import 'package:ecommerce_app/core/utils/api/network_helper.dart';
import 'package:ecommerce_app/features/authentications/data/models/login_model.dart';

abstract class BaseLoginDataSource {
  Future loginUser({
    required final String mobile,
    required final String password,
  });
}

class LoginDataSource extends BaseLoginDataSource {
  final ApiMethods api;

  LoginDataSource(this.api);

  @override
  Future loginUser({required String mobile, required String password}) async {
    try {
      final response = await api.post(
        ApiConstances.loginPath,
        data: {'mobile': mobile, 'password': password},
      );
    } on DioException catch (e) {
      handleDioExceptions(e);
    }
  }

  // @override
  // Future<LoginModel> loginUser({
  //   required final String mobile,
  //   required final String password,
  // }) async {
  //   Response response = await networkHelper.post(
  //     path: ApiConstances.loginPath,
  //     data: {'mobile': mobile, 'password': password},
  //   );
  //   if (response.statusCode == 200) {
  //     log('${response.data}');
  //     return LoginModel.fromJson(response.data);
  //   } else {
  //     return throw ServerException(
  //       errorMessageModel: ErrorMessageModel.fromJson(response.data),
  //     );
  //   }
  // }
}
