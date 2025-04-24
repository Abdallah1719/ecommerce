import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/utils/error/failure.dart';
import 'package:ecommerce_app/core/usecase/base_usecase.dart';
import 'package:ecommerce_app/features/products/domain/entities/categories.dart';
import 'package:ecommerce_app/features/products/domain/repository/base_products_repository.dart';

class GetCategoriesUseCase extends BaseUsecase<List<Categories>> {
  final BaseProductsRepository baseProductsRepo;

  GetCategoriesUseCase(this.baseProductsRepo);

  @override
  Future<Either<Failure, List<Categories>>> call() async {
    return await baseProductsRepo.getCategories();
  }
}
