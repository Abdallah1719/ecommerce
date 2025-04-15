import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerce_app/products/presentation/controller/bloc/home_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoriesListView extends StatelessWidget {
  const CategoriesListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        return SizedBox(
          height: 200,
          child:
          //  FadeIn(
          //   duration: const Duration(milliseconds: 500),
          CarouselSlider(
            options: CarouselOptions(
              height: 200.0,
              viewportFraction: 0.3,
              enableInfiniteScroll: false,
              padEnds: false,
              onPageChanged: (index, reason) {},
            ),
            items:
                state.categories.map((item) {
                  return Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ClipOval(
                        child: CachedNetworkImage(
                          imageUrl: item.icon,
                          width: 100,
                          height: 100,
                          // ApiConstance.imageUrl(item.backdropPath!),
                          fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(height: 8),

                      Text(
                        item.name,
                        style: TextStyle(fontSize: 16),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  );
                }).toList(),
          ),
          //  ListView.builder(
          //   scrollDirection: Axis.horizontal,
          //   itemCount: state.categories.length,
          //   itemBuilder: (context, index) {
          //     return Padding(
          //       padding: EdgeInsets.all(8.0),
          //       child: Column(
          //         mainAxisSize: MainAxisSize.min,
          //         children: [
          //           ClipOval(
          //             child: Image.asset(
          //               'asstes/image1.jpg',
          //               width: 100,
          //               height: 100,
          //               fit: BoxFit.cover,
          //             ),
          //           ),
          //           SizedBox(height: 8),

          //           Text('فاكهة ', style: TextStyle(fontSize: 16)),
          //         ],
          //       ),
          //     );
          //   },
          // ),
        );
      },
    );
  }
}
