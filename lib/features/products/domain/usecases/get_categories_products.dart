import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/usecase/base_usecase.dart';
import 'package:ecommerce_app/core/utils/error/failure.dart';
import 'package:ecommerce_app/features/products/domain/entities/categories_details.dart';
import 'package:ecommerce_app/features/products/domain/repository/base_products_repository.dart';

class GetCategoriesProducts extends BaseUsecase<List<CategoriesProducts>> {
  final BaseProductsRepository baseProductsRepo;

  GetCategoriesProducts(this.baseProductsRepo);

  @override
  Future<Either<Failure, List<CategoriesProducts>>> call() async {
    return await baseProductsRepo.getCategoriesProducts();
  }
}
