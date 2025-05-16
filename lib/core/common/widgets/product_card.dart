// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:ecommerce_app/core/utils/resources/size_config.dart';
// import 'package:ecommerce_app/features/products/domain/entities/categories_details.dart';
// import 'package:ecommerce_app/generated/l10n.dart';
// import 'package:ecommerce_app/features/products/domain/entities/products_top_rated.dart';
// import 'package:flutter/material.dart';

// class ProductCard extends StatelessWidget {
//   final ProductsTopRated product;
//   final CategoriesProducts categoriesProducts;

//   const ProductCard(this.product,  this.categoriesProducts, {super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(12),
//         border: Border.all(color: Color(0xFF35E298), width: 1),
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.stretch,
//         children: [
//           ClipRRect(
//             borderRadius: BorderRadius.vertical(top: Radius.circular(11)),
//             child: SizedBox(
//               child: Center(
//                 child: CachedNetworkImage(
//                   imageUrl:
//                       product.image.isNotEmpty
//                           ? product.image
//                           : 'https://via.placeholder.com/300',
//                   height: 150,
//                   width: double.infinity,
//                   fit: BoxFit.contain, // عرض الصورة بالكامل
//                   placeholder: (context, url) => Container(),
//                   errorWidget:
//                       (context, url, error) =>
//                           Icon(Icons.error, size: 50, color: Colors.red),
//                 ),
//               ),
//             ),
//           ),

//           // زر الإضافة إلى السلة
//           Padding(
//             padding: const EdgeInsets.all(12),
//             child: ElevatedButton.icon(
//               onPressed: () {},
//               style: ElevatedButton.styleFrom(
//                 backgroundColor: Color(0xFF35E298),
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(8),
//                 ),
//               ),
//               icon: Icon(Icons.shopping_cart, size: 18),
//               label: Text(S.of(context).addToCart),
//             ),
//           ),

//           // الاسم والسعر مع خلفية
//           Expanded(
//             child: Container(
//               padding: EdgeInsets.symmetric(horizontal: 8),
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(12),
//                 border: Border.all(color: Color(0xFF35E298), width: 1),
//                 color: Color(0xFF35E298),
//               ),
//               child: Column(
//                 children: [
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       SizedBox(
//                         width: SizeConfig.defaultSize! * 12,
//                         child: Text(
//                           product.title,
//                           style: TextStyle(
//                             fontSize: 14,
//                             fontWeight: FontWeight.bold,
//                           ),
//                           overflow: TextOverflow.ellipsis,
//                           maxLines: 1,
//                         ),
//                       ),

//                       Text(
//                         '${product.price.toString()} L.E',
//                         style: TextStyle(fontSize: 14, color: Colors.black),
//                       ),
//                     ],
//                   ),

//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       Text(
//                         product.weight,
//                         style: TextStyle(fontSize: 14, color: Colors.black),
//                       ),
//                       SizedBox(width: 4), // مسافة صغيرة بين النصوص
//                       Text(
//                         product.unitName, // النص الجديد
//                         style: TextStyle(fontSize: 12, color: Colors.black),
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_app/features/products/domain/entities/categories_details.dart';
import 'package:ecommerce_app/features/products/domain/entities/products_top_rated.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_app/core/utils/resources/size_config.dart';
import 'package:ecommerce_app/generated/l10n.dart';

// نحدد بيانات المنتج الموحدة
class ProductData {
  final String title;
  final String price;
  final String image;
  final String weight;
  final String unitName;

  ProductData({
    required this.title,
    required this.price,
    required this.image,
    required this.weight,
    required this.unitName,
  });
}

// دالة لتحويل أي نوع إلى ProductData
ProductData getProductData(dynamic item) {
  if (item is ProductsTopRated) {
    return ProductData(
      title: item.title,
      price: item.price.toString(),
      image: item.image,
      weight: item.weight,
      unitName: item.unitName,
    );
  } else if (item is CategoriesProducts) {
    return ProductData(
      title: item.title,
      price: item.price.toString(),
      image: item.image,
      weight: item.weight,
      unitName: item.unitName,
    );
  }
  throw UnsupportedError('Unsupported product type');
}

// ProductCard ك-StatelessWidget Generic
class ProductCard<T> extends StatelessWidget {
  final T item;

  const ProductCard(this.item, {super.key});

  @override
  Widget build(BuildContext context) {
    final data = getProductData(item);

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFF35E298), width: 1),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // الصورة
          ClipRRect(
            borderRadius: BorderRadius.vertical(top: Radius.circular(11)),
            child: SizedBox(
              height: 150,
              child: Center(
                child: CachedNetworkImage(
                  imageUrl:
                      data.image.isNotEmpty
                          ? data.image
                          : 'https://via.placeholder.com/300 ',
                  fit: BoxFit.contain,
                  placeholder: (context, url) => Container(),
                  errorWidget:
                      (context, url, error) =>
                          Icon(Icons.error, size: 50, color: Colors.red),
                ),
              ),
            ),
          ),

          // زر الإضافة للسلة
          Padding(
            padding: const EdgeInsets.all(12),
            child: ElevatedButton.icon(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF35E298),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              icon: Icon(Icons.shopping_cart, size: 18),
              label: Text(S.of(context).addToCart),
            ),
          ),

          // اسم المنتج والسعر
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: const Color(0xFF35E298), width: 1),
                color: const Color(0xFF35E298),
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: SizeConfig.defaultSize! * 12,
                        child: Text(
                          data.title,
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        ),
                      ),
                      Text(
                        '${data.price} L.E',
                        style: TextStyle(fontSize: 14, color: Colors.black),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        data.weight,
                        style: TextStyle(fontSize: 14, color: Colors.black),
                      ),
                      const SizedBox(width: 4),
                      Text(
                        data.unitName,
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
