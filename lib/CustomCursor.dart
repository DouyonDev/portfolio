import 'package:flutter/material.dart';
import 'package:portfolio/utils.dart';

class CustomCursor extends StatefulWidget {
  final Widget child;
  CustomCursor({required this.child});

  @override
  _CustomCursorState createState() => _CustomCursorState();
}

class _CustomCursorState extends State<CustomCursor> {
  Offset position = Offset.zero;

  @override
  Widget build(BuildContext context) {
    return Listener(
      onPointerHover: (event) {
        setState(() {
          position = event.position;
        });
      },
      child: Stack(
        children: [
          widget.child,

          Positioned(
            left: position.dx - 10,
            top: position.dy - 10,
            child: Container(
              width: 20,
              height: 20,
              decoration: BoxDecoration(
                color: Colors.blueAccent,
                shape: BoxShape.circle,
              ),
            ),
          )
        ],
      ),
    );
  }
}