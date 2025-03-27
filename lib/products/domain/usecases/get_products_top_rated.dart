import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/error/failure.dart';
import 'package:ecommerce_app/products/domain/entities/products_top_rated.dart';
import 'package:ecommerce_app/products/domain/repository/base_products_repo.dart';

class GetProductsTopRated {
  final BaseProductsRepo baseProductsRepo;

  GetProductsTopRated({required this.baseProductsRepo});

  Future<Either<Failure, List<ProductsTopRated>>> execute() async {
    return await baseProductsRepo.getProductsTopRated();
  }
}
