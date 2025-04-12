import 'package:ecommerce_app/core/utils/enums.dart';
import 'package:ecommerce_app/products/data/data_source/remote_data_source/products_data_source.dart';
import 'package:ecommerce_app/products/data/repository/products_repository.dart';
import 'package:ecommerce_app/products/domain/entities/home_sliders.dart';
import 'package:ecommerce_app/products/domain/repository/base_products_repository.dart';
import 'package:ecommerce_app/products/domain/usecases/get_home_sliders_usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final GetHomeSlidersUseCase getHomeSlidersUseCase;
  HomeBloc(this.getHomeSlidersUseCase) : super(HomeState()) {
    on<HomeEvent>((event, emit) async {
      final result = await getHomeSlidersUseCase.execute();
      print(result);
    });
  }
}
