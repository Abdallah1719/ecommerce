part of 'home_bloc.dart';

sealed class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object> get props => [];
}

class GetHomeSliderEvent extends HomeEvent {}

class GetCategories extends HomeEvent {}

class GetProductsTopRated extends HomeEvent {}
