import 'package:ecommerce_app/core/utils/resources/index.dart';
import 'package:flutter/material.dart';

class SecondaryButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const SecondaryButton({
    super.key,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: R.colors.lightgreen1,
      ),

      child: TextButton(
        onPressed: onPressed,
        child: Text(
          text,
          style: TextStyle(color: R.colors.darkgreen, fontSize: R.fontSize.s18),
        ),
      ),
    );
  }
}
