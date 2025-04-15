// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:ecommerce_app/generated/l10n.dart';
// import 'package:ecommerce_app/products/domain/entities/products_top_rated.dart';
// import 'package:ecommerce_app/products/presentation/controller/bloc/home_bloc.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// class ProductCard extends StatelessWidget {
//   final ProductsTopRated product;

//   const ProductCard({super.key, required this.product});

//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<HomeBloc, HomeState>(
//       builder: (context, state) {
//         return Container(
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(12),
//             border: Border.all(color: Color(0xFF35E298), width: 1),
//           ),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.stretch,
//             children: [
//               ClipRRect(
//                 borderRadius: BorderRadius.vertical(top: Radius.circular(11)),
//                 child: CachedNetworkImage(
//                   imageUrl: product.image,
//                   height: 150,
//                   width: double.infinity,
//                   fit: BoxFit.cover,
//                   placeholder:
//                       (context, url) => Container(
//                         color: Colors.grey[300], // لون خلفية أثناء التحميل
//                       ),
//                   errorWidget:
//                       (context, url, error) =>
//                           Icon(Icons.error, size: 50, color: Colors.red),
//                 ),
//               ),
//               // الصورة
//               // ClipRRect(
//               //   borderRadius: BorderRadius.vertical(top: Radius.circular(11)),
//               //   child: CachedNetworkImage(
//               //     imageUrl: product.image,
//               //     height: 150,
//               //     fit: BoxFit.cover,
//               //   ),
//               // ),

//               // زر الإضافة إلى السلة
//               Padding(
//                 padding: const EdgeInsets.all(12),
//                 child: ElevatedButton.icon(
//                   onPressed: () {},
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: Color(0xFF35E298), // لون الزر
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(8),
//                     ),
//                   ),
//                   icon: Icon(Icons.shopping_cart, size: 18),
//                   label: Text(S.of(context).addToCart),
//                 ),
//               ),

//               // الاسم والسعر مع خلفية
//               Expanded(
//                 child: Container(
//                   padding: EdgeInsets.symmetric(horizontal: 8),
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(12),
//                     border: Border.all(color: Color(0xFF35E298), width: 1),
//                     color: Color(0xFF35E298), // نفس لون الإطار ولكن أفتح
//                   ),
//                   child: Column(
//                     children: [
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           Text(
//                             product.price.toString() ?? '',
//                             style: TextStyle(fontSize: 14, color: Colors.black),
//                           ),
//                           Text(
//                             product.unitName ?? '',
//                             style: TextStyle(
//                               fontSize: 14,
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                         ],
//                       ),
//                       Padding(
//                         padding: const EdgeInsets.symmetric(
//                           horizontal: 8.0,
//                           vertical: 4,
//                         ),
//                         child: Text(
//                           product.weight ?? '',
//                           style: TextStyle(fontSize: 12, color: Colors.black),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),

//               // الوزن
//             ],
//           ),
//         );
//       },
//     );
//   }
// }

import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_app/generated/l10n.dart';
import 'package:ecommerce_app/products/domain/entities/products_top_rated.dart';
import 'package:ecommerce_app/products/presentation/controller/bloc/home_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// class ProductCard extends StatelessWidget {
//   final ProductsTopRated product;

//   const ProductCard({super.key, required this.product});

//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<HomeBloc, HomeState>(
//       builder: (context, state) {
//         return Container(
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(12),
//             border: Border.all(color: Color(0xFF35E298), width: 1),
//           ),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.stretch,
//             children: [
//               ClipRRect(
//                 borderRadius: BorderRadius.vertical(top: Radius.circular(11)),
//                 child: Stack(
//                   children: [
//                     AspectRatio(
//                       aspectRatio: 16 / 9,
//                       child: CachedNetworkImage(
//                         imageUrl:
//                             product.image.isNotEmpty
//                                 ? product.image
//                                 : 'https://via.placeholder.com/300',
//                         fit: BoxFit.cover,
//                         placeholder:
//                             (context, url) =>
//                                 Container(color: Colors.grey[300]),
//                         errorWidget:
//                             (context, url, error) =>
//                                 Icon(Icons.error, size: 50, color: Colors.red),
//                       ),
//                     ),
//                     Positioned.fill(
//                       child: DecoratedBox(
//                         decoration: BoxDecoration(
//                           gradient: LinearGradient(
//                             colors: [
//                               Colors.black.withOpacity(0.5),
//                               Colors.transparent,
//                             ],
//                             begin: Alignment.bottomCenter,
//                             end: Alignment.topCenter,
//                           ),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),

//               // زر الإضافة إلى السلة
//               Padding(
//                 padding: const EdgeInsets.all(12),
//                 child: ElevatedButton.icon(
//                   onPressed: () {},
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: Color(0xFF35E298),
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(8),
//                     ),
//                   ),
//                   icon: Icon(Icons.shopping_cart, size: 18),
//                   label: Text(S.of(context).addToCart),
//                 ),
//               ),

//               // الاسم والسعر مع خلفية
//               Expanded(
//                 child: Container(
//                   padding: EdgeInsets.symmetric(horizontal: 8),
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(12),
//                     border: Border.all(color: Color(0xFF35E298), width: 1),
//                     color: Color(0xFF35E298),
//                   ),
//                   child: Column(
//                     children: [
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           Text(
//                             product.price.toString(),
//                             style: TextStyle(fontSize: 14, color: Colors.black),
//                           ),
//                           Text(
//                             product.unitName ?? '',
//                             style: TextStyle(
//                               fontSize: 14,
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                         ],
//                       ),
//                       Padding(
//                         padding: const EdgeInsets.symmetric(
//                           horizontal: 8.0,
//                           vertical: 4,
//                         ),
//                         child: Text(
//                           product.weight ?? '',
//                           style: TextStyle(fontSize: 12, color: Colors.black),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         );
//       },
//     );
//   }
// }

class ProductCard extends StatelessWidget {
  final ProductsTopRated product;

  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
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
                child: Container(
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
                            product.title ?? '',
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
                            product.weight ?? '',
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
      },
    );
  }
}
