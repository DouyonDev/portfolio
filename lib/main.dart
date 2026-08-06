import 'package:flutter/material.dart';

import 'CustomCursor.dart';
import 'pages/main_page.dart';

void main() {
  runApp(MyPortfolio());
}


/// Application principale
class MyPortfolio extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      /*builder: (context, child) {
        return MouseRegion(
          cursor: SystemMouseCursors.none,
          child: CustomCursor(child: child!),
        );
      },*/
      scrollBehavior: MaterialScrollBehavior().copyWith(
        physics: BouncingScrollPhysics(),
      ),
      debugShowCheckedModeBanner: false,
      title: 'Portfolio Abdoulaye',
      home: HomePage(),
    );
  }
}
