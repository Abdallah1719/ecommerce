import 'package:ecommerce_app/products/domain/entities/categories.dart';
import 'package:ecommerce_app/products/domain/entities/home_sliders.dart';
import 'package:ecommerce_app/products/domain/entities/products_top_rated.dart';

abstract class BaseProductsRepo {
  Future<List<HomeSliders>> getHomeSliders();
  Future<List<Categories>> getCategories();
  Future<List<ProductsTopRated>> getProductsTopRated();
}
