import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/error/failure.dart';
import 'package:ecommerce_app/products/domain/entities/products_top_rated.dart';
import 'package:ecommerce_app/products/domain/repository/base_products_repository.dart';

class GetProductsTopRatedUseCase {
  final BaseProductsRepository baseProductsRepo;

  GetProductsTopRatedUseCase({required this.baseProductsRepo});

  Future<Either<Failure, List<ProductsTopRated>>> execute() async {
    return await baseProductsRepo.getProductsTopRated();
  }
}
