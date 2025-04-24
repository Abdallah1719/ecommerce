import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/utils/api/error/failure.dart';
import 'package:ecommerce_app/features/products/domain/entities/categories.dart';
import 'package:ecommerce_app/features/products/domain/entities/home_sliders.dart';
import 'package:ecommerce_app/features/products/domain/entities/products_top_rated.dart';

abstract class BaseProductsRepository {
  Future<Either<Failure, List<HomeSliders>>> getHomeSliders();
  Future<Either<Failure, List<Categories>>> getCategories();
  Future<Either<Failure, List<ProductsTopRated>>> getProductsTopRated();
}
