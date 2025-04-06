import 'package:ecommerce_app/generated/l10n.dart';
import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final Map<String, dynamic> product;

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
          // الصورة
          ClipRRect(
            borderRadius: BorderRadius.vertical(top: Radius.circular(11)),
            child: Image.asset(
              product["image"],
              height: 120,
              fit: BoxFit.cover,
            ),
          ),

          // زر الإضافة إلى السلة
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: ElevatedButton.icon(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF35E298), // لون الزر
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
                color: Color(0xFF35E298), // نفس لون الإطار ولكن أفتح
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        product["price"],
                        style: TextStyle(fontSize: 14, color: Colors.black),
                      ),
                      Text(
                        product["name"],
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8.0,
                      vertical: 4,
                    ),
                    child: Text(
                      product["weight"],
                      style: TextStyle(fontSize: 12, color: Colors.black),
                    ),
                  ),
                ],
              ),
            ),
          ),

          // الوزن
        ],
      ),
    );
  }
}
