import 'package:ecommerce_app/core/global/global-widgets/global_appbar.dart';
import 'package:ecommerce_app/core/services/service_locator.dart';
import 'package:ecommerce_app/generated/l10n.dart';
import 'package:ecommerce_app/products/domain/usecases/get_home_sliders_usecase.dart';
import 'package:ecommerce_app/products/presentation/components/categories_listview.dart';
import 'package:ecommerce_app/products/presentation/components/home_slider.dart';
import 'package:ecommerce_app/products/presentation/components/home_titles.dart';
import 'package:ecommerce_app/products/presentation/components/products_gridview.dart';
import 'package:ecommerce_app/products/presentation/controller/bloc/home_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<HomeBloc>()..add(GetHomeSliderEvent()),

      child: Scaffold(
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
      ),
    );
  }
}
