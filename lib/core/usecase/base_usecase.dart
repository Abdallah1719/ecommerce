import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/utils/api/error/failure.dart';

abstract class BaseUsecase<T> {
  Future<Either<Failure, T>> call();
}
