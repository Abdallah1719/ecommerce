part of 'home_bloc.dart';

class HomeState extends Equatable {
  final List<HomeSliders> homeSliders;
  final RequestState homeSlidersState;
  final String homeSlidersMessage;

  const HomeState({
    this.homeSliders = const [],
    this.homeSlidersState = RequestState.loading,
    this.homeSlidersMessage = '',
  });

  @override
  List<Object?> get props => [
    homeSliders,
    homeSlidersState,
    homeSlidersMessage,
  ];
}
