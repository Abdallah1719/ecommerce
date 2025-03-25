import 'package:equatable/equatable.dart';

class HomeSliders extends Equatable {
  final int id;
  final String image;

  const HomeSliders({required this.image, required this.id});

  @override
  List<Object?> get props => [image, id];
}
