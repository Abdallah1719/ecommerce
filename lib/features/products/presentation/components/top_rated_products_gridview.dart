import 'package:ecommerce_app/core/common/widgets/product_card.dart';
import 'package:ecommerce_app/core/utils/enums.dart';
import 'package:ecommerce_app/features/products/domain/entities/products_top_rated.dart';
import 'package:ecommerce_app/features/products/presentation/controller/bloc/home_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TopRatedProductGridView extends StatelessWidget {
  const TopRatedProductGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      buildWhen:
          (previous, current) =>
              previous.productsTopRatedState != current.productsTopRatedState,
      builder: (context, state) {
        switch (state.productsTopRatedState) {
          case RequestState.loading:
            return SizedBox(
              height: 200,
              child: Center(child: CircularProgressIndicator()),
            );
          case RequestState.loaded:
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.65,
                  mainAxisSpacing: 8,
                  crossAxisSpacing: 8,
                ),
                itemCount: state.productsTopRated.length,
                itemBuilder: (context, index) {
                  return ProductCard<ProductsTopRated>(
                    state.productsTopRated[index],
                  );
                },
              ),
            );
          case RequestState.error:
            return SizedBox(
              height: 200,
              child: Center(child: Text(state.productsTopRatedMessage)),
            );
        }
      },
    );
  }
}
