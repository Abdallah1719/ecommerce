import 'package:ecommerce_app/core/global/global-widgets/product_card.dart';
import 'package:flutter/material.dart';

class ProductGridView extends StatelessWidget {
  final List<Map<String, dynamic>> products = [
    {
      "name": "تفاح أحمر",
      "price": "25 جنيه",
      "weight": "1 كيلو",
      "image": "asstes/image1.jpg",
    },
    {
      "name": "موز",
      "price": "30 جنيه",
      "weight": "1 كيلو",
      "image": "asstes/image1.jpg",
    },
    {
      "name": "موز",
      "price": "30 جنيه",
      "weight": "1 كيلو",
      "image": "asstes/image1.jpg",
    },
    {
      "name": "موز",
      "price": "30 جنيه",
      "weight": "1 كيلو",
      "image": "asstes/image1.jpg",
    },
    {
      "name": "موز",
      "price": "30 جنيه",
      "weight": "1 كيلو",
      "image": "asstes/image1.jpg",
    },
    {
      "name": "موز",
      "price": "30 جنيه",
      "weight": "1 كيلو",
      "image": "asstes/image1.jpg",
    },
  ];

  ProductGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GridView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // عدد الأعمدة
          crossAxisSpacing: 10, // المسافة بين الأعمدة
          mainAxisSpacing: 10, // المسافة بين الصفوف
          childAspectRatio: 0.7,

          // نسبة العرض إلى الارتفاع
        ),
        itemCount: products.length,
        itemBuilder: (context, index) {
          return ProductCard(product: products[index]);
        },
      ),
    );
  }
}
