import 'package:ecommerce_app/features/products/presentation/components/categories_listview.dart';
import 'package:ecommerce_app/features/products/presentation/components/categories_product_grid_view.dart';
import 'package:flutter/material.dart';

class CategoriesProductsScreen extends StatelessWidget {
  const CategoriesProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('data', style: Theme.of(context).textTheme.headlineLarge),
      ),
      body: ListView(
        children: [
          SizedBox(height: 100),
          Text(
            " dadadddddaaaaaadadadadadddddddddddddddddddddddddddadadad",
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          Text('data', style: Theme.of(context).textTheme.headlineMedium),
          CategoriesListView(),
          Text('data', style: Theme.of(context).textTheme.headlineMedium),
          CategoriesProductGridView(),
        ],
      ),
    );
  }
}
