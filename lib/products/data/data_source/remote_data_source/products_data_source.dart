import 'package:dio/dio.dart';
import 'package:ecommerce_app/core/error/exception.dart';
import 'package:ecommerce_app/core/network/api_constances.dart';
import 'package:ecommerce_app/core/network/error_message_model.dart';
import 'package:ecommerce_app/products/data/models/categories_model.dart';
import 'package:ecommerce_app/products/data/models/home_sliders_model.dart';
import 'package:ecommerce_app/products/data/models/products_top_rated_model.dart';

abstract class BaseProductsDataSource {
  Future<List<HomeSlidersModel>> getHomeSliders();
  Future<List<CategoriesModel>> getCategories();
  Future<List<ProductsTopRatedModel>> getProductsTopRated();
}

class ProductsDataSource extends BaseProductsDataSource {
  @override
  Future<List<HomeSlidersModel>> getHomeSliders() async {
    final response = await Dio().get(ApiConstances.homeSliderPath);
    if (response.statusCode == 200) {
      return List<HomeSlidersModel>.from(
        (response.data["data"] as List).map(
          (e) => HomeSlidersModel.fromJson(e),
        ),
      );
    } else {
      return throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }

  @override
  Future<List<CategoriesModel>> getCategories() async {
    final response = await Dio().get(ApiConstances.categoriesPath);
    if (response.statusCode == 200) {
      return List<CategoriesModel>.from(
        (response.data["data"] as List).map((e) => CategoriesModel.fromJson(e)),
      );
    } else {
      return throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }

  @override
  Future<List<ProductsTopRatedModel>> getProductsTopRated() async {
    final response = await Dio().get(ApiConstances.productsTopRatedPath);
    print(
      'rrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrr{$response}',
    );
    if (response.statusCode == 200) {
      return List<ProductsTopRatedModel>.from(
        (response.data["data"]["data"] as List).map(
          (e) => ProductsTopRatedModel.fromJson(e),
        ),
      );
    } else {
      return throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }
}
