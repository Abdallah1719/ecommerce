import 'package:ecommerce_app/app.dart';
import 'package:ecommerce_app/core/services/service_locator.dart';
import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  ServiceLocator().init();
  runApp(const App());
}
