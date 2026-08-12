import 'package:flutter/material.dart';
import 'package:portfolio/core/theme/app_theme.dart';
import 'package:portfolio/pages/main_page.dart';

void main() {
  runApp(const MyPortfolio());
}

class MyPortfolio extends StatelessWidget {
  const MyPortfolio({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      scrollBehavior: MaterialScrollBehavior().copyWith(
        physics: const BouncingScrollPhysics(),
      ),
      debugShowCheckedModeBanner: false,
      title: 'Portfolio Abdoulaye Douyon',
      theme: AppTheme.darkTheme,
      home: const HomePage(),
    );
  }
}
