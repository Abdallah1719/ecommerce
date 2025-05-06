import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerce_app/core/utils/enums.dart';
import 'package:ecommerce_app/features/products/presentation/controller/bloc/home_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoriesListView extends StatelessWidget {
  const CategoriesListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      buildWhen:
          (previous, current) =>
              previous.categoriesState != current.categoriesState,
      builder: (context, state) {
        switch (state.categoriesState) {
          case RequestState.loading:
            return SizedBox(
              height: 200,
              child: Center(child: CircularProgressIndicator()),
            );
          case RequestState.loaded:
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
                            overflow: TextOverflow.ellipsis,
                            style: Theme.of(context).textTheme.bodyLarge,
                            textAlign: TextAlign.center,
                          ),
                        ],
                      );
                    }).toList(),
              ),
            );
          case RequestState.error:
            return SizedBox(
              height: 200,
              child: Center(child: Text(state.categoriesMessage)),
            );
        }
      },
    );
  }
}
