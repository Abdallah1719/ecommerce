import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/error/failure.dart';
import 'package:ecommerce_app/products/domain/entities/home_sliders.dart';
import 'package:ecommerce_app/products/domain/repository/base_products_repository.dart';

class GetHomeSlidersUseCase {
  final BaseProductsRepository baseProductsRepo;

  GetHomeSlidersUseCase(this.baseProductsRepo);

  Future<Either<Failure, List<HomeSliders>>> execute() async {
    return await baseProductsRepo.getHomeSliders();
  }
}
