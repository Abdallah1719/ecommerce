import 'package:ecommerce_app/core/common/widgets/product_card.dart';
import 'package:ecommerce_app/core/utils/enums.dart';
import 'package:ecommerce_app/features/products/domain/entities/categories_details.dart';
import 'package:ecommerce_app/features/products/domain/entities/products_top_rated.dart';
import 'package:ecommerce_app/features/products/presentation/controller/bloc/home_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoriesProductGridView extends StatelessWidget {
  const CategoriesProductGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      buildWhen:
          (previous, current) =>
              previous.categoriesProductsState !=
              current.categoriesProductsState,
      builder: (context, state) {
        switch (state.categoriesProductsState) {
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
                itemCount: state.categoriesProducts.length,
                itemBuilder: (context, index) {
                  return ProductCard<CategoriesProducts>(
                    state.categoriesProducts[index],
                  );
                },
              ),
            );
          case RequestState.error:
            return SizedBox(
              height: 200,
              child: Center(child: Text(state.categoriesProductsMessage)),
            );
        }
      },
    );
  }
}
