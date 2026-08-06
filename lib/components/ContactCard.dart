import 'package:flutter/material.dart';

class ContactCard extends StatefulWidget {
  final IconData icon;
  final String title;
  final String value;
  final VoidCallback? onTap;
  final VoidCallback? onCopy;

  ContactCard({
    required this.icon,
    required this.title,
    required this.value,
    this.onTap,
    this.onCopy,
  });

  @override
  _ContactCardState createState() => _ContactCardState();
}

class _ContactCardState extends State<ContactCard> {
  bool hover = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => hover = true),
      onExit: (_) => setState(() => hover = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: Duration(milliseconds: 300),
          width: 260,
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: hover
                ? Colors.blue.withOpacity(0.2)
                : Colors.white10,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: hover ? Colors.blue : Colors.white24,
            ),
            boxShadow: hover
                ? [
              BoxShadow(
                color: Colors.blue.withOpacity(0.3),
                blurRadius: 20,
              )
            ]
                : [],
          ),
          child: Column(
            children: [

              Icon(widget.icon,
                  size: 30, color: Colors.blueAccent),

              SizedBox(height: 10),

              Text(
                widget.title,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),

              SizedBox(height: 5),

              Text(
                widget.value,
                style: TextStyle(color: Colors.white70),
                textAlign: TextAlign.center,
              ),

              /// BOUTON COPIER EMAIL
              if (widget.onCopy != null) ...[
                SizedBox(height: 10),
                TextButton(
                  onPressed: widget.onCopy,
                  child: Text("Copier"),
                )
              ]
            ],
          ),
        ),
      ),
    );
  }
}