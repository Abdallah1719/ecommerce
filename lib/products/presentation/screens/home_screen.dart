import 'package:ecommerce_app/core/global/global-widgets/custom_size_box.dart';
import 'package:ecommerce_app/core/global/global-widgets/global_appbar.dart';
import 'package:ecommerce_app/generated/l10n.dart';
import 'package:ecommerce_app/products/presentation/components/categories_listview.dart';
import 'package:ecommerce_app/products/presentation/components/home_slider.dart';
import 'package:ecommerce_app/products/presentation/components/home_titles.dart';
import 'package:ecommerce_app/products/presentation/components/products_gridview.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GlobalAppBar(),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: S.of(context).home,
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: S.of(context).account,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: S.of(context).cart,
          ),
        ],
      ),

      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: Center(child: Text(S.of(context).working_hours)),
          ),
          HomeSlider(),
          HomeTitles(
            text: S.of(context).categoriess,
            buttonText: S.of(context).viewAll,
          ),
          CategoriesListView(),
          HomeTitles(
            text: S.of(context).popularProducts,
            buttonText: S.of(context).shopNow,
          ),
          ProductGridView(),
        ],
      ),
    );
  }
}
