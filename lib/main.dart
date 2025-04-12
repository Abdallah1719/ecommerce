import 'package:ecommerce_app/app.dart';
import 'package:ecommerce_app/core/services/service_locator.dart';
import 'package:flutter/material.dart';

void main() {
  ServiceLocator().init();
  runApp(const App());
}
