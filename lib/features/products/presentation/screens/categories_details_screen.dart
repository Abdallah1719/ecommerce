import 'package:ecommerce_app/features/products/presentation/components/categories_listview.dart';
import 'package:ecommerce_app/features/products/presentation/components/products_gridview.dart';
import 'package:flutter/material.dart';

class CategoriesDetailsScreen extends StatelessWidget {
  const CategoriesDetailsScreen({super.key});

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
          ProductGridView(),
        ],
      ),
    );
  }
}
