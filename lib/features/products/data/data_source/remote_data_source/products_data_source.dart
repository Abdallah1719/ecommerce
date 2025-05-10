import 'package:dio/dio.dart';
import 'package:ecommerce_app/core/utils/error/exception.dart';
import 'package:ecommerce_app/core/utils/api/api_constances.dart';
import 'package:ecommerce_app/core/utils/error/error_message_model.dart';
import 'package:ecommerce_app/features/products/data/models/categories_model.dart';
import 'package:ecommerce_app/features/products/data/models/categories_products_model.dart';
import 'package:ecommerce_app/features/products/data/models/home_sliders_model.dart';
import 'package:ecommerce_app/features/products/data/models/products_top_rated_model.dart';
import 'package:ecommerce_app/features/products/domain/entities/categories_details.dart';
import 'package:ecommerce_app/features/products/domain/usecases/get_categories_products.dart';

abstract class BaseProductsDataSource {
  Future<List<HomeSlidersModel>> getHomeSliders();
  Future<List<CategoriesModel>> getCategories();
  Future<List<ProductsTopRatedModel>> getProductsTopRated();
  Future<List<CategoriesProducts>> GetCategoriesProducts();
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

  @override
  Future<List<CategoriesProducts>> GetCategoriesProducts() async {
    final response = await Dio().get(ApiConstances.categoriesProductsPath);
    if (response.statusCode == 200) {
      return List<CategoriesProducts>.from(
        (response.data["data"]["data"] as List).map(
          (e) => CategoriesProductsModel.fromJson(e),
        ),
      );
    } else {
      return throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }
}
