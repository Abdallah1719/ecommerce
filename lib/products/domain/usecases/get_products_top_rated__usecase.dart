import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/error/failure.dart';
import 'package:ecommerce_app/core/usecase/base_usecase.dart';
import 'package:ecommerce_app/products/domain/entities/products_top_rated.dart';
import 'package:ecommerce_app/products/domain/repository/base_products_repository.dart';

class GetProductsTopRatedUseCase extends BaseUsecase<List<ProductsTopRated>> {
  final BaseProductsRepository baseProductsRepo;

  GetProductsTopRatedUseCase(this.baseProductsRepo);

  @override
  Future<Either<Failure, List<ProductsTopRated>>> call() async {
    return await baseProductsRepo.getProductsTopRated();
  }
}
