import 'package:ecommerce_app/app.dart';
import 'package:ecommerce_app/core/services/service_locator.dart';
import 'package:ecommerce_app/products/presentation/controller/bloc/home_bloc.dart';
import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  ServiceLocator().init();
  runApp(const App());
  final bloc = HomeBloc(sl(), sl(), sl());

  bloc.stream.listen((state) {
    print('State Update: $state');
  });
}
