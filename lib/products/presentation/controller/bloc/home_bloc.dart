import 'package:ecommerce_app/core/utils/enums.dart';
import 'package:ecommerce_app/products/domain/entities/home_sliders.dart';
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
      emit(HomeState(homeSlidersState: RequestState.loading));
      result.fold(
        (l) => emit(
          HomeState(
            homeSlidersState: RequestState.error,
            homeSlidersMessage: l.message,
          ),
        ),
        (r) => emit(
          (HomeState(homeSlidersState: RequestState.loaded, homeSliders: r)),
        ),
      );
    });
  }
}
