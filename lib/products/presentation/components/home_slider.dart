// import 'package:flutter/material.dart';

// class HomeSlider extends StatelessWidget {
//   const HomeSlider({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       height: 200, // ارتفاع ListView
//       child: ListView.builder(
//         scrollDirection: Axis.horizontal, // جعل القائمة أفقية
//         itemCount: 10,
//         itemBuilder: (context, index) {
//           return Padding(
//             padding: EdgeInsets.all(8.0),
//             child: ClipRRect(
//               borderRadius: BorderRadius.circular(12),
//               child: Image.asset(
//                 'asstes/image1.jpg',
//                 width: 300, // عرض كل صورة
//                 fit: BoxFit.cover,
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';

// class HomeSlider extends StatefulWidget {
//   const HomeSlider({super.key});

//   @override
//   _HomeSliderState createState() => _HomeSliderState();
// }

// class _HomeSliderState extends State<HomeSlider>
//     with SingleTickerProviderStateMixin {
//   late ScrollController _scrollController;
//   late AnimationController _animationController;
//   final int itemCount = 10;
//   final double itemWidth = 300 + 16; // عرض الصورة + الـ padding

//   @override
//   void initState() {
//     super.initState();

//     _scrollController = ScrollController();
//     _animationController = AnimationController(
//       vsync: this,
//       duration: const Duration(seconds: 1), // مدة الحركة
//     ); // هنا كان ينقص إغلاق القوس

//     // بدء الحركة بعد تأخير بسيط
//     Future.delayed(const Duration(minutes: 1), () {
//       _startAutoScroll();
//     });
//   }

//   void _startAutoScroll() {
//     final double maxScrollExtent = _scrollController.position.maxScrollExtent;

//     _animationController.addListener(() {
//       if (_scrollController.hasClients) {
//         _scrollController.jumpTo(_animationController.value * maxScrollExtent);
//       }
//     });

//     // تكرار الحركة ذهابًا وإيابًا
//     _animationController.repeat(reverse: true);
//   }

//   @override
//   void dispose() {
//     _animationController.dispose();
//     _scrollController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       height: 200,
//       child: ListView.builder(
//         controller: _scrollController,
//         scrollDirection: Axis.horizontal,
//         itemCount: itemCount,
//         itemBuilder: (context, index) {
//           return Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: ClipRRect(
//               borderRadius: BorderRadius.circular(12),
//               child: Image.asset(
//                 'asstes/image1.jpg', // تأكد من صحة مسار الصورة
//                 width: 300,
//                 fit: BoxFit.cover,
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';

// class HomeSlider extends StatefulWidget {
//   const HomeSlider({super.key});

//   @override
//   _HomeSliderState createState() => _HomeSliderState();
// }

// class _HomeSliderState extends State<HomeSlider>
//     with SingleTickerProviderStateMixin {
//   late ScrollController _scrollController;
//   late AnimationController _animationController;
//   final int itemCount = 10;
//   final double itemWidth = 300 + 16; // عرض الصورة + الـ padding
//   int _currentIndex = 0;

//   @override
//   void initState() {
//     super.initState();

//     _scrollController = ScrollController();
//     _animationController = AnimationController(
//       vsync: this,
//       duration: const Duration(seconds: 1), // مدة الحركة بين الصور
//     );

//     // بدء الحركة بعد تأخير بسيط
//     Future.delayed(const Duration(seconds: 1), _autoScrollToNext);
//   }

//   void _autoScrollToNext() {
//     if (_currentIndex < itemCount - 1) {
//       _currentIndex++;
//       _scrollController
//           .animateTo(
//             _currentIndex * itemWidth,
//             duration: const Duration(seconds: 1),
//             curve: Curves.easeInOut,
//           )
//           .then((_) {
//             Future.delayed(const Duration(seconds: 3), _autoScrollToNext);
//           });
//     }
//   }

//   @override
//   void dispose() {
//     _animationController.dispose();
//     _scrollController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       height: 200,
//       child: ListView.builder(
//         controller: _scrollController,
//         scrollDirection: Axis.horizontal,
//         itemCount: itemCount,
//         itemBuilder: (context, index) {
//           return Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: ClipRRect(
//               borderRadius: BorderRadius.circular(12),
//               child: Image.asset(
//                 'asstes/image1.jpg',
//                 width: 300,
//                 fit: BoxFit.cover,
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';

class HomeSlider extends StatefulWidget {
  const HomeSlider({super.key});

  @override
  _HomeSliderState createState() => _HomeSliderState();
}

class _HomeSliderState extends State<HomeSlider> {
  late ScrollController _scrollController;
  final int _realItemCount = 10; // عدد الصور الحقيقي
  final double _itemWidth = 300 + 16; // عرض الصورة + الـ padding
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _startAutoScroll();
  }

  void _startAutoScroll() {
    Future.delayed(const Duration(seconds: 3), () {
      if (!mounted) return; // تجنب الأخطاء إذا تم إغلاق الواجهة

      _currentIndex++;

      // إذا وصلنا لنهاية الصور الحقيقية، نعود للبداية بدون حركة عكسية
      if (_currentIndex >= _realItemCount) {
        _currentIndex = 0;
        _scrollController.jumpTo(0); // العودة فورًا للصورة 1
      }

      // التمرير للصورة التالية
      _scrollController.animateTo(
        _currentIndex * _itemWidth,
        duration: const Duration(seconds: 1),
        curve: Curves.easeInOut,
      );

      // الاستمرار في الحركة
      _startAutoScroll();
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: ListView.builder(
        controller: _scrollController,
        scrollDirection: Axis.horizontal,
        itemCount: _realItemCount, // نعرض فقط الصور الحقيقية
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                'asstes/image1.jpg',
                width: 300,
                fit: BoxFit.cover,
              ),
            ),
          );
        },
      ),
    );
  }
}
