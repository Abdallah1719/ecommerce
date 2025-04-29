import 'package:dots_indicator/dots_indicator.dart';
import 'package:ecommerce_app/core/utils/resources/index.dart';
import 'package:flutter/material.dart';

class CustomIndicator extends StatelessWidget {
  const CustomIndicator({super.key, @required this.dotIndex});
  final double? dotIndex;
  @override
  Widget build(BuildContext context) {
    return DotsIndicator(
      decorator: DotsDecorator(
        color: Colors.transparent,
        activeColor: R.colors.lightgreen,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
          side: BorderSide(color: R.colors.lightgreen),
        ),
      ),
      dotsCount: 3,
      position: dotIndex!,
    );
  }
}
