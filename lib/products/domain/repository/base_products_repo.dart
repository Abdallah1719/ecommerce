import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/error/failure.dart';
import 'package:ecommerce_app/products/domain/entities/categories.dart';
import 'package:ecommerce_app/products/domain/entities/home_sliders.dart';
import 'package:ecommerce_app/products/domain/entities/products_top_rated.dart';

abstract class BaseProductsRepo {
  Future<Either<Failure, List<HomeSliders>>> getHomeSliders();
  Future<Either<Failure, List<Categories>>> getCategories();
  Future<Either<Failure, List<ProductsTopRated>>> getProductsTopRated();
}
