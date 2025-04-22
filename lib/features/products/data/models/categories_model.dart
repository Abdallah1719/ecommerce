import 'package:ecommerce_app/features/products/domain/entities/categories.dart';

class CategoriesModel extends Categories {
  const CategoriesModel({
    required super.icon,
    required super.name,
    required super.id,
  });

  factory CategoriesModel.fromJson(Map<String, dynamic> json) =>
      CategoriesModel(icon: json["icon"], name: json["name"], id: json["id"]);
}
