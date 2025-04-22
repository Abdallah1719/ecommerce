import 'package:equatable/equatable.dart';

class Categories extends Equatable {
  final int id;
  final String icon;
  final String name;

  const Categories({required this.icon, required this.name, required this.id});

  @override
  List<Object?> get props => [icon, name, id];
}
