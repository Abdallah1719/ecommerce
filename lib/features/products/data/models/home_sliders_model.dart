import 'package:ecommerce_app/features/products/domain/entities/home_sliders.dart';

class HomeSlidersModel extends HomeSliders {
  const HomeSlidersModel({required super.image, required super.id});

  factory HomeSlidersModel.fromJson(Map<String, dynamic> json) =>
      HomeSlidersModel(image: json["image"], id: json["id"]);
}
