import 'package:flutter/material.dart';

class ExperienceItem extends StatefulWidget {
  final String title;
  final String company;
  final String period;
  final String description;
  final IconData icon;

  ExperienceItem({
    required this.title,
    required this.company,
    required this.period,
    required this.description,
    required this.icon,
  });

  @override
  _ExperienceItemState createState() => _ExperienceItemState();
}

class _ExperienceItemState extends State<ExperienceItem> {
  bool hover = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => hover = true),
      onExit: (_) => setState(() => hover = false),
      child: AnimatedContainer(
        duration: Duration(milliseconds: 300),
        margin: EdgeInsets.symmetric(vertical: 20),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            /// TIMELINE (ligne + point)
            Column(
              children: [
                AnimatedContainer(
                  duration: Duration(milliseconds: 300),
                  width: 20,
                  height: 20,
                  decoration: BoxDecoration(
                    color: hover ? Colors.blue : Colors.white,
                    shape: BoxShape.circle,
                  ),
                ),
                Container(
                  width: 2,
                  height: 120,
                  color: Colors.white24,
                ),
              ],
            ),

            SizedBox(width: 20),

            /// CARTE EXPERIENCE
            Expanded(
              child: AnimatedContainer(
                duration: Duration(milliseconds: 300),
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: hover
                      ? Colors.blue.withOpacity(0.1)
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    /// HEADER
                    Row(
                      children: [
                        Icon(widget.icon,
                            color: Colors.blueAccent),
                        SizedBox(width: 10),

                        Expanded(
                          child: Text(
                            widget.title,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),

                        Text(
                          widget.period,
                          style: TextStyle(
                            color: Colors.white60,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: 8),

                    Text(
                      widget.company,
                      style: TextStyle(
                        color: Colors.blueAccent,
                        fontWeight: FontWeight.w500,
                      ),
                    ),

                    SizedBox(height: 10),

                    Text(
                      widget.description,
                      style: TextStyle(color: Colors.white70),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}