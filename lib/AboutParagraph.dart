import 'package:flutter/material.dart';

class AboutParagraph extends StatelessWidget {
  final String text;

  const AboutParagraph(this.text);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: Colors.white70,
        fontSize: 16,
        height: 1.6, // 👉 meilleur confort de lecture
      ),
    );
  }
}