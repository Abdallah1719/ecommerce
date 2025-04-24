import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:ecommerce_app/core/network/api_constances.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class NetworkHelper {
  final Dio dio;

  NetworkHelper(this.dio);

  Future<Response> post({
    required String path,
    required Map<String, dynamic> data,
  }) async {
    Response response = await dio.post(
      path,
      data: data,
      options: Options(headers: {}),
    );
    return response;
  }

  Future dioInit() async {
    log('ffff');
    final dio = Dio(
      // BaseOptions(
      //   headers: {},
      //   baseUrl: ApiConstances.baseUrl,
      //   receiveDataWhenStatusError: true,
      //   responseType: ResponseType.json,
      //   followRedirects: false,
      //   validateStatus: (status) {
      //     return status! < 500;
      //   },
      // ),
    );
    dio.interceptors.add(PrettyDioLogger());
  }

  Future<Response> get({
    required String path,
    required Map<String, dynamic> Function() parametersBuilder,
    required Map<String, dynamic> Function() headerBuilder,
  }) async {
    Response response = await dio.get(
      path,
      queryParameters: parametersBuilder(),
      options: Options(headers: {}),
    );
    return response;
  }

  Future<Response> put({
    required String url,
    required Map<String, dynamic> data,
    required Map<String, dynamic> Function() parametersBuilder,
    required Map<String, dynamic> Function() headerBuilder,
  }) async {
    return dio.put(
      url,
      queryParameters: parametersBuilder(),
      data: data,
      options: Options(headers: headerBuilder()),
    );
  }

  Future<Response> getTest({
    required String path,
    required Map<String, dynamic> Function() parametersBuilder,
  }) async {
    return await dio.get(
      path,
      queryParameters: parametersBuilder(),
      options: Options(headers: {}),
    );
  }
}
