import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/utils/error/failure.dart';
import 'package:ecommerce_app/core/usecase/base_usecase.dart';
import 'package:ecommerce_app/features/authentications/domain/entities/login.dart';
import 'package:ecommerce_app/features/authentications/domain/repository/base_login_repository.dart';

class LoginUsecase extends BaseUsecase<Login> {
  final BaseLoginRepository baseLoginRepository;
  final String mobile;
  final String password;

  LoginUsecase(this.baseLoginRepository, this.mobile, this.password);
  @override
  Future<Either<Failure, Login>> call() async {
    return await baseLoginRepository.loginUser(
      mobile: mobile,
      password: password,
    );
  }
}
