import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/error/failure.dart';
import 'package:ecommerce_app/products/domain/entities/categories.dart';
import 'package:ecommerce_app/products/domain/repository/base_products_repository.dart';

class GetCategoriesUseCase {
  final BaseProductsRepository baseProductsRepo;

  GetCategoriesUseCase({required this.baseProductsRepo});

  Future<Either<Failure, List<Categories>>> execute() async {
    return await baseProductsRepo.getCategories();
  }
}
