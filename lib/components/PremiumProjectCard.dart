import 'package:flutter/material.dart';
import 'package:portfolio/utils.dart';

class PremiumProjectCard extends StatefulWidget {
  final String title;
  final String description;

  PremiumProjectCard({required this.title, required this.description});

  @override
  _PremiumProjectCardState createState() => _PremiumProjectCardState();
}

class _PremiumProjectCardState extends State<PremiumProjectCard> {
  bool hover = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => hover = true),
      onExit: (_) => setState(() => hover = false),
      child: AnimatedContainer(
        duration: Duration(milliseconds: 300),
        width: 280,
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          gradient: hover
              ? LinearGradient(colors: [Colors.blue, Colors.purple])
              : LinearGradient(colors: [Colors.white10, Colors.white12]),
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            if (hover)
              BoxShadow(
                color: Colors.blue.withOpacity(0.4),
                blurRadius: 20,
              )
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(widget.title,
                style: TextStyle(color: Colors.white, fontSize: 20)),
            SizedBox(height: 10),
            Text(widget.description,
                style: TextStyle(color: Colors.white70)),
          ],
        ),
      ),
    );
  }
}