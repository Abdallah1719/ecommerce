part of 'home_bloc.dart';

class HomeState extends Equatable {
  final List<HomeSliders> homeSliders;
  final RequestState homeSlidersState;
  final String homeSlidersMessage;
  final List<Categories> categories;
  final RequestState categoriesState;
  final String categoriesMessage;

  const HomeState({
    this.categories = const [],
    this.categoriesState = RequestState.loading,
    this.categoriesMessage = '',
    this.homeSliders = const [],
    this.homeSlidersState = RequestState.loading,
    this.homeSlidersMessage = '',
  });

  HomeState copyWith({
    List<HomeSliders>? homeSliders,
    RequestState? homeSlidersState,
    String? homeSlidersMessage,
    List<Categories>? categories,
    RequestState? categoriesState,
    String? categoriesMessage,
  }) {
    return HomeState(
      homeSliders: homeSliders ?? this.homeSliders,
      homeSlidersState: homeSlidersState ?? this.homeSlidersState,
      homeSlidersMessage: homeSlidersMessage ?? this.homeSlidersMessage,
      categories: categories ?? this.categories,
      categoriesState: categoriesState ?? this.categoriesState,
      categoriesMessage: categoriesMessage ?? this.categoriesMessage,
    );
  }

  @override
  List<Object?> get props => [
    homeSliders,
    homeSlidersState,
    homeSlidersMessage,
    categories,
    categoriesState,
    categoriesMessage,
  ];
}
