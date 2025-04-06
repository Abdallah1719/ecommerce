// import 'package:flutter/material.dart';

// class GlobalAppbar extends StatelessWidget implements PreferredSizeWidget {
//   const GlobalAppbar({super.key, this.height = kToolbarHeight});
//   final double height;
//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       height: height,
//       child: AppBar(
//         title: Text("data"),
//         actions: [
//           TextField(
//             decoration: InputDecoration(
//               border: OutlineInputBorder(
//                 borderSide: BorderSide(color: Colors.black),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   @override
//   // TODO: implement preferredSize
//   Size get preferredSize => const Size.fromHeight(kToolbarHeight);
// }
import 'package:ecommerce_app/generated/l10n.dart';
import 'package:flutter/material.dart';

class GlobalAppBar extends StatelessWidget implements PreferredSizeWidget {
  const GlobalAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: Size.fromHeight(110),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.blue,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 4,
              offset: Offset(0, 2),
            ),
          ],
        ),
        padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 22),

              child: TextField(
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search),
                  hintText: S.of(context).search_text,
                  hintStyle: TextStyle(color: Colors.white70),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                  ),
                ),
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(110);
}
