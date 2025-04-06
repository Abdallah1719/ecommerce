import 'package:flutter/material.dart';

class CustomSizeBox extends StatelessWidget {
  final double? height;
  final double? width;

  const CustomSizeBox.height(this.height, {super.key}) : width = null;

  const CustomSizeBox.width(this.width, {super.key}) : height = null;

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: height, width: width);
  }
}
