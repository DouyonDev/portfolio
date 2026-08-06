import 'package:flutter/material.dart';
import '../../core/constants/breakpoints.dart';

class Responsive extends StatelessWidget {
  final Widget mobile;
  final Widget tablet;
  final Widget desktop;

  const Responsive({
    required this.mobile,
    required this.tablet,
    required this.desktop,
  });

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    if (width < Breakpoints.mobile) return mobile;
    if (width < Breakpoints.tablet) return tablet;
    return desktop;
  }
}