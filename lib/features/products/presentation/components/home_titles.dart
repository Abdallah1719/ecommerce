import 'package:ecommerce_app/core/utils/resources/index.dart';
import 'package:flutter/material.dart';

class HomeTitles extends StatelessWidget {
  const HomeTitles({
    super.key,
    required this.text,
    required this.buttonText,
    this.onTap,
  });
  final String text;
  final String buttonText;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(text, style: Theme.of(context).textTheme.headlineSmall),

          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: R.colors.lightgreen, width: 1.0),
            ),
            child: GestureDetector(
              onTap: onTap,
              child: Padding(
                padding: const EdgeInsets.only(
                  top: 8.0,
                  bottom: 8.0,
                  left: 12,
                  right: 12,
                ),
                child: Text(
                  buttonText,
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
