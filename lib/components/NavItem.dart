import 'package:flutter/material.dart';

class NavItem extends StatefulWidget {
  final String text;
  final VoidCallback onTap;

  const NavItem(this.text, this.onTap);

  @override
  State<NavItem> createState() => _NavItemState();
}

class _NavItemState extends State<NavItem> {
  bool isHover = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => isHover = true),
      onExit: (_) => setState(() => isHover = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: Duration(milliseconds: 300),
          margin: EdgeInsets.symmetric(horizontal: 10),
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: isHover ? Colors.white10 : Colors.transparent,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                widget.text,
                style: TextStyle(
                  color: isHover ? Colors.white : Colors.white70,
                  fontWeight: FontWeight.w500,
                ),
              ),

              SizedBox(height: 5),

              /// 🔥 petite ligne animée
              AnimatedContainer(
                duration: Duration(milliseconds: 300),
                height: 2,
                width: isHover ? 20 : 0,
                color: Colors.blueAccent,
              )
            ],
          ),
        ),
      ),
    );
  }
}