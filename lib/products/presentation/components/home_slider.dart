import 'package:flutter/material.dart';

class HomeSlider extends StatelessWidget {
  const HomeSlider({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200, // ارتفاع ListView
      child: ListView.builder(
        scrollDirection: Axis.horizontal, // جعل القائمة أفقية
        itemCount: 10,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.all(8.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                'asstes/image1.jpg',
                width: 300, // عرض كل صورة
                fit: BoxFit.cover,
              ),
            ),
          );
        },
      ),
    );
  }
}
