import 'package:equatable/equatable.dart';

class CategoriesProducts extends Equatable {
  final int id;
  final String title;
  final int rate;
  final int discount;
  final int priceBeforeDiscount;
  final String image;
  final int price;
  final bool wishlist;
  final bool cart;
  final String unitName;
  final String weight;

  const CategoriesProducts({
    required this.id,
    required this.title,
    required this.rate,
    required this.discount,
    required this.priceBeforeDiscount,
    required this.image,
    required this.price,
    required this.wishlist,
    required this.cart,
    required this.unitName,
    required this.weight,
  });

  @override
  List<Object?> get props => [
    id,
    title,
    rate,
    discount,
    priceBeforeDiscount,
    image,
    price,
    wishlist,
    cart,
    unitName,
    weight,
  ];
}
