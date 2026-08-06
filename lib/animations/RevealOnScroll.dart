import 'package:flutter/material.dart';
import 'package:portfolio/utils.dart';

class RevealOnScroll extends StatefulWidget {
  final Widget child;

  RevealOnScroll({required this.child});

  @override
  _RevealOnScrollState createState() => _RevealOnScrollState();
}

class _RevealOnScrollState extends State<RevealOnScroll>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> opacity;
  late Animation<Offset> slide;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 800),
    );

    opacity = Tween(begin: 0.0, end: 1.0).animate(controller);

    slide = Tween(
      begin: Offset(0, 0.2),
      end: Offset.zero,
    ).animate(controller);



    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: opacity,
      child: SlideTransition(
        position: slide,
        child: widget.child,
      ),

    );
  }
}