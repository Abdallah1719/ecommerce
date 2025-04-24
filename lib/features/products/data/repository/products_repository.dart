import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/utils/api/error/exception.dart';
import 'package:ecommerce_app/core/utils/api/error/failure.dart';
import 'package:ecommerce_app/features/products/data/data_source/remote_data_source/products_data_source.dart';
import 'package:ecommerce_app/features/products/domain/entities/categories.dart';
import 'package:ecommerce_app/features/products/domain/entities/home_sliders.dart';
import 'package:ecommerce_app/features/products/domain/entities/products_top_rated.dart';
import 'package:ecommerce_app/features/products/domain/repository/base_products_repository.dart';

class ProductsRepository extends BaseProductsRepository {
  final BaseProductsDataSource baseProductsDataSource;

  ProductsRepository(this.baseProductsDataSource);
  @override
  Future<Either<Failure, List<Categories>>> getCategories() async {
    final result = await baseProductsDataSource.getCategories();
    try {
      return Right(result);
    } on ServerException catch (failure) {
      return left(
        ServerFailure(message: failure.errorMessageModel.statusMessage),
      );
    }
  }

  @override
  Future<Either<Failure, List<HomeSliders>>> getHomeSliders() async {
    final result = await baseProductsDataSource.getHomeSliders();
    try {
      return Right(result);
    } on ServerException catch (failure) {
      return left(
        ServerFailure(message: failure.errorMessageModel.statusMessage),
      );
    }
  }

  @override
  Future<Either<Failure, List<ProductsTopRated>>> getProductsTopRated() async {
    final result = await baseProductsDataSource.getProductsTopRated();
    try {
      return Right(result);
    } on ServerException catch (failure) {
      return left(
        ServerFailure(message: failure.errorMessageModel.statusMessage),
      );
    }
  }
}
