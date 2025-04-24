import 'package:dio/dio.dart';
import 'package:ecommerce_app/core/network/network_helper.dart';
import 'package:ecommerce_app/features/products/data/data_source/remote_data_source/products_data_source.dart';
import 'package:ecommerce_app/features/products/data/repository/products_repository.dart';
import 'package:ecommerce_app/features/products/domain/repository/base_products_repository.dart';
import 'package:ecommerce_app/features/products/domain/usecases/get_categories_usecase.dart';
import 'package:ecommerce_app/features/products/domain/usecases/get_home_sliders_usecase.dart';
import 'package:ecommerce_app/features/products/domain/usecases/get_products_top_rated__usecase.dart';
import 'package:ecommerce_app/features/products/presentation/controller/bloc/home_bloc.dart';
import 'package:get_it/get_it.dart';

GetIt sl = GetIt.instance;

class ServiceLocator {
  void init() {
    //Bloc
    sl.registerFactory(() => HomeBloc(sl(), sl(), sl()));
    // Data Source
    sl.registerLazySingleton<BaseProductsDataSource>(
      () => ProductsDataSource(),
    );
    //Repository
    sl.registerLazySingleton<BaseProductsRepository>(
      () => ProductsRepository(sl()),
    );

    //Use Cases
    sl.registerLazySingleton(() => GetHomeSlidersUseCase(sl()));
    sl.registerLazySingleton(() => GetCategoriesUseCase(sl()));
    sl.registerLazySingleton(() => GetProductsTopRatedUseCase(sl()));

    // Dio
    sl.registerLazySingleton(() => NetworkHelper(Dio()));
  }
}
