import 'package:ecommerce_app/features/products/domain/entities/products_top_rated.dart';

class ProductsTopRatedModel extends ProductsTopRated {
  const ProductsTopRatedModel({
    required super.id,
    required super.title,
    required super.rate,
    required super.discount,
    required super.priceBeforeDiscount,
    required super.image,
    required super.price,
    required super.wishlist,
    required super.cart,
    required super.unitName,
    required super.weight,
  });

  factory ProductsTopRatedModel.fromJson(Map<String, dynamic> json) =>
      ProductsTopRatedModel(
        id: json["id"] ?? '',
        title: json["title"],
        rate: json["rate"],
        discount: json["discount"],
        priceBeforeDiscount: json["price_before_discount"],
        image: json["image"] ?? '',
        price: json['price'] ?? 0.0,
        wishlist: json["wishlist"],
        cart: json["cart"],
        unitName: json["unit_name"] ?? 'Unknown',
        weight: json["weight"],
      );
}
