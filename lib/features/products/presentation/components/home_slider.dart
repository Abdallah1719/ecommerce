import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';

import 'package:ecommerce_app/core/utils/enums.dart';
import 'package:ecommerce_app/features/products/presentation/controller/bloc/home_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeSlider extends StatelessWidget {
  const HomeSlider({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      buildWhen:
          (previous, current) =>
              previous.homeSlidersState != current.homeSlidersState,
      builder: (context, state) {
        switch (state.homeSlidersState) {
          case RequestState.loading:
            return SizedBox(
              height: 200,
              child: Center(child: CircularProgressIndicator()),
            );
          case RequestState.loaded:
            return
            // FadeIn(
            //   duration: const Duration(milliseconds: 500),
            CarouselSlider(
              options: CarouselOptions(
                height: 175.0,
                viewportFraction: 0.6,
                // padEnds: false,
                onPageChanged: (index, reason) {},
              ),
              items:
                  state.homeSliders.map((item) {
                    return Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20.0),
                        child: CachedNetworkImage(
                          width: 300,
                          height: 174.0,
                          imageUrl: item.image,

                          fit: BoxFit.cover,
                        ),
                      ),
                    );
                  }).toList(),
            );

          case RequestState.error:
            return SizedBox(
              height: 200,
              child: Center(child: Text(state.homeSlidersMessage)),
            );
        }
      },
    );
  }
}
