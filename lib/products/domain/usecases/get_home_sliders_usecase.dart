import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/error/failure.dart';
import 'package:ecommerce_app/core/usecase/base_usecase.dart';
import 'package:ecommerce_app/products/domain/entities/home_sliders.dart';
import 'package:ecommerce_app/products/domain/repository/base_products_repository.dart';

class GetHomeSlidersUseCase extends BaseUsecase<List<HomeSliders>> {
  final BaseProductsRepository baseProductsRepo;

  GetHomeSlidersUseCase(this.baseProductsRepo);

  @override
  Future<Either<Failure, List<HomeSliders>>> call() async {
    return await baseProductsRepo.getHomeSliders();
  }
}
