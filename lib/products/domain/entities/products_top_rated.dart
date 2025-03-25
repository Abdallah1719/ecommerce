import 'package:equatable/equatable.dart';

class ProductsTopRated extends Equatable {
  final int id;
  final String title;
  final int rate;
  final double discount;
  final int priceBeforeDiscount;
  final String image;
  final int price;
  final bool wishlist;
  final bool cart;
  final String unitName;
  final String weight;

  const ProductsTopRated({
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
  // TODO: implement props
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
