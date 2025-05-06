import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_app/core/utils/enums.dart';
import 'package:ecommerce_app/features/products/presentation/controller/bloc/home_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Categories')),
      body: BlocBuilder<HomeBloc, HomeState>(
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
              return GridView.builder(
                itemCount: state.categories.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  childAspectRatio: 1.2,
                ),
                itemBuilder: (context, index) {
                  final category = state.categories[index];
                  return Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ClipOval(
                        child: CachedNetworkImage(
                          imageUrl: category.icon,
                          width: 100,
                          height: 100,
                          // ApiConstance.imageUrl(item.backdropPath!),
                          fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(height: 8),

                      Text(
                        category.name,

                        style: Theme.of(context).textTheme.bodyLarge,
                        textAlign: TextAlign.center,
                      ),
                    ],
                  );
                },
              );

            case RequestState.error:
              return SizedBox(
                height: 200,
                child: Center(child: Text(state.categoriesMessage)),
              );
          }
        },
      ),
    );
  }
}
