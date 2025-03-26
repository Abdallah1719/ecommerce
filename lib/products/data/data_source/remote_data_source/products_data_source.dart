import 'package:dio/dio.dart';
import 'package:ecommerce_app/core/error/exception.dart';
import 'package:ecommerce_app/core/network/api_constances.dart';
import 'package:ecommerce_app/core/network/error_message_model.dart';
import 'package:ecommerce_app/products/data/models/home_sliders_model.dart';

abstract class BaseProductsDataSource {
  Future<List<HomeSlidersModel>> getHomeSliders();
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
}
