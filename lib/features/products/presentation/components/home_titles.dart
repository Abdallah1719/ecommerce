import 'package:flutter/material.dart';

class HomeTitles extends StatelessWidget {
  const HomeTitles({super.key, required this.text, required this.buttonText});
  final String text;
  final String buttonText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(text),
          ElevatedButton(onPressed: () {}, child: Text(buttonText)),
        ],
      ),
    );
  }
}
