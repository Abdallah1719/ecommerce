import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/error/failure.dart';
import 'package:ecommerce_app/products/domain/entities/categories.dart';
import 'package:ecommerce_app/products/domain/repository/base_products_repo.dart';

class GetCategories {
  final BaseProductsRepo baseProductsRepo;

  GetCategories({required this.baseProductsRepo});

  Future<Either<Failure, List<Categories>>> execute() async {
    return await baseProductsRepo.getCategories();
  }
}
