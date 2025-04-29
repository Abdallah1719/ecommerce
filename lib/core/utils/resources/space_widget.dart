import 'package:ecommerce_app/core/utils/resources/size_config.dart';
import 'package:flutter/cupertino.dart';

class HorizintalSpace extends StatelessWidget {
  const HorizintalSpace(this.value, {super.key});
  final double? value;
  @override
  Widget build(BuildContext context) {
    return SizedBox(width: SizeConfig.defaultSize! * value!);
  }
}

class VerticalSpace extends StatelessWidget {
  const VerticalSpace(this.value, {super.key});
  final double? value;
  @override
  Widget build(BuildContext context) {
    return SizedBox(height: SizeConfig.defaultSize! * value!);
  }
}
