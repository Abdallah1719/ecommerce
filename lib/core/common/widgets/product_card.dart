import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_app/generated/l10n.dart';
import 'package:ecommerce_app/features/products/domain/entities/products_top_rated.dart';
import 'package:flutter/material.dart';


class ProductCard extends StatelessWidget {
  final ProductsTopRated product;

  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Color(0xFF35E298), width: 1),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.vertical(top: Radius.circular(11)),
            child: SizedBox(
              child: Center(
                child: CachedNetworkImage(
                  imageUrl:
                      product.image.isNotEmpty
                          ? product.image
                          : 'https://via.placeholder.com/300',
                  height: 150,
                  width: double.infinity,
                  fit: BoxFit.contain, // عرض الصورة بالكامل
                  placeholder: (context, url) => Container(),
                  errorWidget:
                      (context, url, error) =>
                          Icon(Icons.error, size: 50, color: Colors.red),
                ),
              ),
            ),
          ),

          // زر الإضافة إلى السلة
          Padding(
            padding: const EdgeInsets.all(12),
            child: ElevatedButton.icon(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF35E298),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              icon: Icon(Icons.shopping_cart, size: 18),
              label: Text(S.of(context).addToCart),
            ),
          ),

          // الاسم والسعر مع خلفية
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Color(0xFF35E298), width: 1),
                color: Color(0xFF35E298),
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(
                        product.title,
                        style: TextStyle(
                          fontSize: 8,
                          fontWeight: FontWeight.bold,
                        ),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                      Spacer(flex: 1),
                      Text(
                        '${product.price.toString()} L.E',
                        style: TextStyle(fontSize: 8, color: Colors.black),
                      ),
                    ],
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        product.weight,
                        style: TextStyle(fontSize: 12, color: Colors.black),
                      ),
                      SizedBox(width: 4), // مسافة صغيرة بين النصوص
                      Text(
                        product.unitName, // النص الجديد
                        style: TextStyle(fontSize: 12, color: Colors.black),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
