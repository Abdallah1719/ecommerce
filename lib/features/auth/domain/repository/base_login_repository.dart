import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/utils/error/failure.dart';
import 'package:ecommerce_app/features/auth/domain/entities/login.dart';

abstract class BaseLoginRepository {
  Future<Either<Failure, Login>> loginUser({
    required String mobile,
    required String password,
  });
}
