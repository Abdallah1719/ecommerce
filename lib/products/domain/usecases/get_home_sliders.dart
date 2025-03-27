import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/error/failure.dart';
import 'package:ecommerce_app/products/domain/entities/home_sliders.dart';
import 'package:ecommerce_app/products/domain/repository/base_products_repo.dart';

class GetHomeSliders {
  final BaseProductsRepo baseProductsRepo;

  GetHomeSliders({required this.baseProductsRepo});

  Future<Either<Failure, List<HomeSliders>>> execute() async {
    return await baseProductsRepo.getHomeSliders();
  }
}
