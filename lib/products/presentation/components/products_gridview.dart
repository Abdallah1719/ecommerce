import 'package:ecommerce_app/core/global/global-widgets/product_card.dart';
import 'package:ecommerce_app/core/utils/enums.dart';
import 'package:ecommerce_app/products/presentation/controller/bloc/home_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductGridView extends StatelessWidget {
  // final List<Map<String, dynamic>> products = [
  //   {
  //     "name": "تفاح أحمر",
  //     "price": "25 جنيه",
  //     "weight": "1 كيلو",
  //     "image": "asstes/image1.jpg",
  //   },
  //   {
  //     "name": "موز",
  //     "price": "30 جنيه",
  //     "weight": "1 كيلو",
  //     "image": "asstes/image1.jpg",
  //   },
  //   {
  //     "name": "موز",
  //     "price": "30 جنيه",
  //     "weight": "1 كيلو",
  //     "image": "asstes/image1.jpg",
  //   },
  //   {
  //     "name": "موز",
  //     "price": "30 جنيه",
  //     "weight": "1 كيلو",
  //     "image": "asstes/image1.jpg",
  //   },
  //   {
  //     "name": "موز",
  //     "price": "30 جنيه",
  //     "weight": "1 كيلو",
  //     "image": "asstes/image1.jpg",
  //   },
  //   {
  //     "name": "موز",
  //     "price": "30 جنيه",
  //     "weight": "1 كيلو",
  //     "image": "asstes/image1.jpg",
  //   },
  // ];

  const ProductGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        print('Current State: ${state.productsTopRatedState}');
        if (state.productsTopRatedState == RequestState.loading) {
          return Center(child: CircularProgressIndicator());
        }

        if (state.productsTopRated.isEmpty) {
          return Center(child: Text('جاري تحميل المنتجات...'));
        }
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: GridView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.65, // يقلل الحمل على الـ GPU
              mainAxisSpacing: 8,
              crossAxisSpacing: 8,
            ),
            itemCount: state.productsTopRated.length,
            itemBuilder: (context, index) {
              return ProductCard(product: state.productsTopRated[index]);
            },
          ),

          // GridView.builder(
          //   shrinkWrap: true,
          //   physics: NeverScrollableScrollPhysics(),
          //   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          //     crossAxisCount: 2, // عدد الأعمدة
          //     crossAxisSpacing: 10, // المسافة بين الأعمدة
          //     mainAxisSpacing: 10, // المسافة بين الصفوف
          //     childAspectRatio: 0.7,

          //     // نسبة العرض إلى الارتفاع
          //   ),
          //   itemCount: state.productsTopRated.length,
          //   itemBuilder: (context, index) {
          //     return ProductCard(product: state.productsTopRated[index]);
          //   },
          // ),
        );
      },
    );
  }
}
