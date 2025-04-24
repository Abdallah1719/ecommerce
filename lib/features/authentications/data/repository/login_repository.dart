import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/utils/error/exception.dart';
import 'package:ecommerce_app/core/utils/error/failure.dart';
import 'package:ecommerce_app/features/authentications/data/data_source/login_data_source.dart';
import 'package:ecommerce_app/features/authentications/domain/entities/login.dart';
import 'package:ecommerce_app/features/authentications/domain/repository/base_login_repository.dart';

class LoginRepository implements BaseLoginRepository {
  final BaseLoginDataSource baseLoginDataSource;

  LoginRepository({required this.baseLoginDataSource});
  @override
  Future<Either<Failure, Login>> loginUser({
    required String mobile,
    required String password,
  }) async {
    final result = await baseLoginDataSource.loginUser(
      mobile: mobile,
      password: password,
    );
    try {
      return Right(result);
    } on ServerException catch (failure) {
      return left(
        ServerFailure(message: failure.errorMessageModel.statusMessage),
      );
    }
  }
}
