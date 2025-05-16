part of 'home_bloc.dart';

class HomeState extends Equatable {
  final List<HomeSliders> homeSliders;
  final RequestState homeSlidersState;
  final String homeSlidersMessage;
  final List<Categories> categories;
  final RequestState categoriesState;
  final String categoriesMessage;
  final List<ProductsTopRated> productsTopRated;
  final RequestState productsTopRatedState;
  final String productsTopRatedMessage;
  final List<CategoriesProducts> categoriesProducts;
  final RequestState categoriesProductsState;
  final String categoriesProductsMessage;

  const HomeState({
    this.homeSliders = const [],
    this.homeSlidersState = RequestState.loading,
    this.homeSlidersMessage = '',
    this.categories = const [],
    this.categoriesState = RequestState.loading,
    this.categoriesMessage = '',

    this.productsTopRated = const [],
    this.productsTopRatedState = RequestState.loading,
    this.productsTopRatedMessage = '',
    this.categoriesProducts = const [],
    this.categoriesProductsState = RequestState.loading,
    this.categoriesProductsMessage = '',
  });

  HomeState copyWith({
    List<HomeSliders>? homeSliders,
    RequestState? homeSlidersState,
    String? homeSlidersMessage,
    List<Categories>? categories,
    RequestState? categoriesState,
    String? categoriesMessage,
    List<ProductsTopRated>? productsTopRated,
    RequestState? productsTopRatedState,
    String? productsTopRatedMessage,
    List<CategoriesProducts>? categoriesProducts,
    RequestState? categoriesProductsState,
    String? categoriesProductsMessage,
  }) {
    return HomeState(
      homeSliders: homeSliders ?? this.homeSliders,
      homeSlidersState: homeSlidersState ?? this.homeSlidersState,
      homeSlidersMessage: homeSlidersMessage ?? this.homeSlidersMessage,
      categories: categories ?? this.categories,
      categoriesState: categoriesState ?? this.categoriesState,
      categoriesMessage: categoriesMessage ?? this.categoriesMessage,
      productsTopRated: productsTopRated ?? this.productsTopRated,
      productsTopRatedState:
          productsTopRatedState ?? this.productsTopRatedState,
      productsTopRatedMessage:
          productsTopRatedMessage ?? this.productsTopRatedMessage,
      categoriesProducts: categoriesProducts ?? this.categoriesProducts,
      categoriesProductsState:
          categoriesProductsState ?? this.categoriesProductsState,
      categoriesProductsMessage:
          categoriesProductsMessage ?? this.categoriesProductsMessage,
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
    productsTopRated,
    productsTopRatedState,
    productsTopRatedMessage,
    categoriesProducts,
    categoriesProductsState,
    categoriesMessage,
  ];
}
