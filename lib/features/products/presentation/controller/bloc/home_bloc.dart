import 'package:ecommerce_app/core/utils/enums.dart';
import 'package:ecommerce_app/features/products/domain/entities/categories.dart';
import 'package:ecommerce_app/features/products/domain/entities/categories_details.dart';
import 'package:ecommerce_app/features/products/domain/entities/home_sliders.dart';
import 'package:ecommerce_app/features/products/domain/entities/products_top_rated.dart';
import 'package:ecommerce_app/features/products/domain/usecases/get_categories_products_usecase.dart';
import 'package:ecommerce_app/features/products/domain/usecases/get_categories_usecase.dart';
import 'package:ecommerce_app/features/products/domain/usecases/get_home_sliders_usecase.dart';
import 'package:ecommerce_app/features/products/domain/usecases/get_products_top_rated__usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final GetHomeSlidersUseCase getHomeSlidersUseCase;
  final GetCategoriesUseCase getCategoriesUseCase;
  final GetProductsTopRatedUseCase getProductsTopRatedUseCase;
  final GetCategoriesProductsUsecase getCategoriesProductsUsecase;
  HomeBloc(
    this.getHomeSlidersUseCase,
    this.getCategoriesUseCase,
    this.getProductsTopRatedUseCase,
    this.getCategoriesProductsUsecase,
  ) : super(HomeState()) {
    on<GetHomeSliderEvent>((event, emit) async {
      final result = await getHomeSlidersUseCase();

      result.fold(
        (l) => emit(
          state.copyWith(
            homeSlidersState: RequestState.error,
            homeSlidersMessage: l.message,
          ),
        ),
        (r) => emit(
          state.copyWith(homeSlidersState: RequestState.loaded, homeSliders: r),
        ),
      );
    });
    on<GetCategoriesEvent>((event, emit) async {
      final result = await getCategoriesUseCase();
      result.fold(
        (l) => emit(
          state.copyWith(
            categoriesState: RequestState.error,
            categoriesMessage: l.message,
          ),
        ),
        (r) => emit(
          state.copyWith(categoriesState: RequestState.loaded, categories: r),
        ),
      );
    });

    on<GetProductsTopRatedEvent>((event, emit) async {
      final result = await getProductsTopRatedUseCase();
      result.fold(
        (failure) {
          emit(
            state.copyWith(
              productsTopRatedState: RequestState.error,
              productsTopRatedMessage: failure.message,
            ),
          );
        },
        (products) {
          emit(
            state.copyWith(
              productsTopRatedState: RequestState.loaded,
              productsTopRated: products,
            ),
          );
        },
      );
    });
    on<GetCategoriesProdustsEvent>((event, emit) async {
      final result = await getCategoriesProductsUsecase();
      print('*\\\\\\\\\\\\\\\\\\\\\\*{$result}');
      result.fold(
        (failure) {
          emit(
            state.copyWith(
              categoriesProductsState: RequestState.error,
              categoriesProductsMessage: failure.message,
            ),
          );
        },
        (categoriesProducts) {
          emit(
            state.copyWith(
              categoriesProductsState: RequestState.loaded,
              categoriesProducts: categoriesProducts,
            ),
          );
        },
      );
    });
  }
}
